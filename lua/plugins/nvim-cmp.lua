  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local luasnip = require'luasnip'

  cmp.setup({
    snippet = {
	    expand = function(args)
		    luasnip.lsp_expand(args.body)
	    end
    },
    completion = {
	completeopt = 'menu,menuone,noselect',
	keyword_length = 2
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
          -- Tab mapping
     ['<Tab>'] = function(fallback)
       if cmp.visible() then
         cmp.select_next_item()
       else
         fallback()
       end
     end,
     ['<S-Tab>'] = function(fallback)
       if cmp.visible() then
         cmp.select_prev_item()
       else
         fallback()
       end
     end
    },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
    }
  })
