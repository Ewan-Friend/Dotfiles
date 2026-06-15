return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2", 
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

  
  config = function()
    local harpoon = require("harpoon")
    
    -- Initialize the plugin hooks
    harpoon:setup()

    -- Configure Telescope to read Harpoon's list
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
            prompt_title = "Harpoon Marks",
            finder = require("telescope.finders").new_table({
                results = file_paths,
            }),
            previewer = conf.file_previewer({}),
            sorter = conf.generic_sorter({}),
        }):find()
    end

    -- Map functional keybindings inside the configuration environment
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon Add File" })
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon Menu" })

    -- Fast-switch navigation to marked file slots
    vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon File 1" })
    vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end, { desc = "Harpoon File 2" })
    vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end, { desc = "Harpoon File 3" })
    vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end, { desc = "Harpoon File 4" })
  end,
}
