if status is-interactive
    # Commands to run in interactive sessions can go here
end

cat $HOME/roadmap
echo

# starship
starship init fish | source

# general
alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"                  
set SSD "/mnt/samsung-ssd-840"
set HDD "/mnt/hdd"
alias v="nvim"
alias c="code"

function update_config
    config add -u && \
    config commit -m "Update $(date +"%Y-%m-%d %H:%M") $(uname -s)/$(uname -m)" && \
    config push
end

# fish
set FISH_CONFIG "$HOME/.config/fish/config.fish"

# bin
fish_add_path "$HOME/bin"

# wine
alias wine-ge "$HOME/wine/lutris-GE-Proton7-25-x86_64/bin/wine"

# neovim
set ASTROVIM_CONFIG "$HOME/.config/nvim/lua/user/init.lua"

# fzf
set fzf_fd_opts --hidden --exclude=.git

# node
alias setDefaultNodeVersion="set --universal nvm_default_version"

# pnpm
set -gx PNPM_HOME "$HOME/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH

# bun
set -Ux BUN_INSTALL "$HOME/.bun"
fish_add_path "$HOME/.bun/bin"

# cargo
set PATH $HOME/.cargo/bin $PATH

# steam
set STEAM_COMMON_OS "$HOME/.steam/steam/steamapps/common"
set -l steamLibraryCommon "SteamLibrary/steamapps/common"
set STEAM_COMMON_SSD "$SSD/$steamLibraryCommon"
set STEAM_COMMON_HDD "$HDD/$steamLibraryCommon"

# doom eternal
set DOOM_ETERNAL "$STEAM_COMMON_OS/DOOMEternal"
set -l eternalInjector "EternalModInjectorShell.sh"
alias injectEternal="cd $DOOM_ETERNAL && bash $eternalInjector && cd -"
