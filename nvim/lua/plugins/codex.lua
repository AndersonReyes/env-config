local M = {}

-- use a local document symbol skill for faster processing
local prompt_template = "$document-symbol %s"


function M.get_prompt()
  local file = vim.api.nvim_buf_get_name(0)

  if file == "" then
    return nil, "current buffer has no file path"
  end

  if vim.bo.modified then
    return nil, "save the buffer before documenting a symbol"
  end

  local symbol = vim.fn.expand("<cword>")
  if symbol == "" then
    return nil, "no symbol was provided"
  end

  local cursor = vim.api.nvim_win_get_cursor(0)
  local ctx = {
    schema_version = 1,
    workspace = vim.fs.root(file, { ".git" }) or vim.fn.getcwd(),
    file = file,
    filetype = vim.bo.filetype,
    symbol = symbol,
    cursor = {
      line = cursor[1],
      byte_column = cursor[2],
    },
    line_text = vim.api.nvim_get_current_line(),
  }

  return prompt_template:format(vim.json.encode(ctx))
end

function M.append_to_buffer(buf, data)
  -- if buffer and data not valid, do nothing
  if not data or not vim.api.nvim_buf_is_valid(buf) then
    return
  end

  local new_text = vim.split(data, "\n", {
    plain = true,
    trimempty = false
  })

  -- vim.print("New text: [" .. new_text[1] .. "]")
  local last_row = vim.api.nvim_buf_line_count(buf) - 1
  local last_line = vim.api.nvim_buf_get_lines(buf, last_row, last_row + 1, false)[1]
  -- add the data to the end of the buffer
  vim.api.nvim_buf_set_text(buf, last_row, #last_line, last_row, #last_line, new_text)

  -- Keep the newest output visible.
  --if vim.api.nvim_win_is_valid(win) then
  --  -- Cursor position:
  --  --   row = one-based
  --  --   col = zero-based byte index
  --  vim.api.nvim_win_set_cursor(
  --    win,
  --    { vim.api.nvim_buf_line_count(buf), 0 }
  --  )
  --end
end



function M.get_docs(prompt, buf, stdout_callback, stderr_callback)

  local result = vim.system(
    { "codex", "exec", "--ephemeral", "--skip-git-repo-check", "-C", vim.fn.getcwd(), prompt },
    { 
      text = true,
      stdout = stdout_callback,
      stderr = false,
    }, vim.schedule_wrap(function(result)
      M.append_to_buffer(buf, ("\n[Exited with code %d]\n"):format(result.code))
    end)
  )
end


function M.stream_to_float_window_v2(buf, prompt)

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  -- buf: displayed buffer; true: focus window; table: float config
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor", -- position relative to editor
    width = width, -- width in cells
    height = height, -- height in cells
    -- Center the window.
    -- For relative="editor", row and col are screen-grid coordinates.
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2),
    style = "minimal", -- hide extra window UI
    border = "rounded", -- border style
    title = "Codex Stream", -- border title
    title_pos = "center", -- title alignment
  })

  -- unregister the q to quiet after window is closed. we do not want to leave the keymap 
  -- registered on the buffer afterwards.
  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(win),
    once = true,
    callback = function()
      pcall(vim.keymap.del, "n", "q", {
        buffer = buf,
      })
    end,
  })

  -- visually wrap long lines
  vim.wo[win].wrap = true
  -- wrap at word boundaries
  vim.wo[win].linebreak = true
  -- indent wrapped continuation lines
  vim.wo[win].breakindent = true
  -- conceal Markdown formatting
  vim.wo[win].conceallevel = 2
  -- conceal on the cursor line in Normal and Command-line modes
  vim.wo[win].concealcursor = "nc"

  vim.keymap.set("n", "q", function()

   if vim.api.nvim_win_is_valid(win) then
      -- force-close even if the buffer is modified
     vim.api.nvim_win_close(win, true)
   end
  end, {
      buffer = buf,
      silent = true,
      desc = "close codex doc window"
  })

  local job = vim.bo[buf].channel
  -- send the prompt to the codex terminal which will display the new output in the floating window
  vim.api.nvim_chan_send(job, prompt)

  -- Send generated keys to the terminal process.
  vim.cmd("startinsert")

  -- Wait for Codex to process the prompt text.
  vim.defer_fn(function()
    -- Convert the Enter key notation to terminal input.
    local enter = vim.api.nvim_replace_termcodes("<CR>", true, false, true)
    -- Send Enter to submit the prompt.
    vim.api.nvim_feedkeys(enter, "t", false)

    -- Briefly wait before leaving terminal-input mode.
    vim.defer_fn(function()
      -- Convert the terminal Normal-mode sequence.
      local normal = vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true)
      -- Leave terminal-input mode.
      vim.api.nvim_feedkeys(normal, "t", false)
    end, 10)
  end, 100)

  -- attach to buffer updates to auto scroll the cursor as new output shows
  vim.api.nvim_buf_attach(buf, false, {
    on_lines = function()
      -- Stop watching after the float closes.
      if not vim.api.nvim_win_is_valid(win) then
        return true
      end

      -- Keep the latest terminal output visible.
      local last_line = vim.api.nvim_buf_line_count(buf)
      vim.api.nvim_win_set_cursor(win, {last_line, 0})
    end
  })
end


local function find_codex_terminal()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do 
    local name = vim.api.nvim_buf_get_name(buf)
    if vim.api.nvim_buf_is_loaded(buf) 
      and vim.bo[buf].buftype == "terminal" 
      and name:match(":codex$") then
      return buf
    end
  end
end


function M.send_find_to_term()
  local prev_buf = vim.api.nvim_get_current_buf()
end


vim.api.nvim_create_user_command("CodexDocumentSymbol", function(opts)
  -- M.stream_to_float_window()
  local prompt, err = M.get_prompt()

  if err then 
    vim.print("Error: " .. tostring(err))
    return 
  end

  local current_buf = vim.api.nvim_get_current_buf()
  local codex_buf = find_codex_terminal()

  if not codex_buf then 
    return error("No codex terminal running")
  end

  M.stream_to_float_window_v2(codex_buf, prompt)

end, { nargs = 0 })

vim.api.nvim_create_user_command("Codex", function(opts)
  vim.api.nvim_cmd({
    cmd = "terminal",
    args = {"codex"}
  }, {})
  
  
end, { nargs = 0 })

vim.api.nvim_create_user_command("CodexWindow", function()
  local codex_buf = find_codex_terminal()

  if not codex_buf then
    vim.notify("No Codex terminal running", vim.log.levels.WARN)
    return
  end

  vim.api.nvim_set_current_buf(codex_buf)
end, { nargs = 0 })

return {}
