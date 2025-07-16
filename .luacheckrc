-- Luacheck configuration for Neovim
std = "luajit"
globals = {"vim"}
ignore = {
  "631",  -- Line too long
  "611",  -- Line contains only whitespace
  "212",  -- Unused argument
  "213",  -- Unused loop variable
}
cache = true
