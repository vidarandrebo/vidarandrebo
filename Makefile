.PHONY: install instructions generate-agents copilot junie clean clean-instructions clean-agents clean-copilot clean-junie

install:
	@mkdir -p ~/.local/bin ~/.config
	-ln -s $(CURDIR)/tools/bump-version ~/.local/bin/bump-version
	-ln -s $(CURDIR)/tools/pyrestore ~/.local/bin/pyrestore
	-ln -s $(CURDIR)/tools/set-csproj-version ~/.local/bin/
	-ln -s $(CURDIR)/tools/gitmain ~/.local/bin/
	-ln -s $(CURDIR)/.vimrc ~/.vimrc
	-ln -s $(CURDIR)/.vimrc ~/.ideavimrc
	-ln -s $(CURDIR)/nvim ~/.config/nvim
	$(MAKE) instructions

instructions: instructions/AGENTS.md copilot junie

instructions/AGENTS.md: instructions/common.md $(wildcard instructions/languages/*/instructions.md) tools/generate-agents
	$(CURDIR)/tools/generate-agents

agents: instructions/AGENTS.md

generate-agents: agents

copilot:
	@mkdir -p ~/.copilot
	-ln -s $(CURDIR)/instructions/common.md ~/.copilot/copilot-instructions.md
	-ln -s $(CURDIR)/instructions/languages ~/.copilot/instructions

junie: instructions/AGENTS.md
	@mkdir -p ~/.junie
	-ln -s $(CURDIR)/instructions/AGENTS.md ~/.junie/AGENTS.md

clean-agents:
	rm -f $(CURDIR)/instructions/AGENTS.md

clean-copilot:
	rm -f ~/.copilot/copilot-instructions.md ~/.copilot/instructions

clean-junie:
	rm -f ~/.junie/AGENTS.md

clean-instructions: clean-agents clean-copilot clean-junie

clean: clean-instructions

