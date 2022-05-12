pacman -S bluetooth --noconfirm
systemctl enable bluetooth
systemctl start bluetooth
pacman -S pipewire-pulse --noconfirm
pkgs=( "flameshot" "optimus-manager" "libreoffice-fresh" "neofetch" "brave-bin" "visual-studio-code-bin" )
for i in "${pkgs[@]}"
do
	echo "installing $i ..."
        paru -S $i --skipreview --noconfirm
done
