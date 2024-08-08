return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = {
      [[              .?777?77?77.              ]],
      [[          .:G##@@@@@@@@@@##B:..         ]],
      [[        ?#@@BGJ^^^^^^^^^^JGB@@#?        ]],
      [[     .?&&Y!~................~!Y&&?.     ]],
      [[    Y@&Y^......................^Y&@Y    ]],
      [[  .7@&Y..........................Y&@7.  ]],
      [[  7@@7............................7@@7  ]],
      [[ P@@!:.^JYYYY~:..........:~YYYYJ^.:!@@P ]],
      [[ G@@!:7&:.?@@@P..........PP..B@@&7:!@@G ]],
      [[ P@@?~Y@5JG@@@B.:JGGGGJ:.#&YY&@@@Y~?@@P ]],
      [[  7@@Y?&@@@@@&Y:&#GBBG#&:Y&@@@@@#?Y@@7  ]],
      [[  .!@@P^?JJJY~.:&GYYYYG&:.~YJJJ?^P@@!   ]],
      [[    J&@G~:::....::^^^^::....:::~G@&J    ]],
      [[     .7&@G?!~:............:~!?G@&7.     ]],
      [[        7#@@#B5~^^^^^^^^~5B#@@#7        ]],
      [[         :P@&#&@@@@@@@@@@&#&@P:         ]],
      [[        5@&J::~5YYYYYYYY5~::J&@5        ]],
      [[        @@#^.GB:........:BG.^#@@        ]],
      [[        :P&&#@B..:7&&?:..B@#&&P:        ]],
      [[          .Y@@&Y:.J@@5^:Y&@@Y.          ]],
      [[            .J&@@&&BB&@@@&J.            ]],
      [[              .77?^  ^77?.              ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("i", "    new file", ":ene <BAR> startinsert<CR>"),
      dashboard.button("r", "    recent files", ":Telescope oldfiles<CR>"),
      dashboard.button("f", "󰥨    find file", ":Telescope find_files<CR>"),
      dashboard.button("g", "󰊄    live grep", ":Telescope live_grep<CR>"),
      dashboard.button("l", "󰒲    lazy", ":Lazy<CR>"),
      dashboard.button("q", "󰭿    quit", ":qa<CR>"),
    }
    alpha.setup(dashboard.config)
  end,
}
