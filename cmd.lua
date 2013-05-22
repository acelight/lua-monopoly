--------------------------------------------------------------------------------
-- Readline Functions

    local prompt = '>> '

    local rl, readline, saveline
    local err = pcall(function()
        rl = require 'readline'
        readline = rl.readline
        saveline = rl.add_history
    end)

    if not rl then
        print 'not rl'
        function readline (prompt)
            io.write (prompt)
            return io.read()
        end
        saveline = function(s) end
    end

local Cmd = {}

    function Cmd.interpret (self, input)

		local input = string.lower (input)
        local func = string.match (input, '^([%w]+)')
        local args_string = string.gsub (input, '^'..func..'(.*)', '%1')
        local arg_list = {}

        for arg in string.gmatch (args_string, '(%w+)') do
            if arg == nil or arg == ' ' then
            else
                table.insert (arg_list, arg)
            end
        end

        if Cmds[func] then
            Cmds[func](arg_list)
        else
            print ('Command Not Found: '..input)
        end
	end

    function Cmd.get (self)

        local input = readline(prompt)

        if input ~= '' and input ~= nil then
            local input = string.gsub(input, '\n', '')
            saveline (input)
            self:interpret (input)
        end
        self:get ()

    end

return Cmd