-- Early Mason PATH initilization
-- This ensures Mason's bin directory is always first in PATH
--
-- Purpose:
-- When you install tools via Mason they get installted to ~/.local/share/nvim/mason/bin
-- However if you also have system version of these tools installed (via brew, apt, etc.)
-- your shell's PATH might find the system version first, leading to:
--
-- * Version conflicts
-- * Configuration issues
-- * Inconsistent behavior
--
-- Solution:
-- This file prepends Mason's bin directory to the PATH environment variable,
-- ensuring Mason tools are found first:
-- * Before: PATH="/usr/local/bin:/usr/bin:/bin"
-- * After: PATH="/Users/you/.local/share/nvim/mason/bin:/usr/local/bin:/usr/bin:/bin"
--
-- Features:
-- * Deduplication
-- * Early initilization
-- * Directory creation
-- * Clean PATH management
--
-- Importance:
-- Mason manages tools:
-- * LSP servers
-- * Formatters
-- * Linters
--
-- Without this file, you might end up using system versions instead of Mason versions
-- * The :MasonVerify command showing tools as "not Mason-managed"
-- * Inconsistent formatting/linting behavior
-- * Version-specific bugs or missing features
--
-- Workflow Integration:
-- This file works together with:
-- * lua/config/mason-verify.lua - Verifies which tools are Mason-managed
-- * lua/plugins/mason.lua - Installs and manages the tools
-- * Your linter/formatter configs - Use the Mason versions consistently
--
-- It's essentially the "foundation" that makes your entire Mason-based toolchain
-- work reliably by ensuring the right tools are found in the right order

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
local current_path = vim.env.PATH or ""

-- Remove any existing Mason bin entries to prevent duplicates
local path_entries = vim.split(current_path, ":")
local clean_path_entries = {}
local seen = {}

for _, entry in ipairs(path_entries) do
    -- Skip Mason bin entries and duplicates
    if entry ~= mason_bin and entry ~= "" and not seen[entry] then
        seen[entry] = true
        table.insert(clean_path_entries, entry)
    end
end

-- Add Mason bin directory at the begginning
local new_path = mason_bin .. ":" .. table.concat(clean_path_entries, ":")
vim.env.PATH = new_path

-- Verify Mason bin directory exists
if vim.fn.isdirectory(mason_bin) == 0 then
    -- Mason not installed yet, create placeholder
    vim.fn.mkdir(mason_bin, "p")
end
