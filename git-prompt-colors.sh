# These are the color definitions used by gitprompt.sh
GIT_PROMPT_PREFIX=""                 # start of the git info string
GIT_PROMPT_SUFFIX=""                 # the end of the git info string
GIT_PROMPT_SEPARATOR="|"              # separates each item

GIT_PROMPT_BRANCH="${Cyan}"        # the git branch that is active in the current directory
GIT_PROMPT_STAGED="${Yellow}●"           # the number of staged files/directories
GIT_PROMPT_CONFLICTS="${Red}✖"        # the number of files in conflict
GIT_PROMPT_CHANGED="${Yellow}✚"         # the number of changed files

GIT_PROMPT_REMOTE=""                 # the remote branch name (if any) and the symbols for ahead and behind
GIT_PROMPT_UNTRACKED="${Blue}…"       # the number of untracked files/dirs
GIT_PROMPT_STASHED="${BoldBlue}⚑"     # the number of stashed files/dir
GIT_PROMPT_CLEAN="${BoldGreen}✔"      # a colored flag indicating a "clean" repo

# Prompt
if [[ "$SSH_CLIENT" ]]; then
    GIT_PROMPT_START_USER="${Red}\h"
else
    GIT_PROMPT_START_USER=
fi
if [[ "$SRT" ]]; then
    GIT_PROMPT_START_USER="(${Blue}srt${ResetColor}) $GIT_PROMPT_START_USER"
fi
GIT_PROMPT_START_ROOT=""
GIT_PROMPT_END_USER="${ResetColor}$ "
GIT_PROMPT_END_ROOT="${ResetColor}# "

# Please do not add colors to these symbols
GIT_PROMPT_SYMBOLS_AHEAD="↑·"         # The symbol for "n versions ahead of origin"
GIT_PROMPT_SYMBOLS_BEHIND="↓·"        # The symbol for "n versions behind of origin"
GIT_PROMPT_SYMBOLS_PREHASH=":"        # Written before hash of commit, if no name could be found

GIT_PROMPT_LEADING_SPACE=0
