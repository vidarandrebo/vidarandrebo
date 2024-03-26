install:
	-ln -s $(CURDIR)/tools/bump-version ~/.local/bin/bump-version
	-ln -s $(CURDIR)/tools/pyrestore ~/.local/bin/pyrestore
	-ln -s $(CURDIR)/tools/set-csproj-version ~/.local/bin/
	-ln -s $(CURDIR)/.vimrc ~/.vimrc
	-mkdir ~/.config/nvim
	-ln -s $(CURDIR)/init.lua ~/.config/nvim/
	-ln -s $(CURDIR)/coc-settings.json ~/.config/nvim/

