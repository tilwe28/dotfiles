---------------
-- Which-Key --
---------------
require("which-key").register {
  ["<Leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
  ["<Leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
  ["<Leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
  ["<Leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
  ["<Leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
  ["<Leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
  ["<Leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
  ["<Leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
}
