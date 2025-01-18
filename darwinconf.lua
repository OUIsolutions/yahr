

function is_argv_present(tested_arg)
    for i, v in ipairs(arg) do
        if v == tested_arg then
            return true
        end
    end
    return false
end


    

if is_argv_present("--install_dependencies")  then
    dtw.remove_any("dependencies")
    os.execute("mkdir -p dependencies")
    os.execute("curl -L https://github.com/SamuelHenriqueDeMoraisVitrio/SerjaoBerranteiroServer/archive/refs/tags/V3.zip -o dependencies/V3.zip")
    os.execute("unzip dependencies/V3.zip -d dependencies/serjao_berranteiro")    
    os.execute("curl -L https://github.com/OUIsolutions/LuaDoTheWorld/archive/refs/tags/0.74.zip -o dependencies/0.74.zip")
    os.execute("unzip dependencies/0.74.zip -d dependencies/lua_do_the_world")
end 

--darwin.add_c_file("dependencies/serjao_berranteiro/src/main.c")

local all = dtw.list_files_recursively("src",true)
for i=1,#all do
    darwin.add_lua_file(all[i])
end 
darwin.add_lua_code("main()")
darwin.generate_c_executable_output({ output_name = "release/yahr.c" })

if is_argv_present("--compile_linux") then 
    os.execute("gcc -o release/yahr release/yahr.c ")
end


if is_argv_present("--compile_windows") then 
    os.execute("x86_64-w64-mingw32-gcc -o release/yahr.exe release/yahr.c ")
end