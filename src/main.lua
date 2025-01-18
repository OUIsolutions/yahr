plotage_area = {}
diggest_mode = "time"
delay        = 100



function main()
    plotage_area = argv.get_flag_args({ "plotage", "p" })
    if #plotage_area == 0 then
        plotage_area = { dtw.get_absolute_path() }
    end
    for i = 1, #arg do
        local possible_arg = arg[i]
        if possible_arg == "help" or possible_arg == "--help" then
            print(ASSETS['help.txt'])
            return
        end
    end

    if argv.flags_exist({ "diggest_mode" }) then
        local digest_mode_flags = argv.get_flag_args({ "diggest_mode" })
        if #digest_mode_flags == 0 then
            error("diggest flag cannot be empty")
        end

        diggest_mode = digest_mode_flags[1]
        if diggest_mode ~= "content" and diggest_mode ~= "time" then
            error("invalid diggest mode ,type --help for more information")
        end
    end
    if argv.flags_exist({ "delay", "d" }) then
        local delay_flags = argv.get_flag_args({ "delay", "d" })
        if #delay_flags == 0 then
            error("delay cannot be empty")
        end
        delay = tonumber(delay_flags[1])
        if not delay then
            error("delay must be a number")
        end
    end

    serjao.server(3000, 5000, main_server)
end
