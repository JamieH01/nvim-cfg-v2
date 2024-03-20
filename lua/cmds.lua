local api = vim.api

api.nvim_create_user_command('Src',
    function(opts)
        local path = 'src/' .. opts.fargs[1]

        if io.open(path, "r") ~= nil then
            error("File already exists")
            return
        end

        local file = io.open(path, "w")
        file:write("")
        file:close()
        vim.cmd('e ' .. path)
        require('harpoon.mark').add_file()
    end,
    { nargs = 1 })

api.nvim_create_user_command('SrcC',
    function(opts)
        local mk_file = function (path)
            local file = io.open(path, "w")
            file:write("")
            file:close()
        end

        local c_path = 'src/' .. opts.fargs[1] .. ".cpp"
        local h_path = 'src/include/' .. opts.fargs[1] .. ".h"

        if io.open(c_path, "r") ~= nil then
            error("File already exists")
            return
        end
        
        mk_file(c_path)
        mk_file(h_path)

        vim.cmd('e ' .. c_path)
        require('harpoon.mark').add_file()

    end,
    { nargs = 1 })

