

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
    os.execute("curl -L https://github.com/OUIsolutions/CWebStudio/releases/download/v3.002/CWebStudio.h -o dependencies/CWebStudio.h")
    os.execute("curl -L https://github.com/SamuelHenriqueDeMoraisVitrio/SerjaoBerranteiroServer/archive/refs/tags/V3.zip -o dependencies/V3.zip")
    os.execute("unzip dependencies/V3.zip -d dependencies/serjao_berranteiro")    
    os.execute("curl -L https://github.com/OUIsolutions/LuaDoTheWorld/archive/refs/tags/0.74.zip -o dependencies/0.74.zip")
    os.execute("unzip dependencies/0.74.zip -d dependencies/lua_do_the_world")
    
    
end 

darwin.c_include("../dependencies/serjao_berranteiro/SerjaoBerranteiroServer-3/src/main.c")
darwin.add_lua_file("server.lua")
darwin.generate_c_executable_output({ output_name = "release/yahr.c" })

if is_argv_present("--compile_linux") then 
    os.execute("gcc -o release/yahr release/yahr.c ")
end


if is_argv_present("--compile_windows") then 
    os.execute("x86_64-w64-mingw32-gcc -o release/yahr.exe release/yahr.c ")
end