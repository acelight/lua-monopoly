local Cmds = {}

    function Cmds.quit (args)
        os.exit (0)
    end

    Cmds.exit = Cmds.quit

    function Cmds.help (args)
    print [[Monopoly Manager Help

    ]]
    end

    function Cmds.display (arg_list)

        if Player_list[arg_list[1]] then
            local player = Player_list[arg_list[1]]
            player:display ()
        end

    end

    function Cmds.create (arg_list)

        if arg_list[1] then
            Players:init (arg_list[1])
        end

    end

    function Cmds.go (arg_list)

        if Player_list[arg_list[1]] then

            local player = Player_list[arg_list[1]]
            local landed = arg_list[2] ~= nil and arg_list[2] or nil

            Movement:go (player, landed)

        end

    end

    function Cmds.trans (arg_list)

        if Player_list[arg_list[1]] and Player_list[arg_list[2]] and arg_list[3] then

            local payee = Player_list[arg_list[1]]
            local payer = Player_list[arg_list[2]]
            local amount = tonumber (arg_list[3])

            --~ print (payee, payer, amount)

            local amount = amount > 0 and amount or 0

            --~ print (payee, payer, amount)

            Bank:transfer (payee, payer, amount)

        end

    end

return Cmds