
	local Player = {}

	Player.balance = 0
	Player.value = 0
    Player.worth = 0

	Player.loan = 0
    Player.properties = {}

    function Player.query (self, amount)
        --~ print (self, amount)
        if self.balance >= amount then
            return true
        else
            return false
        end
    end

    function Player.deposit (self, amount)
		self.balance = self.balance + amount
        self:det_worth()
	end

    function Player.withdraw (self, amount)
		if self:query (amount) then
            self.balance = self.balance - amount
            self:det_worth()
			return true
		else
            print "Insufficient Funds to Withdraw Amount"
			return false
		end
	end

    function Player.addvalue (self, amount)
		self.value = self.value + amount
        self:worth()
	end

    function Player.decvalue (self, amount)
		if self.value < amount then
			print "Insufficient Value"
			return false
		else
			self.value = self.value - amount
            self:det_worth()
		end
	end

    function Player.det_worth (self)
        self.worth = self.balance + self.value
    end

	--~ Player.

    function Player.display (self)
		print ("Balance: "..self.balance.." Value: "..self.value.." Worth: "..self.worth)
	end

	return Player
