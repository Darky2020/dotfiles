-- Functions to customize the status line
local fn = vim.fn

local M = {}

local default_sep_icons = {
  default = { left = "", right = " " },
  round = { left = "", right = "" },
  block = { left = "█", right = "█" },
  arrow = { left = "", right = "" },
}

M.gitchanges = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status or vim.o.columns < 120 then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and ("%#St_lspInfo#  " .. git_status.added .. " ") or ""
  local changed = (git_status.changed and git_status.changed ~= 0)
      and ("%#St_lspWarning#  " .. git_status.changed .. " ")
    or ""
  local removed = (git_status.removed and git_status.removed ~= 0)
      and ("%#St_lspError#  " .. git_status.removed .. " ")
    or ""

  return (added .. changed .. removed) ~= "" and (added .. changed .. removed .. " | ") or ""
end

M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and ("%#St_lspInfo#  " .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and ("%#St_lspWarning#  " .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and ("%#St_lspError#  " .. git_status.removed) or ""
  local branch_name = "  " .. git_status.head

  return "%#white#" .. branch_name .. " " .. added .. changed .. removed
end

M.LSP_Diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  local errors_s = (errors and errors > 0) and ("%#St_lspError#" .. " " .. errors .. " ") or ""
  local warnings_s = (warnings and warnings > 0) and ("%#St_lspWarning#" .. " " .. warnings .. " ") or ""
  local hints_s = (hints and hints > 0) and ("%#St_lspHints#" .. "󰛩 " .. hints .. " ") or ""
  local info_s = (info and info > 0) and ("%#St_lspInfo#" .. "󰋼 " .. info .. " ") or ""

  return errors_s .. warnings_s .. hints_s .. info_s
end

M.LSP_status = function()
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] and client.name ~= "null-ls" then
        return (vim.o.columns > 100 and "%#St_LspStatus#" .. "  " .. client.name .. " ") or "   LSP "
      end
    end
  end
  return ""
end

M.cursor_position = function()
  local left_sep = "%#St_pos_sep#" .. default_sep_icons.default.left .. "%#St_pos_icon#" .. " "

  local current_line = fn.line "."
  local total_line = fn.line "$"

  return left_sep .. "%#St_pos_text#" .. " L " .. current_line .. "/" .. total_line .. " "
end

M.macrorecording = function()
    local recording_register = vim.fn.reg_recording()

    if recording_register == '' then
        return ""
    end

    return "%#St_lspInfo#Recording @" .. recording_register
end

M.searchcount = function()
    if vim.v.hlsearch == 0 then
        return ''
    end

    local result = vim.fn.searchcount { maxcount = 999, timeout = 500 }
    if next(result) == nil then
        return ''
    end

    local denominator = math.min(result.total, result.maxcount)
    local r = string.format('[%d/%d]', result.current, denominator)

    return "%#white#" .. "Search: \"" .. vim.fn.getreg("/") .. "\" " .. r
end

return M
