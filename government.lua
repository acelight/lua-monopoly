
	Account = {}

	Account.balance = 0
	Account.value = 0
	Account.loan = 0
	Account.railways = 0
    Account.properties = {}

    Account.query = function (self, amount)
        if self.balance >= amount then
            return true
        else
            return false
        end
    end

	Account.deposit = function (self, amount)
		self.balance = self.balance + amount
	end

	Account.withdraw = function (self, amount)
		if self.balance < amount then
			print "Insufficient Funds to Withdraw Amount"
			return false
		else
			self.balance = self.balance - amount
			return true
		end
	end

	Account.addvalue = function (self, amount)
		self.value = self.value + amount
	end

	Account.decvalue = function (self, amount)
		if self.value < amount then
			print "Insufficient Value"
			return false
		else
			self.value = self.value - amount
		end
	end

	--~ Account.

	Account.display = function (self)
		print ("Balance: "..self.balance)
		print ("Value: "..self.value)
	end

	return Account
