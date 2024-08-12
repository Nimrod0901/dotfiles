return {
  "huggingface/llm.nvim",
  opts = {
    backend = "ollama",
    url = "http://localhost:11434/api/generate",
    model = "codellama:code",
    lsp = {
      bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
    },
    tokens_to_clear = { "<EOT>" },
    fim = {
      enabled = true,
      prefix = "<PRE> ",
      middle = " <MID>",
      suffix = " <SUF>",
    },
    context_window = 4096,
    tokenizer = nil,
  },
}
