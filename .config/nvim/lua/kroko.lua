local api = vim.api
local buf, win

local position = 0


local function center(str)
  local width = api.nvim_win_get_width(0)
  local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
  return string.rep(' ', shift) .. str
end

local function update_view(direction)
  -- Is nice to prevent user from editing interface, so
  -- we should enabled it before updating view and disabled after it.
  api.nvim_buf_set_option(buf, 'modifiable', true)

  position = position + direction
  if position < 0 then position = 0 end

-- api.nvim_buf_set_lines(buf, 3, -1, false, result)
  api.nvim_buf_set_lines(buf, 0, -1, false, {
    center('KROKO'),
    center('Select command')
  })

  api.nvim_buf_add_highlight(buf, -1, 'Header', 0, 0, -1)
  api.nvim_buf_add_highlight(buf, -1, 'SubHeader', 1, 0, -1)
  api.nvim_buf_set_option(buf, 'modifiable', false)
end



local function open_window()
  buf = api.nvim_create_buf(false, true) -- create new emtpy buffer
  api.nvim_buf_set_option(buf, 'modifiable', true)


  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  -- get dimensions
  local width = api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")

  -- calculate our floating window size
  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)

  -- and its starting position
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  -- set some options
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    border = "double"
  }

  -- and finally create it with buffer attached
  win = api.nvim_open_win(buf, true, opts)
  update_view(0)
  end



return {
  kroko = open_window
}

