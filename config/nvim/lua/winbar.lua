local M = {}

-- Define highlight groups to match your statusline
local function setup_highlights()
    vim.api.nvim_set_hl(0, 'WinBarNormal', { bg = '#569cd6', fg = '#000000', bold = true })
    vim.api.nvim_set_hl(0, 'WinBarInsert', { bg = '#6a9955', fg = '#000000', bold = true })
    vim.api.nvim_set_hl(0, 'WinBarVisual', { bg = '#c586c0', fg = '#000000', bold = true })
    vim.api.nvim_set_hl(0, 'WinBarCommand', { bg = '#dcdcaa', fg = '#000000', bold = true })
    vim.api.nvim_set_hl(0, 'WinBarTerminal', { bg = '#4ec9b0', fg = '#000000', bold = true })
    vim.api.nvim_set_hl(0, 'WinBarReplace', { bg = '#d16969', fg = '#000000', bold = true })
    vim.api.nvim_set_hl(0, 'WinBarFilepath', { bg = '', fg = '#cccccc' })
    vim.api.nvim_set_hl(0, 'WinBarInfo', { bg = '', fg = '#cccccc', bold = true })
end

-- Function to get file size
function _G.get_filesize()
    local filepath = vim.fn.expand('%:p')
    if filepath == '' then
        return ''
    end

    local stat = vim.loop.fs_stat(filepath)
    if not stat then
        return ''
    end

    local size = stat.size
    if size < 1024 then
        return size .. 'B'
    elseif size < 1024 * 1024 then
        return string.format('%.2fKiB', size / 1024)
    else
        return string.format('%.2fMiB', size / (1024 * 1024))
    end
end

-- Function to build the winbar
function _G.get_winbar()
    local mode = vim.api.nvim_get_mode().mode
    local mode_config = {
        ['n'] = { label = 'NORMAL', hl = 'WinBarNormal' },
        ['i'] = { label = 'INSERT', hl = 'WinBarInsert' },
        ['v'] = { label = 'VISUAL', hl = 'WinBarVisual' },
        ['V'] = { label = 'V-LINE', hl = 'WinBarVisual' },
        ['\22'] = { label = 'V-BLOCK', hl = 'WinBarVisual' },
        ['c'] = { label = 'COMMAND', hl = 'WinBarCommand' },
        ['t'] = { label = 'TERMINAL', hl = 'WinBarTerminal' },
        ['R'] = { label = 'REPLACE', hl = 'WinBarReplace' },
    }

    local config = mode_config[mode] or { label = mode, hl = 'WinBarNormal' }

    local filepath = vim.fn.expand('%:p')
    local modified = vim.bo.modified and ' [*]' or ''
    local encoding = vim.bo.fileencoding ~= '' and vim.bo.fileencoding or vim.o.encoding
    local filesize = _G.get_filesize()

    -- Get cursor position
    local line = vim.fn.line('.')
    local col = vim.fn.col('.')
    local total_lines = vim.fn.line('$')

    -- Build the winbar string with encoding on right side first
    return string.format(
        '%%#%s# %s %%#WinBarFilepath# %s%%#WarningMsg#%s%%=%%#WinBarInfo# %s %s:%s [%s] %s',
        config.hl,
        config.label,
        filepath,
        modified,
        encoding,
        line,
        col,
        total_lines,
        filesize
    )
end

-- Setup function
function M.setup()
    setup_highlights()

    -- Update winbar on various events
    vim.api.nvim_create_autocmd({ 'ModeChanged', 'BufEnter', 'CursorMoved', 'CursorMovedI' }, {
        callback = function()
            vim.wo.winbar = _G.get_winbar()
        end,
    })

    -- Set initial winbar
    vim.wo.winbar = _G.get_winbar()
end
return M
