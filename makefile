OS=.


sync:
	cp ~/.vimrc ${OS}/.vimrc
	cp ~/.zshrc ${OS}/.zshrc

push: sync
	git add --all
	git commit -m "env update"
	git push
