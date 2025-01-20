local os_name = os.getenv("os")
if os_name then
    print("Sistema operacional: " .. os_name)
else
    print("Não foi possível determinar o sistema operacional.")
end
