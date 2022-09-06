if status is-interactive
    # Commands to run in interactive sessions can go here
end

# general
set SSD "/mnt/samsung-ssd-840"
set HDD "/mnt/hdd"

alias v="nvim"
alias c="code"

# config
alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"                  

alias save_dconf="dconf dump / > $HOME/.config/dconf/vazanoir.ini"
alias load_dconf="dconf load / < $HOME/.config/dconf/vazanoir.ini"

function save_config
    save_dconf && \
    config add -u && \
    config commit -m "Update $(date +"%Y-%m-%d %H:%M") $(uname -s)/$(uname -m)" && \
    config push
end

# fish
set FISH_CONFIG "$HOME/.config/fish/config.fish"

# starship
starship init fish | source

# bin
fish_add_path "$HOME/bin"

# wine
alias wine-ge "$HOME/wine/lutris-GE-Proton7-25-x86_64/bin/wine"

# neovim
set ASTROVIM_CONFIG "$HOME/.astronvim/init.lua"

# fzf
set fzf_fd_opts --hidden --exclude=.git

# node
alias set_default_node="set --universal nvm_default_version"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

#deno
set DENO_INSTALL "$HOME/.deno"
fish_add_path "$DENO_INSTALL/bin"

# bun
set -Ux BUN_INSTALL "$HOME/.bun"
fish_add_path "$HOME/.bun/bin"

# docker
alias start_docker="sudo systemctl start docker"

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
