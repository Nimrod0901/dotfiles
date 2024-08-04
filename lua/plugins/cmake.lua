return {
  "Civitasv/cmake-tools.nvim",
  opts = {
    cmake_command = "cmake",
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
    cmake_build_directory = "build", -- this is used to specify generate directory for cmake, allows macro expansion
    cmake_runner = {
      name = "toggleterm",
      opts = {
        toggleterm = {
          direction = "float", -- 'vertical' | 'horizontal' | 'tab' | 'float'
          close_on_exit = false, -- whether close the terminal when exit
          auto_scroll = true, -- whether auto scroll to the bottom
          singleton = true, -- single instance, autocloses the opened one, if present
        },
      },
    },
    cmake_notifications = {
      runner = { enabled = false },
      executor = { enabled = false },
    },
  },
}
