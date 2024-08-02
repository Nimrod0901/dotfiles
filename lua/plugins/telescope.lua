return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        file_browser = {
          theme = "ivy",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
        ["fzf"] = {
          fuzzy = true,
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf-native")
    pcall(require("telescope").load_extension, "ui-select")
    pcall(require("telescope").load_extension, "file_browser")

    local builtin = require("telescope.builtin")
    local find_config_files = function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end

    -- find
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[B]uffers" })
    vim.keymap.set("n", "<leader>fc", find_config_files, { desc = "[C]onfigs" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]iles" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "[R]ecent Files" })
    -- git
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "[G]it [C]ommits" })
    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "[G]it [S]tatus" })
    -- search
    vim.keymap.set("n", "<leader>sa", builtin.autocommands, { desc = "[A]utocommands" })
    vim.keymap.set("n", "<leader>sb", builtin.current_buffer_fuzzy_find, { desc = "[B]uffer" })
    vim.keymap.set("n", "<leader>sc", builtin.command_history, { desc = "[C]md History" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[D]iagnostics" })
    vim.keymap.set("n", "<leader>sj", builtin.jumplist, { desc = "[J]umplist" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[G]rep" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[H]elp" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[K]eymaps" })
    vim.keymap.set("n", "<leader>sm", builtin.man_pages, { desc = "[M]anuals" })
    vim.keymap.set("n", "<leader>so", builtin.vim_options, { desc = "[O]ptions" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[R]esume" })
    vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]elect Telescope" })
  end,
}
