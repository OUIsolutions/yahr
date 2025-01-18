plotage_area = {}
diggest_mode = "content"

---@param server
local function main_server(server)
    if server.route == "/get_asset" then
        local assset_name = server.params["asset"]
        if not assset_name then
            return serjao.send_text("asset not provided", 404)
        end
        local current_asset = ASSETS[assset_name]
        if not current_asset then
            return serjao.send_text("asset not found ", 404)
        end
        local assset_content_type = get_content_type(assset_name)
        return serjao.send_raw(current_asset, assset_content_type, 200)
    end

    if server.route == "/get_folder_sha" then
        local hasher = dtw.newHasher()
        for i = 1, #plotage_area do
            local current = plotage_area[i]


            if dtw.isfile(current) then
                hasher.digest_file(current)
            end

            if dtw.isdir(current) then
                hasher.digest_folder_by_content(current)
            end
        end
        return serjao.send_text(hasher.get_value(), 200)
    end

    local content = dtw.load_file(server.route)
    if not content then
        return serjao.send_raw(ASSETS["not_found.html"], "text/html", 404)
    end



    return serjao.send_text("Hello Word", 200)
end


function main()
    plotage_area = argv.get_flag_args({ "plotage", "p" })
    if #plotage_area == 0 then
        plotage_area = { "." }
    end


    for i = 1, #arg do
        local possible_arg = arg[i]
        if possible_arg == "help" or possible_arg == "--help" then
            print(ASSETS['help.txt'])
            return
        end
    end

    if argv.flags_exist({ "diggest_mode", "d" }) then
        local digest_mode_flags = argv.get_flag_args({ "diggest_mode", "d" })
        if #digest_mode_flags == 0 then
            error("diggest flag cannot be empty")
        end

        diggest_mode = digest_mode_flags[1]
        if diggest_mode ~= "content" and diggest_mode ~= "time" then
            error("invalid diggest mode ,type --help for more information")
        end
    end


    serjao.server(3000, 5000, main_server)
end
