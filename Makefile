all: install

setup:
	mkdir -p ${HOME}/.stack
	mkdir -p ${HOME}/.vim

install: setup
	stow --target=${HOME} home
	ln -s special/gitignore ${HOME}/.gitignore

clean:
	stow --target=${HOME} --delete home
	test -L ${HOME}/.gitignore && rm ${HOME}/.gitignore

reinstall: clean install
