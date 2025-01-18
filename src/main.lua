

local function main_server(server)
  local content = dtw.load_file(server.route)  
  if not content then
    return serjao.send_raw(assets["not_found.html"],"application/html",404)
  end 
  return serjao.send_text("Hello Word", 200)
end


function main()
    serjao.server(3000, 5000, main_server)
end 

