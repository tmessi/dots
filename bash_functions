# vim: set filetype=sh :

function cd(){
    if [[ $# -eq 0 ]]; then
        builtin cd $(git rev-parse --show-toplevel 2> /dev/null)
    else
        builtin cd "$@"
    fi
}

function ve() {
    # Use cwd for virtualenv name
    venv_name=${PWD##*/}

    # If this virtualenv is not active
    if [[ "$VIRTUAL_ENV" != "$PWD/.pyenv/$venv_name" ]]; then

        # Deactivate current virtualenv
        [[ $VIRTUAL_ENV ]] && deactivate

        # Create new virtualenv if needed
        [[ ! -f .pyenv/$venv_name/bin/activate ]] && rm -rf .pyenv && virtualenv .pyenv/$venv_name &> /dev/null

        # Activate virtualenv
        source .pyenv/$venv_name/bin/activate

    fi
    # Install requirements.txt if available
    [[ -f requirements.txt ]] && $(which pip) install -r requirements.txt &> /dev/null

    # Install dev_requirements.txt if available
    [[ -f dev_requirements.txt ]] && $(which pip) install -r dev_requirements.txt &> /dev/null
}

function rmpyc() {
    find . -name "*.pyc" -exec rm -rf {} \;
}

function srt() {
    if [[ $# -eq 1 ]]; then
        STEAM_RUNTIME_TARGET_ARCH="$1"
    else
        STEAM_RUNTIME_TARGET_ARCH="amd64"
    fi
    if [[ "$(uname -m)" == "x86_64" ]]; then
        STEAM_RUNTIME_HOST_ARCH="amd64"
    else
        STEAM_RUNTIME_HOST_ARCH="i386"
    fi
    local runtime="$HOME/opt/steam-runtime-sdk_2013-09-05/runtime/"
    STEAM_RUNTIME_ROOT="$runtime/${STEAM_RUNTIME_TARGET_ARCH}"
    export STEAM_RUNTIME_HOST_ARCH STEAM_RUNTIME_TARGET_ARCH STEAM_RUNTIME_ROOT
    if [[ -z $NOSRT_PATH ]]; then
        export NOSRT_PATH="$PATH"
    fi
    PATH="$HOME/opt/steam-runtime-sdk_2013-09-05/bin:$PATH"
    if [[ -z $NOSRT_LD_LIBRARY_PATH ]]; then
        export NOSRT_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
    fi
    export LD_LIBRARY_PATH="$runtime/i386/lib/i386-linux-gnu:$runtime/i386/lib:$runtime/i386/usr/lib/i386-linux-gnu:$runtime/i386/usr/lib:$runtime/amd64/lib/x86_64-linux-gnu:$runtime/amd64/lib:$runtime/amd64/usr/lib/x86_64-linux-gnu:$runtime/amd64/usr/lib:$NOSRT_LD_LIBRARY_PATH"
    export SRT="enabled"
}

function usrt() {
    PATH="$NOSRT_PATH"
    LD_LIBRARY_PATH="$NOSRT_LD_LIBRARY_PATH"
    export PATH
    unset STEAM_RUNTIME_HOST_ARCH STEAM_RUNTIME_TARGET_ARCH STEAM_RUNTIME_ROOT NOSRT_PATH SRT NOSRT_LD_LIBRARY_PATH
}