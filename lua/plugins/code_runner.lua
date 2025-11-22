return { 
  "CRAG666/code_runner.nvim", 
  lazy = false,
  opts = {
    mode = "float",
    float = {
      border = "rounded",
    },
    -- better_term = {
    --   clean = false,
    -- },
    focus = true,
    -- startinsert = true;
    filetype = {
      c = function(...)
        c_base = {
          "cd $dir &&",
          "gcc $fileName -o",
          "/tmp/$fileNameWithoutExt",
        }
        local c_exec = {
          "&& /tmp/$fileNameWithoutExt &&",
          "rm /tmp/$fileNameWithoutExt",
        }
        vim.ui.input({ prompt = "Add more args:" }, function(input)
          c_base[4] = input
          vim.print(vim.tbl_extend("force", c_base, c_exec))
          require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
        end)
      end,
    },
  },
  config = true;
  -- config = function(opts)
  --   require('code_runner').setup(opts)  
  -- end
}
