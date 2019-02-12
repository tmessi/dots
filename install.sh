#!/usr/bin/env bash

name=${0##*/}

function print_help() {
    echo "usage: $name [options]

optional args:

    -p|--pretend  print what install will do without doing it.
    -b|--bundle   run :PluginUpdate after install.
    -t|--tools    install useful tools. Use --help-tools to see list.
    --help-tools  list tools that will be installed.
    -h|--help     print this help."
}

function print_help_tools() {
    echo "Tools:

rmv: Ruby Version Manager  https://rvm.io/
nvm: Node Version Manager  https://github.com/creationix/nvm

Go based tools:

direnv:     Unclutter your .profile                      https://direnv.net/
gitin:      Commmit/branch/workdir explorer for git      https://github.com/isacikgoz/gitin
gocomplete: Bash completion for go                       https://github.com/posener/complete/gocomplete
gotop:      A terminal based graphical activity monitor  https://github.com/cjbassi/gotop
hclfmt:     Format hcl files                             https://github.com/fatih/hclfmt
hub:        Github wrapper for git                       https://hub.github.com/
wuzz:       Interactive cli tool for HTTP inspection     https://github.com/asciimoo/wuzz
"
}

pretend=0
bundleupdate=0
tools=0
go_tools="github.com/github/hub github.com/asciimoo/wuzz github.com/fatih/hclfmt github.com/schachmat/wego github.com/posener/complete/gocomplete github.com/isacikgoz/gitin github.com/cjbassi/gotop github.com/direnv/direnv"
OPTS=$(getopt -o pbht --long pretend,bundle,tools,help-tools,help -n "$name" -- "$@")

if [[ $? != 0 ]]; then echo "option error" >&2; exit 1; fi

eval set -- "$OPTS"

while true; do
    case "$1" in
        -p|--pretend)
            pretend=1
            shift;;
        -b|--bundle)
            bundleupdate=1
            shift;;
        -t|--tools)
            tools=1
            shift;;
        --help-tools)
            print_help_tools
            exit 0
            ;;
        -h|--help)
            print_help
            exit 0
            ;;
        --)
            shift; break;;
        *)
            echo "Internal error!"; exit 1;;
    esac
done

pushd $(dirname $0) &> /dev/null

for dot in $(ls); do
    if [[ ! $dot == "README.rst" ]] && [[ ! $dot == "install.sh" ]] && [[ ! $dot == "terminfo" ]] && [[ ! $dot == "non-gentoo" ]]; then
        target="$HOME/.$dot"

        if [[ $pretend -eq 1 ]]; then
            echo "Would set $dot"
        else
            # Make a .bak of a file or dir
            if [[ ! -h $target ]]; then
                if [[ -d $target ]] || [[ -f $target ]]; then
                    mv $target $target.bak
                fi
            fi

            echo "Setting $dot"
            ln -sf "$PWD/$dot" "$target"
        fi
    fi
done

# Do non-gentoo stuff if not on gentoo
if [[ ! $(which lsb_release) ]] || [[ "$(lsb_release -si)" != "Gentoo" ]]; then
    for dot in $(ls "non-gentoo"); do
        target="$HOME/.$dot"

        if [[ $pretend -eq 1 ]]; then
            echo "Would set $dot"
        else
            # Make a .bak of a file or dir
            if [[ ! -h $target ]]; then
                if [[ -d $target ]] || [[ -f $target ]]; then
                    mv $target $target.bak
                fi
            fi

            echo "Setting $dot"
            ln -sf "$PWD/non-gentoo/$dot" "$target"
        fi
    done
fi

# Terminfo if needed
if [[ -f /usr/share/terminfo/r/rxvt-unicode ]] && [[ -f /usr/share/terminfo/r/rxvt-unicode-256color ]]; then
    # No need for local terminfo, lets use the system one
    if [[ -d "$HOME/.terminfo" ]]; then
        if [[ $pretend -eq 1 ]]; then
            echo "Would remove $HOME/.terminfo"
        else
            echo "Remove $HOME/.terminfo"
            rm -rf "$HOME/.terminfo"
        fi
    fi
else
    dot="terminfo"
    target="$HOME/.$dot"
    if [[ $pretend -eq 1 ]]; then
        echo "Would set $dot"
    else
        # Make a .bak of a file or dir
        if [[ ! -h $target ]]; then
            if [[ -d $target ]] || [[ -f $target ]]; then
                mv $target $target.bak
            fi
        fi

        echo "Setting $dot"
        ln -sf "$PWD/$dot" "$target"
    fi
fi

# Cleanup
rm -rf "$HOME/.dzen/dzen"
rm -rf "$HOME/.terminfo/terminfo"

if [[ ! -d "$HOME/.bash-git-prompt" ]]; then
    if [[ $pretend -eq 1 ]]; then
        echo "Would install bash-git-prompt"
    else
        git clone https://github.com/magicmonty/bash-git-prompt.git "$HOME/.bash-git-prompt"
    fi
fi

if [[ $pretend -eq 1 ]]; then
    echo "Would make dirs '$HOME/.vim/{bundle,swap,backup,undo}"
else
    mkdir -p "$HOME/.vim/"{bundle,swap,backup,undo}
fi

if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
    if [[ $pretend -eq 1 ]]; then
        echo "Would install vundle"
    else
        echo "Installing vundle"
        # Cleean up old vundle install
        rm -rf $HOME/.vim/bundle/vundle
        git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim" &> /dev/null
        if [[ $bundleupdate -eq 0 ]]; then
            echo "Now start vim and run:"
            echo ":PluginInstall"
        fi
    fi
else
    echo "Vundle already installed"
fi

if [[ $bundleupdate -eq 1 ]]; then
    if [[ $pretend -eq 1 ]]; then
        echo "Would run :PluginUpdate"
    else
        echo "Running bundle update"
        vim -c PluginUpdate -c qa &> /dev/null
    fi
fi

if [[ $tools -eq 1 ]]; then
    curl_bin=$(which curl)
    if [[ -n "${curl_bin}" ]]; then
        if [[ $pretend -eq 1 ]]; then
            echo "Would install rvm"
            echo "Would install gcloud"
        else
            echo "Installing rvm"
            ${curl_bin} -sSL https://get.rvm.io | bash -s -- stable --ruby --ignore-dotfiles
            echo "Installing gcloud"
            ${curl_bin} -sSL https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir="$HOME/.gc"
        fi
    else
        echo "Skipping rmv, gcloud install, curl not found"
    fi

    if [[ $pretend -eq 1 ]]; then
        echo "Would install nvm"
    else
        echo "Installing nvm"
        [[ -d ~/.nvm/.git ]] || git clone https://github.com/creationix/nvm.git ~/.nvm
        pushd ~/.nvm &> /dev/null
        git checkout `git describe --abbrev=0 --tags`
        popd &> /dev/null
    fi

    go_bin=$(which go)
    if [[ -n "${go_bin}" ]]; then
        for tool in $go_tools; do
            if [[ $pretend -eq 1 ]]; then
                echo "Would install $tool"
            else
                echo "Installing $tool"
                go get -u $tool
            fi
        done
    else
        echo "Skipping go based tool installs, go not found"
    fi
fi

popd &> /dev/null
