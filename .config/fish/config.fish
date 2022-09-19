if status is-interactive
    # Commands to run in interactive sessions can go here
end

# installation
function install_basics
    sudo pacman -S --needed --noconfirm base-devel
    sudo pacman -S --noconfirm firefox alacritty vim nvim fish \
    ttf-nerd-fonts-symbols-2048-em-mono starship \
    neofetch redshift feh tmux ripgrep \
    docker jq fzf fd bat

    mkdir $HOME/Développement
    cd $HOME/Développement

    # fira code
    git clone https://aur.archlinux.org/nerd-fonts-fira-code.git
    cd nerd-fonts-fira-code
    makepkg -si --noconfirm
    cd ..

    # httpdirfs | dependency
    git clone https://aur.archlinux.org/httpdirfs.git
    cd httpdirfs
    makepkg -si --noconfirm
    cd ..

    # microsoft fonts from w11
    git clone https://aur.archlinux.org/ttf-ms-win11-auto.git
    cd ttf-ms-win11-auto
    makepkg -s
    sudo pacman -U --noconfirm $(ls | string match -r --entire 'ttf-ms-win11-auto-[0-9]')
    cd ..
end

# general
set SSD "/mnt/samsung-ssd-840"
set HDD "/mnt/hdd"
set -U fish_greeting

alias l "exa -la"
alias v "nvim"
alias c "code"

# config
alias config "git --git-dir=$HOME/.cfg/ --work-tree=$HOME"                  

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
    load_astronvim && \
    config fetch --all
    config reset --hard origin/main
end

# starship
starship init fish | source

# bin
fish_add_path "$HOME/bin"
fish_add_path "$HOME/.local/bin"

# wine
alias wine-ge "$HOME/wine/lutris-GE-Proton7-25-x86_64/bin/wine"

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
        exec startx -- -keeptty
    end
end
