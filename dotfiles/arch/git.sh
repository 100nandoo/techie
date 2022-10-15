#create dotfiles and needed dir
mkdir dotfiles
mkdir dotfiles/.config
mkdir dotfiles/.config/bspwm
mkdir dotfiles/.config/sxhkd
echo Create dotfiles and needed folder


#open folder
cd dotfiles
echo Open dotfiles folder

#initizialize git
git init
echo Initialize git

#copy some files for backup
cp ~/.Xresources ~/dotfiles/
cp ~/.xinitrc ~/dotfiles/
cp ~/.config/bspwm/bspwmrc ~/dotfiles/.config/bspwm/bspwmrc
cp ~/.config/sxhkd/sxhkdrc ~/dotfiles/.config/sxhkd/sxhkdrc
cp ~/.config/bspwm/panel_bar ~/dotfiles/.config/bspwm/panel_bar
echo Copy some files to dotfiles directory

#add file to git
git add .Xresources
git add .xinitrc
git add .config
echo Add files to git

#add github repo location
git remote add origin git@github.com:100nandoo/dotfiles.git
echo Add github repo location

#download missing files
git pull origin master
echo Download missing files

#commit
git commit -m 'Script commit'
echo Commit

#push to remote repo
git push origin master
echo Push to github
