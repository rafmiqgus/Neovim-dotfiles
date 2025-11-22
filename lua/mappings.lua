local map = vim.keymap.set

-- Basics
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Insert Mode Movement
map("i", "<C-b>", "<ESC>^i", { desc = "Move to beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })

-- Window Navigation
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Editing & Highlighting
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copy whole file" })

-- Line Numbers & Cheatsheet
-- removed duplicate <leader>n to keep Snacks mapping
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Open cheatsheet" })

-- Format & Diagnostics
map({ "n", "x" }, "<leader>fm", function() require("conform").format { lsp_fallback = true } end, { desc = "Format file" })
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })

-- Buffer & Tabs
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer" })
map("n", "<tab>", function() require("nvchad.tabufline").next() end, { desc = "Next buffer" })
map("n", "<S-tab>", function() require("nvchad.tabufline").prev() end, { desc = "Previous buffer" })
map("n", "<leader>x", function() require("nvchad.tabufline").close_buffer() end, { desc = "Close buffer" })

-- Comment (keep visual only)
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- File Explorer
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- Telescope NvChad Themes
map("n", "<leader>th", function() require("nvchad.themes").open() end, { desc = "NVChad themes" })

-- Terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal escape" })
-- map("n", "<leader>t", function() Snacks.terminal.open() end, { desc = "Open Snacks terminal" })

-- WhichKey
map("n", "<leader>wK", "<cmd>WhichKey<CR>", { desc = "Show all keymaps" })
map("n", "<leader>wk", function() vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ") end, { desc = "WhichKey query" })

-- Snacks.nvim

-- Top Pickers & Explorer
map("n", "<leader><space>", function() Snacks.picker.smart() end,          { desc = "Smart Find Files" })
map("n", "<leader>,",         function() Snacks.picker.buffers() end,        { desc = "Buffers" })
map("n", "<leader>/",         function() Snacks.picker.grep() end,           { desc = "Grep" })
map("n", "<leader>:",         function() Snacks.picker.command_history() end,{ desc = "Command History" })
map("n", "<leader>n",         function() Snacks.picker.notifications() end,  { desc = "Notification History" })

-- Find
map("n", "<leader>fb", function() Snacks.picker.buffers() end,           { desc = "Buffers" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Find Config" })
map("n", "<leader>ff", function() Snacks.picker.files() end,             { desc = "Find Files" })
map("n", "<leader>fg", function() Snacks.picker.git_files() end,         { desc = "Find Git Files" })
map("n", "<leader>fp", function() Snacks.picker.projects() end,          { desc = "Projects" })
map("n", "<leader>fr", function() Snacks.picker.recent() end,            { desc = "Recent" })

-- Git
map("n", "<leader>gb", function() Snacks.picker.git_branches() end,      { desc = "Git Branches" })
map("n", "<leader>gd", function() Snacks.picker.git_diff() end,          { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", function() Snacks.picker.git_log_file() end,      { desc = "Git Log File" })
map("n", "<leader>gL", function() Snacks.picker.git_log_line() end,      { desc = "Git Log Line" })
map("n", "<leader>gl", function() Snacks.picker.git_log() end,           { desc = "Git Log" })
map("n", "<leader>gS", function() Snacks.picker.git_stash() end,        { desc = "Git Stash" })
map("n", "<leader>gs", function() Snacks.picker.git_status() end,       { desc = "Git Status" })

-- Grep
map("n", "<leader>sb", function() Snacks.picker.lines() end,            { desc = "Buffer Lines" })
map("n", "<leader>sB", function() Snacks.picker.grep_buffers() end,    { desc = "Grep Open Buffers" })
map("n", "<leader>sg", function() Snacks.picker.grep() end,             { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })

-- Search
map("n", "<leader>s\"", function() Snacks.picker.registers() end,      { desc = "Registers" })
map("n", "<leader>s/", function() Snacks.picker.search_history() end,   { desc = "Search History" })
map("n", "<leader>sa", function() Snacks.picker.autocmds() end,        { desc = "Autocmds" })
map("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
map("n", "<leader>sC", function() Snacks.picker.commands() end,        { desc = "Commands" })
map("n", "<leader>sd", function() Snacks.picker.diagnostics() end,
  { desc = "Diagnostics" }
)
map("n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end,{ desc = "Buffer Diagnostics" })
map("n", "<leader>sh", function() Snacks.picker.help() end,            { desc = "Help Pages" })
map("n", "<leader>sH", function() Snacks.picker.highlights() end,      { desc = "Highlights" })
map("n", "<leader>si", function() Snacks.picker.icons() end,           { desc = "Icons" })
map("n", "<leader>sj", function() Snacks.picker.jumps() end,           { desc = "Jumps" })
map("n", "<leader>sk", function() Snacks.picker.keymaps() end,         { desc = "Keymaps" })
map("n", "<leader>sl", function() Snacks.picker.loclist() end,         { desc = "Location List" })
map("n", "<leader>sm", function() Snacks.picker.marks() end,           { desc = "Marks" })
map("n", "<leader>sM", function() Snacks.picker.man() end,             { desc = "Man Pages" })
map("n", "<leader>sp", function() Snacks.picker.lazy() end,            { desc = "Plugin Spec" })
map("n", "<leader>sq", function() Snacks.picker.qflist() end,          { desc = "Quickfix List" })
map("n", "<leader>sR", function() Snacks.picker.resume() end,          { desc = "Resume" })
map("n", "<leader>su", function() Snacks.picker.undo() end,            { desc = "Undo History" })
map("n", "<leader>uC", function() Snacks.picker.colorschemes() end,    { desc = "Colorschemes" })

-- LSP
map("n", "gd", function() Snacks.picker.lsp_definitions() end,        { desc = "Goto Definition" })
map("n", "gD", function() Snacks.picker.lsp_declarations() end,       { desc = "Goto Declaration" })
map("n", "gI", function() Snacks.picker.lsp_implementations() end,    { desc = "Goto Implementation" })
map("n", "gr", function() Snacks.picker.lsp_references() end,         { desc = "References", nowait = true })
map("n", "gy", function() Snacks.picker.lsp_type_definitions() end,    { desc = "Goto T[y]pe Definition" })
map("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end,    { desc = "LSP Symbols" })
map("n", "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })

-- Other Snacks
map("n", "<leader>.", function() Snacks.scratch() end,                { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", function() Snacks.scratch.select() end,         { desc = "Select Scratch Buffer" })
map("n", "<leader>Z", function() Snacks.zen.zoom() end,               { desc = "Toggle Zoom" })
map("n", "<leader>z", function() Snacks.zen() end,                    { desc = "Toggle Zen Mode" })
map({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
map("n", "<leader>gg", function() Snacks.lazygit() end,               { desc = "Lazygit" })
map("n", "<leader>bd", function() Snacks.bufdelete() end,            { desc = "Delete Buffer" })
map("n", "<leader>cR", function() Snacks.rename.rename_file() end,   { desc = "Rename File" })
map({ "n", "v" }, "<leader>gB", function() Snacks.gitbrowse() end,  { desc = "Git Browse" })
map("n", "<leader>un", function() Snacks.notifier.hide() end,        { desc = "Dismiss Notifications" })
map("n", "<leader>N", function() Snacks.win({ file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1], width = 0.6, height = 0.6, wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 } }) end, { desc = "Neovim News" })

-- DAP
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
map("n", "<leader>dB", function() require('dap').set_breakpoint(vim.fn.input('Condition: ')) end, { desc = "DAP Toggle Breakpoint With Condition" })
map("n", "<leader>dc", function() require("dap").continue() end,         { desc = "DAP Continue/Start" })
map("n", "<leader>do", function() require("dap").step_over() end,        { desc = "DAP Step Over" })
map("n", "<leader>di", function() require("dap").step_into() end,        { desc = "DAP Step Into" })
map("n", "<leader>dO", function() require("dap").step_out() end,         { desc = "DAP Step Out" })
map("n", "<leader>dq", function() require("dap").terminate() end,        { desc = "DAP Terminate" })
map("n", "<leader>du", function() require("dapui").toggle() end,         { desc = "DAP UI Toggle" })

-- Code Runner 
map('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false, desc = "Run Code" })
map('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false, desc = "Run The Current File"})
map('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false, desc = "Run The Current File In A New Tab" })
map('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false, desc = "Run Project" })
map('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false, desc = "Close Runner" })
map('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false, desc = "Get The Current Command For This FileType" })
map('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false, desc = "Get The Current Command For This Project" })

-- BetterTerm

local betterTerm = require('betterTerm')
map({"n", "t"}, "<leader>t", function() betterTerm.open() end, { desc = "Toggle terminal" })
map({"n", "t"}, "<leader>ts", function() betterTerm.open(1) end, { desc = "Toggle terminal 1" })
map("n", "<leader>tt", betterTerm.select, { desc = "Select terminal" })
map("n", "<leader>tr", betterTerm.rename, { desc = "Rename terminal" })
map("n", "<leader>tb", betterTerm.toggle_tabs, { desc = "Toggle terminal tabs" })

-- Copilot
map("n", "<leader>zc", ":CopilotChat<CR>", { noremap = true, silent = true, desc = "Open Copilot Chat" })
map("v", "<leader>ze", ":CopilotChatExplain<CR>", { noremap = true, silent = true, desc = "Explain Selection With Copilot" })
map("v", "<leader>zr", ":CopilotChatReview<CR>", { noremap = true, silent = true, desc = "Review Selection With Copilot" })
map("v", "<leader>zf", ":CopilotChatFix<CR>", { noremap = true, silent = true, desc = "Fix Selection With Copilot" })
map("v", "<leader>zo", ":CopilotChatOptimize<CR>", { noremap = true, silent = true, desc = "Optimize Selection With Copilot" })
map("v", "<leader>zd", ":CopilotChatDocs<CR>", { noremap = true, silent = true, desc = "Get Docs For Current Function/Method With Copilot" })
map("v", "<leader>zt", ":CopilotChatTests<CR>", { noremap = true, silent = true, desc = "Generate Tests For Current Function/Method With Copilot" })
map("n", "<leader>zm", ":CopilotChatCommit<CR>", { noremap = true, silent = true, desc = "Generate Commit Message With Copilot" })
map("v", "<leader>zs", ":CopilotChatCommit<CR>", { noremap = true, silent = true, desc = "Generate Commit Message From Selection With Copilot" })

-- Flash
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
map("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
map({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
map("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
