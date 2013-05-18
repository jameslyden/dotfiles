#!/bin/bash
# Symlinks ~/dotfiles/.* to their proper locations

srcdir=~/dotfiles
backup=~/dotfiles.orig
files="$(ls -1 $srcdir)"
#files="vim vimrc viminfo gitconfig"

# Back up existing dotfiles
printf "Backing up existing files to %s:\n" $backup
mkdir -p $backup
for file in $files; do
	if [ -e ~/.$file ]; then
		printf "\t~/.%s\n" $file
		mv ~/.$file $backup/$file
	else
		printf "\tNOT FOUND: %s\n" $file
	fi
done

# Link dotfiles from $srcdir to ~
printf "Linking files from %s to ~:\n" $srcdir
for file in $files; do
	if [ $file == "install-dotfiles.sh" ]; then
		printf "\tSKIPPED: %s\n" $file
	elif [ $file == "README.md" ]; then
		printf "\tSKIPPED: %s\n" $file
	else
		printf "\t%s/%s => ~/.%s\n" $srcdir $file $file
		ln -s $srcdir/$file ~/.$file
	fi
done

