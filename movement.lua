
    local Movement = {}

    function Movement:go (player, landed)

        --~ print (player, landed)
        local bank = Player_list['bank']

		if landed then
			if player.worth > GO_AMOUNT * 2 then
                Bank:transfer (player, bank, GO_AMOUNT)
			else
                Bank:transfer (player, bank, GO_AMOUNT * 2)
			end
            --stock.landed
		else
            --~ print (player, bank)
			Bank:transfer (player, bank, GO_AMOUNT)
            --stock.passed
		end
	end

	function Movement:railway (player1, player2, num_rails, faire)
		local payment = ( RENT_FACTOR ( rent.railway * num_rails ) )

		if faire then
			payment = payment * 1.1
		else
			payment = payment / 2
		end

		Bank:transfer (player1, player2, payment)
	end

	function Movement:jail (player, turn)

		if turn == 0 then
            if player:query (player.worth * 0.2) then
                if query then
					Bank:debit (player, (player.worth * JAIL_BAIL_ZERO) )
				end
            end

		elseif turn == 1 then
			 if player:query (player.worth * 0.15) then
                if query then
					Bank:debit (player, (player.worth * 0.15) )
				end
            end

		else
			local worth = player.worth * 0.1
			local balance = player.balance * 0.1

			if worth > balance then
                if player:query (worth) then
                    Bank:debit (player, worth)
                else
                    print ("Insufficient balance to pay jail")
                    print ("£"..worth.." needed. Current balance: £"..player.balance)
                end
			else
                if player:query (balance) then
                    Bank:debit (player, balance)
                else
                    print ("Insufficient balance to pay jail")
                    print ("£"..worth.." needed. Current balance: £"..player.balance)
                end
			end
		end
	end

    return Movement