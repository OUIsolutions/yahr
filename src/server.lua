function insert_js_included_if_match(html, tag)
    local start, endstr = string.find(html, tag)
    if not endstr then
        return nil
    end
    local part_one = string.sub(html, 1, endstr)
    local rest = string.sub(html, endstr + 1, string.len(html))
    return part_one .. "<script src='/get_asset?asset=reloader.js'></script>\n" .. rest
end

---@param server
function main_server(server)
    if server.route == "/get_asset" then
        local assset_name = server.params["asset"]
        if not assset_name then
            return serjao.send_text("asset not provided", 404)
        end

        local current_asset = ASSETS[assset_name]
        if not current_asset then
            return serjao.send_text("asset not found ", 404)
        end
        if assset_name == "reloader.js" then
            current_asset = string.gsub(current_asset, "YAHL_DELAY", delay)
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
            local is_dir = dtw.isdir(current)

            if is_dir and diggest_mode == "content" then
                hasher.digest_folder_by_content(current)
            end


            if is_dir and diggest_mode == "time" then
                hasher.digest_folder_by_last_modification(current)
            end
        end
        return serjao.send_text(hasher.get_value(), 200)
    end

    local file = dtw.get_absolute_path(".") .. server.route
    local content = dtw.load_file(file)
    if not content then
        return serjao.send_raw(ASSETS["not_found.html"], "text/html", 404)
    end
    local content_type = get_content_type(file)
    if content_type == "text/html" then
        local possible_head_replace = insert_js_included_if_match(content, "<head>")

        if possible_head_replace then
            return serjao.send_raw(possible_head_replace, "text/html", 200)
        end

        local possible_body_replace = insert_js_included_if_match(content, "<body>")
        if possible_body_replace then
            return serjao.send_raw(possible_body_replace, "text/html", 200)
        end
        local possible_html_replace = insert_js_included_if_match(content, "<html>")
        if possible_html_replace then
            return serjao.send_raw(possible_html_replace, "text/html", 200)
        end
    end



    return serjao.send_raw(content, content_type, 200)
end
