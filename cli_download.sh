download_dir=/downloads
mkdir -p $download_dir

# bat
wget -P $download_dir https://github.com/sharkdp/bat/releases/download/v0.24.0/bat_0.24.0_amd64.deb
# fd
wget -P $download_dir https://github.com/sharkdp/fd/releases/download/v8.3.1/fd_8.3.1_amd64.deb
# lsd
wget -P $download_dir https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd-musl_1.1.2_amd64.deb
# dust
wget -P $download_dir https://github.com/bootandy/dust/releases/download/v1.1.1/du-dust_1.1.1-1_amd64.deb
# duf
wget -P $download_dir https://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.deb
# ripgrep
wget -P $download_dir https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
# bottom
wget -P $download_dir https://github.com/ClementTsang/bottom/releases/download/0.9.7/bottom_0.9.7_amd64.deb
# delta
wget -P $download_dir https://github.com/dandavison/delta/releases/download/0.17.0/git-delta-musl_0.17.0_amd64.deb
# hyperfine
wget -P $download_dir https://github.com/sharkdp/hyperfine/releases/download/v1.18.0/hyperfine-musl_1.18.0_amd64.deb
# glances
# wget -P $download_dir https://github.com/nicolargo/glances/archive/refs/tags/v4.1.2.1.zip
# zoxide
wget -P $download_dir https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.4/zoxide_0.9.4-1_amd64.deb
# fzf
wget -P $download_dir https://github.com/junegunn/fzf/releases/download/v0.54.2/fzf-0.54.2-linux_amd64.tar.gz
# starship
wget -P $download_dir https://github.com/starship/starship/releases/download/v1.20.1/starship-x86_64-unknown-linux-musl.tar.gz
# omz
wget -P $download_dir https://github.com/ohmyzsh/ohmyzsh/archive/refs/heads/master.zip
# nvim
wget -P $download_dir https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
