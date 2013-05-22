#!/usr/bin/env lua

    Cmd = require 'cmd'
    Cmds = require 'cmds'
    Movement = require 'movement'
    Bank = require 'bank'

    Players = require 'players'
    Player_list = {}

	GO_AMOUNT = 200
	RENT_FACTOR = 2
	JAIL_BAIL_ZERO = 0.3
	JAIL_BAIL_N = 0.1
    INTEREST_RATE = 0.5

	rent = {}
	rent.railway = 25

	function query ()
		io.write ( '?y ' )
		local input = string.lower ( io.stdin:read"*l" )
		if v == "y" then
			return true
		end
	end

    -- Establishes the Bank
    --~ bank = dofile 'account.lua'
    --~ bank.balance = 10000000

    --~ Players:init ('bank')
    Player_list['bank'] = dofile 'player.lua'
    Player_list['bank']:deposit (10000000)

    Cmd:get ()