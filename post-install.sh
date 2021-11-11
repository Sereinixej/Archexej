
# configure touchpad

# todo

# install additional pacman packages

pacman -S plasma steam discord virtualbox libreoffice-fresh --noconfirm

# install yay

cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm

# install aur software

PKGS=(
'awesome-terminal-fonts'
'spotify'
'tlpui'
'visual-studio-code-bin'
'multimc-bin'
'brave-bin' # Brave Browser
'dxvk-bin' # DXVK DirectX to Vulcan
'ttf-droid'
'ttf-hack'
'ttf-meslo' # Nerdfont package
'ttf-roboto'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

echo "post-install script finished"
