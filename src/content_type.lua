

function get_content_type(name)
    local extension = dtw.newPath(name).get_extension()
    if extension == "html" then
        return "text/html"
    elseif extension == "css" then
        return "text/css"
    elseif extension == "js" then
        return "application/javascript"
    elseif extension == "png" then
        return "image/png"
    elseif extension == "jpg" then
        return "image/jpeg"
    elseif extension == "jpeg" then
        return "image/jpeg"
    elseif extension == "gif" then
        return "image/gif"
    elseif extension == "svg" then
        return "image/svg+xml"
    elseif extension == "ico" then
        return "image/x-icon"
    elseif extension == "json" then
        return "application/json"
    elseif extension == "xml" then
        return "application/xml"
    elseif extension == "pdf" then
        return "application/pdf"
    elseif extension == "zip" then
        return "application/zip"
    elseif extension == "tar" then
        return "application/x-tar"
    elseif extension == "gz" then
        return "application/gzip"
    elseif extension == "mp3" then
        return "audio/mpeg"
    elseif extension == "wav" then
        return "audio/wav"
    elseif extension == "mp4" then
        return "video/mp4"
    elseif extension == "webm" then
        return "video/webm"
    elseif extension == "ogg" then
        return "video/ogg"
    elseif extension == "csv" then
        return "text/csv"
    elseif extension == "txt" then
        return "text/plain"
    elseif extension == "rtf" then
        return "application/rtf"
    elseif extension == "doc" then
        return "application/msword"
    elseif extension == "docx" then
        return "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
    elseif extension == "xls" then
        return "application/vnd.ms-excel"
    elseif extension == "xlsx" then
        return "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    elseif extension == "ppt" then
        return "application/vnd.ms-powerpoint"
    elseif extension == "pptx" then
        return "application/vnd.openxmlformats-officedocument.presentationml.presentation"
    elseif extension == "odt" then
        return "application/vnd.oasis.opendocument.text"
    elseif extension == "ods" then
        return "application/vnd.oasis.opendocument.spreadsheet"
    elseif extension == "odp" then
        return "application/vnd.oasis.opendocument.presentation"
    elseif extension == "odg" then
        return "application/vnd.oasis.opendocument.graphics"
    elseif extension == "odc" then
        return "application/vnd.oasis.opendocument.chart"
    elseif extension == "odf" then
        return "application/vnd.oasis.opendocument.formula"
    elseif extension == "odb" then
        return "application/vnd.oasis.opendocument.database"
    elseif extension == "odm" then
        return "application/vnd.oasis.opendocument.text-master"
    elseif extension == "ott" then
        return "application/vnd.oasis.opendocument.text-template"
    elseif extension == "ots" then
        return "application/vnd.oasis.opendocument.spreadsheet-template"
    elseif extension == "otp" then
        return "application/vnd.oasis.opendocument.presentation-template"
    elseif extension == "otg" then
        return "application/vnd.oasis.opendocument.graphics-template"
    elseif extension == "otc" then
        return "application/vnd.oasis.opendocument.chart-template"
    elseif extension == "otf" then
        return "application/vnd.oasis.opendocument.formula-template"
    elseif extension == "otd" then
        return "application/vnd.oasis.opendocument.database-template"
    elseif extension == "oth" then
        return "application/vnd.oasis.opendocument.text-web"
    elseif extension == "ott" then
        return "application/vnd.oasis.opendocument.text-master"
    elseif extension == "oth" then
        return "application/vnd.oasis.opendocument.text-web"
    elseif extension == "wasm" then
        return "application/wasm"
    else
        return "text/plain"
    end

end 