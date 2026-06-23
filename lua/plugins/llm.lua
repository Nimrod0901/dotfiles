return {
  "huggingface/llm.nvim",
  cmd = { "LLMToggleAutoSuggest", "LLMSuggestion" },
  opts = {
    backend = "ollama",
    url = "http://localhost:11434/api/generate",
    model = "codellama:code",
    request_body = {
      options = {
        keep_alive = "-1m",
      },
    },
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
    enable_suggestions_on_startup = false,
    accept_keymap = "<C-space>",
  },
}
