override_git_prompt_colors() {
    # http://unix.stackexchange.com/questions/124407/what-color-codes-can-i-use-in-my-ps1-prompt
    Bg="48;5;235";
    GreenWithBg="\[\e[38;5;10;${Bg}m\]"
    CyanWithBg="\[\e[38;5;12;${Bg}m\]"
    YellowWithBg="\[\e[38;5;11;${Bg}m\]"
    RedWithBg="\[\e[38;5;9;${Bg}m\]"
    BlueWithBg="\[\e[38;5;39;${Bg}m\]"
    GrayWithBg="\[\e[38;5;252;${Bg}m\]"
    ResetWithBg="\[\e[0;0;${Bg}m\]"
    BgToFg="\[\e[38;5;235m\]"
    BlueBg="\[\e[38;5;235;48;5;39m\]"

    GIT_PROMT_THEME_NAME="fax"

    # These are the color definitions used by gitprompt.sh
    GIT_PROMPT_PREFIX=""                 # start of the git info string
    GIT_PROMPT_SUFFIX=""                 # the end of the git info string
    GIT_PROMPT_SEPARATOR="${ResetWithBg}|"           # separates each item

    GIT_PROMPT_BRANCH="${CyanWithBg}"           # the git branch that is active in the current directory
    GIT_PROMPT_STAGED="${YellowWithBg}●"    # the number of staged files/directories
    GIT_PROMPT_CONFLICTS="${RedWithBg}✖"    # the number of files in conflict
    GIT_PROMPT_CHANGED="${YellowWithBg}✚"   # the number of changed files

    GIT_PROMPT_REMOTE="${ResetWithBg}"                   # the remote branch name (if any) and the symbols for ahead and behind
    GIT_PROMPT_UNTRACKED="${BlueWithBg}…"    # the number of untracked files/dirs
    GIT_PROMPT_STASHED="${BlueWithBg}⚑"  # the number of stashed files/dir
    GIT_PROMPT_CLEAN="${GreenWithBg}✔"   # a colored flag indicating a "clean" repo

    ## For the command indicator, the placeholder _LAST_COMMAND_STATE_
    ## will be replaced with the exit code of the last command
    ## e.g.
    ## GIT_PROMPT_COMMAND_OK="${Green}✔-_LAST_COMMAND_STATE_ "    # indicator if the last command returned with an exit code of 0
    ## GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_ "    # indicator if the last command returned with an exit code of other than 0

    # GIT_PROMPT_COMMAND_OK="${Green}✔"    # indicator if the last command returned with an exit code of 0
    # GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_"    # indicator if the last command returned with an exit code of other than 0

    ## template for displaying the current virtual environment
    ## use the placeholder _VIRTUALENV_ will be replaced with
    ## the name of the current virtual environment (currently CONDA and VIRTUAL_ENV)
    GIT_PROMPT_VIRTUALENV="${BlueBg}_VIRTUALENV_${BlueWithBg}${ResetWithBg} "

    # Prompt
    if [[ "$SSH_CLIENT" ]]; then
        GIT_PROMPT_START_USER="${RedWithBg}\h${GrayWithBg}$(jobscount)"
    else
        GIT_PROMPT_START_USER="${GrayWithBg}$(jobscount)"
    fi
    if [[ "$SRT" ]]; then
        GIT_PROMPT_START_USER="(${BlueWithBg}srt${ResetWithBg}) $GIT_PROMPT_START_USER"
    fi
    GIT_PROMPT_START_ROOT=""
    GIT_PROMPT_END_USER="${ResetWithBg}\$${ResetColor}${BgToFg}${ResetColor} "
    GIT_PROMPT_END_ROOT="${RedWithBg}#${ResetColor}${BgToFg}${ResetColor} "

    ## Please do not add colors to these symbols
    GIT_PROMPT_SYMBOLS_AHEAD="${ResetWithBg}↑·"           # The symbol for "n versions ahead of origin"
    GIT_PROMPT_SYMBOLS_BEHIND="${ResetWithBg}↓·"          # The symbol for "n versions behind of origin"
    GIT_PROMPT_SYMBOLS_PREHASH="${ResetWithBg}:"            # Written before hash of commit, if no name could be found
    GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING="${ResetWithBg}L" # This symbol is written after the branch, if the branch is not tracked

    GIT_PROMPT_LEADING_SPACE=0
}

reload_git_prompt_colors "fax"

GIT_PROMPT_PREFIX=""                 # start of the git info string
GIT_PROMPT_SUFFIX=""                 # the end of the git info string
