local keymap = vim.keymap

-- Save key strokes (now we do not need to press shift to enter command mode).
keymap.set({ "n", "x" }, ";", ":")

-- Turn the current word into title case
keymap.set("i", "<c-t>", "<Esc>b~lea")

-- Remove seach highlights
keymap.set("n", "<leader>nh", "<cmd>nohl<CR>", { desc = "no highlight" })

keymap.set("n", "<leader>p", "m`o<ESC>p``", { desc = "paste below current line" })
keymap.set("n", "<leader>P", "m`O<ESC>p``", { desc = "paste above current line" })

-- Nvim Scissors Mappings
keymap.set({ "n", "x" }, "<leader>sza", "<cmd>ScissorsAddNewSnippet<cr>", { desc = "Add New Snippet" })
keymap.set("n", "<leader>sze", "<cmd>ScissorsEditSnippet<cr>", { desc = "Edit Snippet" })

-- Code Runner Mappings
keymap.set("n", "<leader>rr", ":RunCode<CR>", { desc = "Run Code" })
keymap.set("n", "<leader>rf", ":RunFile<CR>", { desc = "Run File" })
keymap.set("n", "<leader>rp", ":RunProject<CR>", { desc = "Run Project" })
keymap.set("n", "<leader>rt", ":RunClose<CR>", { desc = "Close Output" })

-- Leetcode Mappings
keymap.set("n", "<leader>lll", "<cmd>Leet<cr>", { desc = "LeetCode" })
keymap.set("n", "<leader>llr", "<cmd>Leet run<cr>", { desc = "Leet Run" })
keymap.set("n", "<leader>llx", "<cmd>Leet reset<cr>", { desc = "Leet Reset" })
keymap.set("n", "<leader>lls", "<cmd>Leet submit<cr>", { desc = "Leet Submit" })
keymap.set("n", "<leader>llc", "<cmd>Leet console<cr>", { desc = "Leet Console" })
keymap.set("n", "<leader>llo", "<cmd>Leet open<cr>", { desc = "Leet Open" })
keymap.set("n", "<leader>lli", "<cmd>Leet info<cr>", { desc = "Leet Info" })

-- Competitest Mappings
keymap.set("n", "<leader>cpr", "<cmd>CompetiTest run<cr>", { desc = "Run" })
keymap.set("n", "<leader>cpp", "<cmd>CompetiTest receive problem<cr>", { desc = "Fetch Problem" })
keymap.set("n", "<leader>cpc", "<cmd>CompetiTest receive contest<cr>", { desc = "Fetch Contest" })
keymap.set("n", "<leader>cps", "<cmd>CompetiTest show_ui<cr>", { desc = "Open Console" })
keymap.set("n", "<leader>cpta", "<cmd>CompetiTest add_testcase<cr>", { desc = "Add Testcase" })
keymap.set("n", "<leader>cpte", "<cmd>CompetiTest edit_testcase<cr>", { desc = "Edit Testcase" })
keymap.set("n", "<leader>cptd", "<cmd>CompetiTest delete_testcase<cr>", { desc = "Delete Testcase" })

-- Lspsaga Mappings
keymap.set("n", "<leader>mm", "<cmd>Lspsaga code_action<cr>", { desc = "Code Actions" })
keymap.set("n", "<leader>md", "<cmd>Lspsaga peek_definition<cr>", { desc = "Peek Definition" })
keymap.set("n", "<leader>mx", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Next Diagnostic" })
keymap.set("n", "<leader>mf", "<cmd>Lspsaga finder<cr>", { desc = "Finder" })
keymap.set("n", "<leader>mr", "<cmd>Lspsaga rename<cr>", { desc = "Rename" })

-- Shortcut for faster save and quit
keymap.set("n", "<leader>w", "<cmd>update<cr>", { silent = true, desc = "save buffer" })

keymap.set("n", "y", '"+y', { silent = true })
keymap.set("v", "y", '"+y', { silent = true })

-- Move the cursor based on physical lines, not the actual lines.
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set("n", "^", "g^")
keymap.set("n", "0", "g0")

-- Go to the beginning and end of current line quickly
keymap.set({ "n", "i", "v" }, "<A-h>", "^")
keymap.set({ "n", "i", "v" }, "<A-l>", "<END>")

-- Exit Insert/Selection Mode quickly
keymap.set({ "i", "x" }, "kj", "<ESC>")

-- Continuous visual shifting (does not exit Visual mode), `gv` means
keymap.set("x", "<", "<gv")
keymap.set("x", ">", ">gv")

-- Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
keymap.set("n", "<leader>v", "printf('`[%s`]', getregtype()[0])", {
  expr = true,
  desc = "reselect last pasted area",
})

-- Always use very magic mode for searching
keymap.set("n", "/", [[/\v]])

-- Toggle spell checking
keymap.set("n", "<F10>", "<cmd>set spell!<cr>", { desc = "toggle spell" })
keymap.set("i", "<F10>", "<c-o><cmd>set spell!<cr>", { desc = "toggle spell" })

-- Change text without putting it into the vim register,
keymap.set("n", "c", '"_c')
keymap.set("n", "C", '"_C')
keymap.set("n", "cc", '"_cc')
keymap.set("x", "c", '"_c')

-- Delete the character to the right of the cursor
keymap.set("i", "<C-D>", "<DEL>")
