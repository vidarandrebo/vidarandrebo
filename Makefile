.PHONY: install tools vim nvim instructions generate-agents copilot junie clean clean-instructions clean-agents clean-copilot clean-junie

install: tools vim nvim instructions

tools:
	@mkdir -p ~/.local/bin
	-ln -s $(CURDIR)/tools/bump-version ~/.local/bin/bump-version
	-ln -s $(CURDIR)/tools/pyrestore ~/.local/bin/pyrestore
	-ln -s $(CURDIR)/tools/set-csproj-version ~/.local/bin/
	-ln -s $(CURDIR)/tools/gitmain ~/.local/bin/

vim:
	-ln -s $(CURDIR)/.vimrc ~/.vimrc
	-ln -s $(CURDIR)/.vimrc ~/.ideavimrc

nvim:
	@mkdir -p ~/.config
	-ln -sT $(CURDIR)/nvim ~/.config/nvim

instructions: instructions/AGENTS.md copilot junie

instructions/AGENTS.md: instructions/common.md $(wildcard instructions/languages/*/*.instructions.md) tools/generate-agents
	$(CURDIR)/tools/generate-agents

agents: instructions/AGENTS.md

generate-agents: agents

copilot:
	@mkdir -p ~/.copilot
	-ln -s $(CURDIR)/instructions/common.md ~/.copilot/copilot-instructions.md
	-ln -sT $(CURDIR)/instructions/languages ~/.copilot/instructions
	-ln -sT $(CURDIR)/skills ~/.copilot/skills

junie: instructions/AGENTS.md
	@mkdir -p ~/.junie
	-ln -s $(CURDIR)/instructions/AGENTS.md ~/.junie/AGENTS.md

clean-agents:
	rm -f $(CURDIR)/instructions/AGENTS.md

clean-copilot:
	rm -f ~/.copilot/copilot-instructions.md ~/.copilot/instructions ~/.copilot/skills

clean-junie:
	rm -f ~/.junie/AGENTS.md

clean-instructions: clean-agents clean-copilot clean-junie

clean: clean-instructions

