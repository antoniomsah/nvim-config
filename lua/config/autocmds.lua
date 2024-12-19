-- Command to copy files from competitive programming library

local function copy_files_from_maratona()
  -- Hardcoded path to the competitive programming files
  -- Change this path to match the desired library
  local source_dir = vim.fn.expand("~/Desktop/maratona/competitive-programming/lib")

  -- Use fzf-lua to select files
  require("fzf-lua").files({
    cwd = source_dir,
    multi = true,
    actions = {
      ["enter"] = function(selected)
        for _, file in ipairs(selected) do
          file = file:match("[a-zA-Z0-9].*$") or file

          -- Construct full source path
          local source_path = source_dir .. "/" .. file

          -- Read file contents
          local contents = vim.fn.readfile(source_path)

          -- Get cursor position
          local cursor_pos = vim.api.nvim_win_get_cursor(0)
          local current_line = cursor_pos[1]

          -- Insert contents at cursor position
          vim.api.nvim_buf_set_lines(0, current_line - 1, current_line - 1, false, contents)
        end
      end,
    },
  })
end

-- Create a command to easily invoke the file copying from Maratona directory
vim.api.nvim_create_user_command("MaratonaCopyFiles", copy_files_from_maratona, {})

-- Optional: Add a keymapping for quick access
vim.keymap.set("n", "<leader>lib", ":MaratonaCopyFiles<CR>", { noremap = true, silent = true })

-- Autoformat settings
local set_autoformat = function(pattern, want_autoformat)
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = pattern,
    callback = function()
      vim.b.autoformat = want_autoformat
    end,
  })
end

set_autoformat("cpp", false)
