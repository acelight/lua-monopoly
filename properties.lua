-- Buying Properties

    function purchase (player1, property)
        -- Add to properties
        transfer (bank, player1, amount)
    end

    -- Buyer, finder, property, value
    function auction (player1, player2, property, value)
        if player1:query (value + (value * 0.1)) then
            transfer (bank, player1, value)
            transfer (player2, player1, value * 0.1)
            -- player1 by house
        else
            print 'Insufficient Funds. Applying Penalties'
            transfer (bank, player1, value * 0.2)
            transfer (player2, player1, value * 0.1)
        end
    end


-- End Buying Properties