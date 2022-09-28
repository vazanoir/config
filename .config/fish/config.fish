if status is-interactive
    # Commands to run in interactive sessions can go here
end

# general
set SSD "/mnt/ssd"
set HDD "/mnt/hdd"
set -U fish_greeting

alias v "nvim"

# config
function config
    git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end

function save_astronvim
    mkdir $HOME/.astronvim
    touch $HOME/.astronvim/init.lua
    cp $HOME/.config/nvim/lua/user/init.lua $HOME/.astronvim/init.lua
end

function load_astronvim
    mkdir $HOME/.config/nvim/lua/user
    touch $HOME/.config/nvim/lua/user/init.lua
    cp $HOME/.astronvim/init.lua $HOME/.config/nvim/lua/user/init.lua
end

function save_config
    save_astronvim && \
    config add -u && \
    config commit -m "Update $(date +"%Y-%m-%d %H:%M") $(uname -s)/$(uname -m)" && \
    config push
end

function load_config
    config fetch --all && \
    config reset --hard origin/main && \
    load_astronvim
end

# starship
starship init fish | source

# bin
fish_add_path "$HOME/bin"
fish_add_path "$HOME/.local/bin"

# fzf
set fzf_fd_opts --hidden --exclude=.git

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

#deno
set DENO_INSTALL "$HOME/.deno"
fish_add_path "$DENO_INSTALL/bin"

# bun
set -Ux BUN_INSTALL "$HOME/.bun"
fish_add_path "$HOME/.bun/bin"

# cargo
set PATH $HOME/.cargo/bin $PATH

# steam
set -l steamLibraryCommon "SteamLibrary/steamapps/common"

set STEAM_COMMON_OS "$HOME/.steam/steam/steamapps/common"
set STEAM_COMMON_SSD "$SSD/$steamLibraryCommon"
set STEAM_COMMON_HDD "$HDD/$steamLibraryCommon"

# doom eternal
set DOOM_ETERNAL "$STEAM_COMMON_OS/DOOMEternal"

function inject_eternal
    cd $DOOM_ETERNAL && \
    bash "EternalModInjectorShell.sh" && \
    cd -
end

# exec
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty &> /dev/null
    end
end
