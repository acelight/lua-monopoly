
    local Players = {}

    function Players:init (player)
        print ('Creating Player: '..player)
        if Player_list[player] then
            print (player..' already exists!')
        else
            Player_list[player] = dofile 'player.lua'
            print 'Player Created'
        end
    end

    return Players