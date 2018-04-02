all: install

setup:
	mkdir -p ${HOME}/bin
	mkdir -p ${HOME}/.emacs.d
	mkdir -p ${HOME}/.profile.d
	mkdir -p ${HOME}/.stack
	mkdir -p ${HOME}/.vim/spell

install: setup
	stow --target=${HOME} home
	stow --target=${HOME}/bin bin
	ln -s $(shell pwd)/special/gitignore ${HOME}/.gitignore

clean:
	stow --target=${HOME} --delete home
	stow --target=${HOME}/bin --delete bin
	test -L ${HOME}/.gitignore && rm ${HOME}/.gitignore

reinstall: clean install
