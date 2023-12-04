local green  = "\x1b[92m"
--local green = "\xff\xfe\x1b\x00[\x009\x002\x00m\x00"
--local yellow = "\x1b[93m"
local yellow = "\x1b[38;5;226m"
--local yellow = "\xff\xfe\x1b\x00[\x009\x003\x00m\x00"
local cyan   = "\x1b[36m"
--local cyan = "\xff\xfe\x1b\x00[\x003\x006\x00m\x00"
local normal = "\x1b[0m"
--local normal = "\xff\xfe\x1b\x00[\x000\x00m\x00"
local blue = "\x1b[1;34m"
-- local pound = "\xe2\x95\xad\xe2\x94\x80\xe2\x94\x80\n\xe2\x95\xb0\xe2\x94\x80\xe2\x94\x80>"
-- local pound = "\u256d\u2500\u2500\n\u2570\u2500\u2500"
-- \xe2\x95\xad\xe2\x94\x80\xe2\x94\x80\n\xe2\x95\xb0\xe2\x94\x80\xe2\x94\x80\xc2\xbb>
local curve_down = "\xe2\x95\xad\xe2\x94\x80\xe2\x94\x80"
local curve_up = "\xe2\x95\xb0\xe2\x94\x80\xe2\x94\x80\xc2\xbb"
local arrow_prompt = "\xee\x8a\x85\xee\xae\x9e"
local python_icon = "\xee\x88\xb5"

-- A prompt filter that discards any prompt so far and sets the
-- prompt to the current working directory.  An ANSI escape code
-- colors it yellow.
local cwd_prompt = clink.promptfilter(30)
function cwd_prompt:filter(prompt)
--      print(pound)
    return "["..yellow..os.getcwd()..normal.."] "
end

-- A prompt filter that inserts the date at the beginning of the
-- the prompt.  An ANSI escape code colors the date green.
local date_prompt = clink.promptfilter(40)
function date_prompt:filter(prompt)
    return curve_down.."["..green..os.date("%a %H:%M")..normal.."] "..prompt
end

-- A prompt filter that may stop further prompt filtering.
-- This is a silly example, but on Wednesdays, it stops the
-- filtering, which in this example prevents git branch
-- detection and the line feed and angle bracket.
--local wednesday_silliness = clink.promptfilter(60)
--function wednesday_silliness:filter(prompt)
--    if os.date("%a") == "Wed" then
        -- The ,false stops any further filtering.
--        return prompt.." HAPPY HUMP DAY! ", false
--    end
--end

-- A prompt filter that appends the current git branch.
--local git_branch_prompt = clink.promptfilter(65)
--function git_branch_prompt:filter(prompt)
--    local line = io.popen("git branch --show-current 2>nul"):read("*a")
--    local branch = line:match("(.+)\n")
--    if branch then
--        return prompt.." "..cyan.."["..branch.."]"..normal
--    end
--end

-- A prompt filter that adds a line feed and angle bracket.
local bracket_prompt = clink.promptfilter(150)
function bracket_prompt:filter(prompt)
    return prompt.."\n"..curve_up..arrow_prompt.." "
end

-- A promopt filter that inserts the python virtual environment
-- prompt at the beginning of the prompt. An ANSI escape code colors
-- the virtual environment name.
--local venv_prompt = clink.promptfilter(160)
--function venv_prompt:filter(prompt)
--    if os.getenv("VIRTUAL_ENV") then
--      local venv_name = os.getenv("VIRTUAL_ENV_PROMPT")
 --       local venv_prompt_name = string.gsub(venv_name, "\(", "")
--      venv_prompt_name = venv_prompt_name:gsub("\)", "")
--        return  " ("..blue..python_icon.." "..venv_prompt_name..normal..")"..prompt
--    end
--end
