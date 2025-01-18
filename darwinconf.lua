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
    os.execute('docker run --rm --volume "$(pwd):/app:z" debian_yahr bash -c "cd /app && darwin build darwinconf.lua --install_dependencies_direct"')
end


if is_argv_present("--install_dependencies_direct")  then
    download_zip_from_git("https://github.com/OUIsolutions/LuaDoTheWorld/archive/fd4be9a74f5ba1190c4b7195c111bc18cb3f24c3.zip","LuaDoTheWorld")
    download_zip_from_git("https://github.com/SamuelHenriqueDeMoraisVitrio/SerjaoBerranteiroServer/archive/b46715ef0f19ac90ff72410439330cfb74dde929.zip","serjao_berranteiro")

end 

if is_argv_present("--build_code") then
    darwin.c_include("../dependencies/serjao_berranteiro/SerjaoBerranteiroServer-3/src/main.c")
    darwin.add_lua_file("server.lua")
    darwin.generate_c_executable_output({ output_name = "release/yahr.c" })
end


if is_argv_present("--compile_linux_direct") then 
    os.execute("gcc -o  release/yahr --static release/yahr.c ")
end


if is_argv_present("--compile_windows_direct") then 
    os.execute("x86_64-w64-mingw32-gcc -o release/yahr.exe release/yahr.c ")
end

