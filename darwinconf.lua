function is_argv_present(tested_arg)
    for i, v in ipairs(arg) do
        if v == tested_arg then
            return true
        end
    end
    return false
end
function download_zip_from_git(url,dest_name)
    os.execute("mkdir -p buffer")
    os.execute("curl -L " .. url .." -o buffer/output.zip") 
    os.execute("unzip buffer/output.zip -d buffer")    
    dtw.remove_any("buffer/output.zip")
    local buffer = dtw.list_all("buffer",true)[1]
    dtw.move_any_overwriting(buffer,"dependencies/"..dest_name)
    dtw.remove_any("buffer")
    
end 
if is_argv_present("--create_docker_images") then
    os.execute("docker build -t alpine_yahr -f images/alpine.Dockerfile .")
    os.execute("docker build -t debian_yahr -f images/debian.Dockerfile .")
end
if is_argv_present("--install_dependencies") then
    os.execute('docker run --rm --volume "$(pwd):/app:z" debian_yahr sh -c "cd /app && darwin build darwinconf.lua --install_dependencies_direct"')
end


if is_argv_present("--install_dependencies_direct")  then
    download_zip_from_git("https://github.com/OUIsolutions/LuaDoTheWorld/archive/fd4be9a74f5ba1190c4b7195c111bc18cb3f24c3.zip","LuaDoTheWorld")
    download_zip_from_git("https://github.com/SamuelHenriqueDeMoraisVitrio/SerjaoBerranteiroServer/archive/577fd98dcf2c150f8411e27c58824c89293d0284.zip","serjao_berranteiro")
    os.execute("curl -L https://github.com/OUIsolutions/LuaCEmbed/releases/download/v0.780/LuaCEmbed.h -o dependencies/LuaCEmbed.h")
end 

if is_argv_present("--build_code") then
    darwin.add_c_code('#include "../dependencies/serjao_berranteiro/src/main.c"\n')
    darwin.add_c_code('#include "../dependencies/LuaCEmbed.h"\n')
    local CONCAT_PATH = true 
    local src = dtw.list_files_recursively("src",CONCAT_PATH)
    for i=1,#src do
        darwin.add_lua_file(src[i])
    end
    darwin.add_lua_code("main()")
    darwin.generate_c_executable_output({ output_name = "release/yahr.c" ,include_lua_cembed=false })
end

if is_argv_present("--compile_linux") then 
    os.execute('docker run --rm --volume "$(pwd):/app:z" alpine_yahr sh -c "cd /app && darwin build darwinconf.lua --compile_linux_direct"')
end
if is_argv_present("--compile_linux_direct") then 
    os.execute("gcc -o  release/yahr.out --static release/yahr.c ")
end

if is_argv_present("--compile_windows") then 
    os.execute('docker run --rm --volume "$(pwd):/app:z" debian_yahr sh -c "cd /app && darwin build darwinconf.lua --compile_windows_direct "')
end
if is_argv_present("--compile_windows_direct") then 
    os.execute("i686-w64-mingw32-gcc   -o release/yahr.exe release/yahr.c -lws2_32")
end

