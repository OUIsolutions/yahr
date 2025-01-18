

local function main_server()

  return serjao.send_text("Hello Word", 200)

end


function main()
    serjao.server(3000, 5000, main_server)
end 

