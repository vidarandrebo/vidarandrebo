install:
	-ln -s $(CURDIR)/tools/bump-version ~/.local/bin/bump-version
	-ln -s $(CURDIR)/tools/pyrestore ~/.local/bin/pyrestore
	-ln -s $(CURDIR)/tools/set-csproj-version ~/.local/bin/
	-ln -s $(CURDIR)/.vimrc ~/.vimrc
	-ln -s $(CURDIR)/nvim ~/.config/nvim

