function CopyAndExtend(original, new_values)
    local result = {}
    for k, v in pairs(original) do
        result[k] = v
    end
    for k, v in pairs(new_values) do
        result[k] = v
    end
    return result
end

-- BufcloseCloseIt Command
vim.cmd[[
  command! Bclose call v:lua.BufcloseCloseIt()
]]
function BufcloseCloseIt()
  local currentBufNum = vim.fn.bufnr("%")
  local alternateBufNum = vim.fn.bufnr("#")

  if vim.fn.buflisted(alternateBufNum) == 1 then
    vim.cmd("buffer #")
  else
    vim.cmd("bnext")
  end

  if vim.fn.bufnr("%") == currentBufNum then
    vim.cmd("new")
  end

  if vim.fn.buflisted(currentBufNum) == 1 then
    vim.cmd("bdelete! " .. currentBufNum)
  end
end
_G.BufcloseCloseIt = BufcloseCloseIt


function GetBufferList()
  local buf_list = vim.fn.execute('ls!')
  return buf_list
end

function ToggleList(bufname, pfx)
  local buflist = GetBufferList()
  local buffers = vim.fn.split(buflist, '\n')
  local pattern = vim.fn.escape(bufname, '"')
  for _, bufnum in ipairs(vim.fn.filter(buffers, 'v:val =~ "' .. pattern .. '"')) do
    bufnum = tonumber(vim.fn.matchstr(bufnum, "\\d\\+"))
    if vim.fn.bufwinnr(bufnum) ~= -1 then
      vim.cmd(pfx .. "close")
      return
    end
  end
  if pfx == 'l' and vim.fn.len(vim.fn.getloclist(0)) == 0 then
    vim.cmd("echohl ErrorMsg")
    vim.cmd('echo "Location List is Empty."')
    return
  end
  local winnr = vim.fn.winnr()
  vim.cmd(pfx .. "open")
  if vim.fn.winnr() ~= winnr then
    vim.cmd("wincmd p")
  end
end


-- StartProfiling Function
function StartProfiling()
  vim.cmd("profile start profile.log")
  vim.cmd("profile func *")
  vim.cmd("profile file *")
end

function OnNix()
    -- Checks for the existence of the /etc/NIXOS file, which is unique to NixOS
    local success = os.execute("test -f /etc/NIXOS")
    return success and true or false
end
