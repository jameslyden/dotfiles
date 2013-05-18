Dotfiles Repo
-------------

## To Use
1. Clone this repo to your ~:

	````
	cd ~
	git clone <repo path>
	````

2. Run the install script:

	````
	cd dotfiles
	./install-dotfiles.sh
	````

3. If everything is satisfactory, you can delete the ~/dotfiles.orig directory


## To Add More Files
1. Copy the dotfiles desired into the dotfiles directory (strip the leading .):

	````
	cp ~/.filename ~/dotfiles/filename
	````

2. Rerun the install script:

	````
	cd ~/dotfiles
	./install-dotfiles.sh
	````

3. Add new file to repo

	````
	git add filename
	git commit
	````

