local green  = "\x1b[92m"
--local green = "\xff\xfe\x1b\x00[\x009\x002\x00m\x00"
--local yellow = "\x1b[93m"
local yellow = "\x1b[38;5;226m"
--local yellow = "\xff\xfe\x1b\x00[\x009\x003\x00m\x00"
local cyan   = "\x1b[36m"
--local cyan = "\xff\xfe\x1b\x00[\x003\x006\x00m\x00"
local red = "\x1b[31;1m"
local redish = "\x1b[38;5;9m"
local normal = "\x1b[0m"

local curve_down = "\xe2\x95\xad\xe2\x94\x80\xe2\x94\x80"
local curve_up = "\xe2\x95\xb0\xe2\x94\x80\xe2\x94\x80\xc2\xbb"
local arrow_prompt = "\xee\x8a\x85\xee\xae\x9e"
local branch_icon = "\xe2\x89\xa2"

local prev_dir -- Most recent git repo visited
local prev_info -- Most recent info retrieved by the coroutine

-- The following example illustrates running git status in the background.
-- It also remembers the status from the previous input line, so that it can
-- reduce flicker by using the color from last time until the background status operation completes.

local function get_git_dir(dir)
    -- Check if current directory is in a git repo
    local child
    repeat
        if os.isdir(path.join(dir, ".git")) then
            return dir
        end
        -- Walk up one level to the parent directory
        dir,child = path.toparent(dir)
        -- If child is empty, we've reached the top
    until (not child or child == "")
    return nil
end

local function get_git_branch()
    -- Get the current git branch name
    local file = io.popen("git branch --show-current 2>nul")
    local branch = file:read("*a"):match("(.+)\n")
    file:close()
    return branch
end

local function get_git_status()
    -- The io.popenyield API is like io.popen, but it yields until the output is
    -- ready to be read.
    local file = io.popenyield("git --no-optional-locks status --porcelain 2>nul")
    local status = false
    for line in file:lines() do
        -- If there's any output, the status is not clean. Since this example
        -- doesn't analyze the details, it can stop once it knows there's any
        -- output at all.
        status = true
        break
    end
    file:close()
    return status
end

local function get_git_conflict()
    -- The io.popenyield API is like io.popen, but it yields until the output is
    -- ready to be read.
    local file = io.popenyield("git diff --name-only --dif-filter=U 2>nul")
    local conflict = false
    for line in file:lines() do
        -- If there's any output, there's a conflict.
        conflict = true
        break
    end
    file:close()
    return conflict
end

local function get_git_stash()
    -- Extract stash count using 'sed'
    local file = io.popenyield("git --no-optional-locks status --show-stash 2>nul") --| tail -n 1 | sed -ne 's/^.*\([0-9]\+\).*/\1/p' 2>nul")
    local stash_count = ""
    for line in file:lines() do
        -- If there's any output, there are items stashed
        stash_count = line
        break
    end
    file:close()
    return stash_count
end

--[[local function get_git_added()
    -- 'A' is added
    local file = io.popenyield("git --no-optional-locks status --short 2>nul")
    --local added = file:read("*a"):match("AM?")
    local added_count = 0
    for line in file:lines() do
        if line:match("AM?") then
            added_count += 1
        end
    end
    file:close()
    return added_count
end--]]
--
--local function get_git_modified()
--    -- 'M' is modified
--    local modified_count = 0
--    return modified_count
--end
--
--local function get_get_untracked()
--    -- '?' is untracked
--    local untracked_count = 0
--    return untracked_count
--end

local function collect_git_info()
    -- This is run inside the coroutine, which happens while idle while waiting
    -- for keyboard input.
    local info = {}
    info.status = get_git_status()
    info.conflict = get_git_conflict()
    -- Until this returns, the call to clink.promptcoroutine() will keep
    -- returning nil. After this returns, subsequent calls to
    -- clink.promptcoroutine() will keep returning this retrn value, until a
    -- new input line begins.
    return info
end

local git_prompt = clink.promptfilter(55)
function git_prompt:filter(prompt)
    -- Do nothing if not a git repo.
    local dir = get_git_dir(os.getcwd())
    if not dir then
        return
    end
    -- Reset the cached status if in a different repo.
    if prev_dir ~= dir then
        prev_info = nil
        prev_dir = dir
    end
    -- Do nothing if the git branch is not available. Getting the branch name is fast,
    -- so it can run outside the coroutine. That way the branch name is visible
    -- even while the coroutine is running
    local branch = get_git_branch()
    if not branch or branch == "" then
        return
    end
    -- Start a coroutine to collect various git info in the background.  The
    -- clink.promptcoroutine() call returns nil immediately, and the
    -- coroutine runs in the background.  After the coroutine finishes, prompt
    -- filtering is triggered again, and subsequent clink.promptcoroutine()
    -- calls from this prompt filter immediately return whatever the
    -- collect_git_info() function returned when it completed.  When a new input
    -- line begins, the coroutine results are reset to nil to allow new results.
    local info = clink.promptcoroutine(collect_git_info)
    -- If no status yet, use the status from the previous prompt.
    if info == nil then
        info = prev_info or {}
    else
        prev_info = info
    end
    -- Choose color for the git branch name: green if status is clean, yellow
    -- if status is not clean, red if conflict is present, or default color if
    -- status isn't known yet
    local sgr = cyan
    if info.conflict then
        sgr = red
    elseif info.status ~= nil then
        sgr = info.status and yellow or green
    end
    -- Prefix (or Suffix) the prompt with "[branch]" using the status color.
    return prompt..cyan.."["..sgr..""..branch..redish.." "..branch_icon..cyan.."]"..normal--..prompt
end

-- A prompt filter that appends the current git branch.
local git_branch_prompt = clink.promptfilter(65)
function git_branch_prompt:filter(prompt)
    local line = io.popen("git branch --show-current 2>nul"):read("*a")
    local branch = line:match("(.+)\n")
    if branch then
        return prompt..""..cyan.."["..branch..redish.." "..branch_icon..cyan.."]"..normal
    end
end
