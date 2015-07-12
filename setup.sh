#!/usr/bin/env bash

git clone https://github.com/wujuguang/kytmux.git ~/kytmux/
git clone https://github.com/erikw/tmux-powerline.git ~/kytmux/tmux-powerline/
git clone https://github.com/tmux-plugins/tpm.git ~/kytmux/tmux/plugins/tpm/

mv ~/.tmux ~/.tmux.bck
mv ~/.tmux.conf ~/.tmux.conf.bck
mv ~/.tmux-powerline ~/.tmux-powerline.bck

ln -s ~/kytmux/tmux ~/.tmux
ln -s ~/kytmux/tmux.conf ~/.tmux.conf
ln -s ~/kytmux/tmux-powerline ~/.tmux-powerline

# 安装tmux-powerline依赖与字体
sudo pip install powerline-status
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

mkdir -p ~/.fonts/ ~/.config/fontconfig/conf.d/
mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.fonts/

# 自定义状态栏
~/.tmux-powerline/generate_rc.sh
cp ~/.tmux-powerline/themes/default.sh ~/.tmux-powerline/themes/mine.sh
mv ~/.tmux-powerlinerc.default ~/.tmux-powerlinerc
# 修改~/.tmux-powerline/themes/mine.sh ~/.tmux-powerlinerc

# 安装tpm下插件
tmux new-session -d
tmux run "~/kytmux/tmux/plugins/tpm/scripts/install_plugins.sh"
tmux kill-session

echo "配置完毕!"
echo "你可能需要手动修改: ~/.tmux-powerline/themes/mine.sh ~/.tmux-powerlinerc 文件!"
