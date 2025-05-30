cd /home/floschy/.config

echo "Storing installed packages"
yay -Qqe > ./installedPackages

echo "Storing zshrc"
cp ../.zshrc ./.zshrc

echo "Storing zshrc theme"
cp ../.oh-my-zsh/custom/themes ./zshrc-themes -r

echo "Storing pihole"
cp ../custominstall/dockerstuff/pihole/docker-compose.yml ./pihole-docker-compose.yml
