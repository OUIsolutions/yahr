

function is_argv_present()
    for i, v in ipairs(arg) do
        if v == arg then
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
end 
