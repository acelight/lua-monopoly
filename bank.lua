-- Financial Transactions

    local Bank = {}

	function Bank.transfer (self, payee, payer, amount)
        --~ print (payee, payer, amount)
		if self:debit (payer, amount) then
			self:credit (payee, amount)
		end
	end

	function Bank.debit (self, player, amount)
        --~ print (player, amount)
		if player:withdraw (amount) then
            return true
        end
	end

	function Bank.credit (self, player, amount)
		if player:deposit (amount) then
            return true
        end
	end

    return Bank

-- End Financial Transactions