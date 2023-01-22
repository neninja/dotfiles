# [AwesomeWM](https://awesomewm.org)

- Install
```sh
#sudo apt-get install awesome awesome-extra # ubuntu
./install.sh
```

- Atualização da snap-store para o ubuntu - quando aberto diretamente ocorre erro de autenticação (╯°□°)╯︵ ┻━┻
```sh
sudo snap refresh
```

- Atualização do google chrome:
```sh
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O ~/Downloads/chrome.deb
sudo dpkg -i --force-depends ~/Downloads/chrome.deb
rm ~/Downloads/chrome.deb
```

> Para "instalar"/executar `AppImage` precisa de permissão (``chmod +x ~/bin/file.AppImage``) e depois somente executar (``sudo ~/bin/file.AppImage --no-sandbox`` ou pelo awesome com <kbd>super</kbd><kbd>r</kbd> `$HOME/bin/file.AppImage`)

> <kbd>super</kbd><kbd>s</kbd> exibe comandos

- Transparência
```sh
sudo apt-get install compton
# configurar terminal se necessário
```

- Executar ações do awesome via terminal
```sh
echo 'require("gears").wallpaper.maximized("/home/neni/dev/dotfiles/awesomewm/wallpapers/main.jpg", require("awful").screen.focused())' | awesome-client
awesome-client '
   naughty = require("naughty")
   naughty.notify({
     text="some message"})
'
```
