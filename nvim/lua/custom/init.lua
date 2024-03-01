require "custom.autocmd"

local opt = vim.opt
local g = vim.g

-------------------------------------- globals -----------------------------------------

-------------------------------------- options ------------------------------------------
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.shiftround = true
-- opt.smartindent = true
-- g.python_recommended_style = 0

opt.colorcolumn = "80"

opt.cmdheight = 0

opt.wrap = false

opt.scrolloff = 8
opt.sidescrolloff = 8

opt.virtualedit = "onemore"

opt.relativenumber = true

opt.langmap =
"ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ї},ФA,ІS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Є\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ї],фa,іs,вd,аf,пg,рh,оj,лk,дl,є',яz,чx,сc,мv,иb,тn,ьm"

vim.api.nvim_exec("language en_US", true)

-- opt.iskeyword:remove("_")

opt.list = true
opt.listchars = {
    tab = "───",
    space = "⋅",
    eol = "↴",
}

vim.diagnostic.config({
    float = {
        border = "single",
    },
})

-- Commands that I often misstype cause of the <SHIFT> key
vim.api.nvim_create_user_command('Q',function()
    pcall(function()
        vim.cmd("q")
    end)
end,{})
vim.api.nvim_create_user_command('W',function()
    pcall(function()
        vim.cmd("w")
    end)
end,{})
vim.api.nvim_create_user_command('Qa',function()
    pcall(function()
        vim.cmd("qa")
    end)
end,{})
vim.api.nvim_create_user_command('QA',function()
    pcall(function()
        vim.cmd("qa")
    end)
end,{})


-- Clear unused buffers
local id = vim.api.nvim_create_augroup("startup", {
  clear = false
})

local persistbuffer = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.fn.setbufvar(bufnr, 'bufpersist', 1)
end

vim.api.nvim_create_autocmd({"BufRead"}, {
  group = id,
  pattern = {"*"},
  callback = function()
    vim.api.nvim_create_autocmd({"InsertEnter","BufModifiedSet"}, {
      buffer = 0,
      once = true,
      callback = function()
        persistbuffer()
      end
    })
  end
})

vim.keymap.set('n', '<Leader>cb',
  function()
    local curbufnr = vim.api.nvim_get_current_buf()
    local buflist = vim.api.nvim_list_bufs()
    for _, bufnr in ipairs(buflist) do
      if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, 'bufpersist') ~= 1) then
        vim.cmd('bd ' .. tostring(bufnr))
      end
    end
  end, { silent = true, desc = 'Close unused buffers' })
