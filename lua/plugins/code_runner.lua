return {
  {
    "CRAG666/code_runner.nvim",
    opts = {
      filetype = {
        python = "python3 -u $file",
        c = "cd $dir && gcc -Wall -lpthread -fno-omit-frame-pointer -pg -g "
          .. "-lm $fileName -o $fileNameWithoutExt.out && $dir/$fileNameWithoutExt.out",
        cpp = "cd $dir && g++ -std=c++17 -lpthread -g $fileName -o"
          .. "$fileNameWithoutExt.out  && $dir/$fileNameWithoutExt.out",
        sh = "bash $file",
        lua = "lua $file",
      },
    },
    keys = {
      {
        "<leader>rr",
        ":RunCode<CR>",
        desc = "[R]un",
      },
    },
  },
}
