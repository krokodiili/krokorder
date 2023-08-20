-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
require("telescope").load_extension('harpoon')
require("telescope").setup{
  defaults = {
file_ignore_patterns = {".git/", ".cache"},
  }
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "html", "css", "lua", "vim", "vimdoc", "query", "javascript","astro", "json", "tsx" },
  highlight = {
    enable = true,
}
}



require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

