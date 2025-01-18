

local function main_server(server)

  if server.route == "/get_asset" then
    local assset_name = server.get_param("asset")
    if not assset_name  then 
        return serjao.send_text("asset not provided",404)
    end 
    local current_asset =  ASSETS[assset_name]
    if not current_asset then
        return serjao.send_text("asset not found ",404)
    end 
    local assset_content_type = get_content_type(assset_name)
    return serjao.send_raw(current_asset,assset_content_type,200)
  end 

  local content = dtw.load_file(server.route)  
  if not content then
    print(ASSETS)
    return serjao.send_raw(ASSETS["not_found.html"],"application/html",404)
  end 
  


  return serjao.send_text("Hello Word", 200)
end


function main()
    serjao.server(3000, 5000, main_server)
end 

