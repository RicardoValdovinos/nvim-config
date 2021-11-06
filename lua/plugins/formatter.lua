function format_prettier()
  return {
    exe = "prettier",
    args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--single-quote"},
    stdin = true
  }
end

require("formatter").setup {
  logging = true,
  filetype = {
    javascript = {format_prettier},
    javascriptreact = {format_prettier},
    typescript = {format_prettier},
    typescriptreact = {format_prettier},
    json = {format_prettier},
    lua = {
      -- luafmt
      function()
        return {
          exe = "luafmt",
          args = {"--indent-count", 2, "--stdin"},
          stdin = true
        }
      end
    }
  }
}
