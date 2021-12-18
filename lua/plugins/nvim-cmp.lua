-- Config file for Nvim-CMP plugin
-- Author: Javier de Marco

local present, cmp = pcall(require, "cmp")
if not present then
  return
end
local lspkind = require("lspkind")

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  formatting = {
      format = lspkind.cmp_format({
      with_text = true, -- do not show text alongside icons
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
    -- format = function(entry, vim_item)
    --      local icons = require "plugins.configs.lspkind_icons"
    --      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
    --
    --      vim_item.menu = ({
    --         nvim_lsp = "[LSP]",
    --         nvim_lua = "[Lua]",
    --         buffer = "[BUF]",
    --      })[entry.source.name]
    --
    --      return vim_item
    --   end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
         cmp.select_next_item()
     elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
         fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
         cmp.select_prev_item()
     elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
         fallback()
      end
    end,
  },
  sources = {
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
  },
  sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require "cmp-under-comparator".under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
}
