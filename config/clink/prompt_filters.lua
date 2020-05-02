local function verbatim(s)
  s = string.gsub(s, "%%", "%%%%")
  return s
end


-- ANSI Escape Character
local ansiEscChar = "\x1b"
-- ANSI Foreground Colors
local ansiFgBlack = 30
local ansiFgRed = 31
local ansiFgGreen = 32
local ansiFgYellow = 33
local ansiFgBlue = 34
local ansiFgMagenta = 35
local ansiFgCyan = 36
local ansiFgWhite = 37
-- ANSI Background Colors
local ansiBgBlack = 40
local ansiBgRed = 41
local ansiBgGreen = 42
local ansiBgYellow = 43
local ansiBgBlue = 44
local ansiBgMagenta = 45
local ansiBgCyan = 46
local ansiBgWhite = 47

-- Colors
local colorBlack = {
  foreground = ansiFgBlack,
  background = ansiBgBlack
}
local colorRed = {
  foreground = ansiFgRed,
  background = ansiBgRed
}
local colorGreen = {
  foreground = ansiFgGreen,
  background = ansiBgGreen
}
local colorYellow = {
  foreground = ansiFgYellow,
  background = ansiBgYellow
}
local colorBlue = {
  foreground = ansiFgBlue,
  background = ansiBgBlue
}
local colorMagenta = {
  foreground = ansiFgMagenta,
  background = ansiBgMagenta
}
local colorCyan = {
  foreground = ansiFgCyan,
  background = ansiBgCyan
}
local colorWhite = {
  foreground = ansiFgWhite,
  background = ansiBgWhite
}

local function colored(text, fg_color, bg_color)
  local out_txt = ansiEscChar .. "[" .. fg_color.foreground .. ";" .. bg_color.background .. "m"
  out_txt = out_txt .. text .. ansiEscChar .. "[0m"
  return out_txt
end

local old_prompt = ""
local current_prompt = ""
local current_fg_color = colorWhite
local current_bg_color = colorRed

local function addArrow(fg_color, bg_color)
  -- return colored("\xee\x82\xb0", fg_color, bg_color)
  return colored("", fg_color, bg_color)
end

local function addSegment(text, fg_color, bg_color)
  local new_prompt = ""
  if current_prompt ~= "" then
    -- remove last arrow
    -- the total number of characters is 15 (\x1b[NN;NNm\x1b[0m)
    -- the size of the arrow character alone is 3 bytes
    match = current_prompt:match("\x1b%[%d%d;%d%dm...\x1b%[0m$")
    if match then
      new_prompt = current_prompt:sub(0, current_prompt:len() - 15)
    end
    new_prompt = new_prompt .. addArrow(current_bg_color, bg_color)
  end
  new_prompt = new_prompt .. colored(" " .. text .. " ", fg_color, bg_color)
  new_prompt = new_prompt .. addArrow(bg_color, colorBlack)

  -- update global values
  current_prompt = new_prompt
  current_fg_color = fg_color
  current_bg_color = bg_color

  clink.prompt.value = new_prompt
end

function string:split(sep)
  sep = sep or "%s"
  local result = {}

  for str in self:gmatch("([^"..sep.."]+)") do
    table.insert(result, str)
  end

  return result
end


-- This function truncates the given cwd to the specified width by replacing
-- components of the path after the drive letter with '...' so that the total
-- length of the string doesn't exceed maxwidth. The exception to the rule is
-- if the current folder name is longer than (maxwidth - 7) so that at least the
-- current folder name is kept in its entirety.
local function truncate_cwd(cwd, maxwidth)
  maxwidth = maxwidth or 30

  -- Remove the trailing backslash
  cwd = string.gsub(cwd, "\\$", "")
  cwd_parts = cwd:split("\\")

  cwd = cwd_parts[#cwd_parts]  -- initially set to the last element of the path

  local i_cwd = #cwd_parts - 1  -- index starts before the last item

  -- iterate through the path elements and prepend to the cwd while the cwd len
  -- is smaller or equal to the maximum specifed width
  for i = i_cwd, 1, -1 do
    i_cwd = i

    -- Don't process the last element (drive letter)
    if i_cwd < 2 then
      break
    end

    -- Only prepend an additional element of the path if the element's length is
    -- not bigger than the difference between the maximum width and the current
    -- width. Otherwise, we stop prepending more elements.
    -- We also need to take into account the length of the drive letter and the
    -- 3 dots (7 characters including the 2 backslashes). However, if this is
    -- the last element of the path we don't need to worry for the 3 dots (only
    -- 4 characters).
    if #cwd_parts[i_cwd] <= maxwidth - (#cwd + 7) or
       (i_cwd == 2 and #cwd_parts[i_cwd] <= maxwidth - (#cwd + 4)) then
      cwd = cwd_parts[i_cwd] .. "\\" .. cwd
    else
      break
    end
  end

  -- If we didn't reached the final element (first), it means that we haven't
  -- processed all the elements so we add the 3 dots along with the first path
  -- element (e.g. drive letter); otherwise, simply join the drive letter to the cwd.
  if i_cwd > 1 then
    cwd = cwd_parts[1] .. "\\...\\" .. cwd
  else  -- i_cwd == 1
    cwd = cwd_parts[1] .. "\\" .. cwd
  end

  return cwd
end

local function set_prompt_filter()
  local cwd = old_prompt:match('.*(.:[^>]*)>')
  if cwd == nil then cwd = clink.get_cwd() end

  local return_code = tonumber(clink.get_env("=ExitCode"), 16) or 0
  local timestamp = os.date("%X")
  local username = clink.get_env("USERNAME")
  local hostname = clink.get_env("COMPUTERNAME")

  -- build my custom prompt
  local rc_color = colorGreen
  if return_code ~= 0 then
    rc_color = colorRed
  end

  cwd = truncate_cwd(cwd, 30)

  addSegment(return_code, colorWhite, rc_color)
  addSegment(timestamp, colorWhite, colorYellow)
  addSegment(username .. "@" ..  hostname, colorWhite, colorGreen)
  addSegment(cwd, colorWhite, colorBlue)
end


-- adapted from from clink-completions' git.lua
local function get_git_dir(path)

  -- return parent path for specified entry (either file or directory)
  local function pathname(path)
    local prefix = ""
    local i = path:find("[\\/:][^\\/:]*$")
    if i then
      prefix = path:sub(1, i-1)
    end

    return prefix
  end

  -- Checks if provided directory contains git directory
  local function has_git_dir(dir)
    return clink.is_dir(dir..'/.git') and dir..'/.git'
  end

  local function has_git_file(dir)
    local gitfile = io.open(dir..'/.git')
    if not gitfile then return false end

    local git_dir = gitfile:read():match('gitdir: (.*)')
    gitfile:close()

    return git_dir and dir..'/'..git_dir
  end

  -- Set default path to current directory
  if not path or path == '.' then path = clink.get_cwd() end

  -- Calculate parent path now otherwise we won't be
  -- able to do that inside of logical operator
  local parent_path = pathname(path)

  return has_git_dir(path)
  or has_git_file(path)
  -- Otherwise go up one level and make a recursive call
  or (parent_path ~= path and get_git_dir(parent_path) or nil)
end


---
-- Find out current branch
-- @return {nil|git branch name}
---
local function get_git_branch(git_dir)
  git_dir = git_dir or get_git_dir()

  -- If git directory not found then we're probably outside of repo
  -- or something went wrong. The same is when head_file is nil
  local head_file = git_dir and io.open(git_dir..'/HEAD')
  if not head_file then return end

  local HEAD = head_file:read()
  head_file:close()

  -- if HEAD matches branch expression, then we're on named branch
  -- otherwise it is a detached commit
  local branch_name = HEAD:match('ref: refs/heads/(.+)')

  return branch_name or 'HEAD detached at '..HEAD:sub(1, 7)
end


local function reset_prompt()
  old_prompt = clink.prompt.value
  clink.prompt.value = ""
  current_prompt = ""
  current_fg_color = colorRed
  current_bg_color = colorWhite
end


local function git_prompt_filter()
  -- Colors for git status
  local colors = {
    clean = "\x1b[1;37;40m",
    dirty = "\x1b[33;3m",
    conflict = "\x1b[31;1m"
  }
  local color = colors.clean

  local git_dir = get_git_dir()
  local branch = get_git_branch(git_dir)
  if branch then
    -- branch = "(" .. branch .. ")"
    addSegment(branch, colorWhite, colorCyan)
  else
    branch = ""
  end

  clink.prompt.value = string.gsub(clink.prompt.value, "{git}", color..verbatim(branch))
  return false
end

local function close_prompt_filter()
  prompt_tail = "$ "
  -- environment systems like pythons virtualenv change the PROMPT and usually
  -- set some variable. But the variables are differently named and we would never
  -- get them all, so try to parse the env name out of the PROMPT.
  -- envs are usually put in round or square parentheses and before the old prompt
  local env = old_prompt:match('.*%(([^%)]+)%).+:')
  -- also check for square brackets
  if env == nil then env = old_prompt:match('.*%[([^%]]+)%].+:') end

  if env ~= nil then
    prompt_tail = "(" .. env .. ") " .. prompt_tail
  end

  clink.prompt.value = clink.prompt.value .. "\n" .. prompt_tail
end

print("\n[clink] Initializing custom prompt filters...")
clink.prompt.register_filter(reset_prompt, 1)
clink.prompt.register_filter(set_prompt_filter, 2)
clink.prompt.register_filter(git_prompt_filter, 3)
clink.prompt.register_filter(close_prompt_filter, 4)