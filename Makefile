OS := $(shell uname)

all: install

setup:
	mkdir -p ${HOME}/bin
	mkdir -p ${HOME}/.cabal
	mkdir -p ${HOME}/.config
	mkdir -p ${HOME}/.config/alacritty
	mkdir -p ${HOME}/.emacs.d
	mkdir -p ${HOME}/.profile.d
	mkdir -p ${HOME}/.stack

install: setup
	stow -v --target=${HOME} home
ifeq ($(OS), Darwin)
	stow -v --dir=mac --target=${HOME} home
endif
ifeq ($(OS), Linux)
	stow -v --dir=linux --target=${HOME} home
endif
	ln -s $(shell pwd)/special/gitignore ${HOME}/.gitignore

clean:
	test -L ${HOME}/.gitignore && rm ${HOME}/.gitignore || :
	stow -v --target=${HOME} --delete home
ifeq ($(OS), Darwin)
	stow -v --dir=mac --target=${HOME} --delete home
endif
ifeq ($(OS), Linux)
	stow -v --dir=linux --target=${HOME} --delete home
endif

reinstall: clean install
