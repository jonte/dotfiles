#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ "`which curl`" == "" ]; then
    echo "You need to install curl"
    exit 1
fi

for f in $DIR/* $DIR/.[!.]*;
do
	if [ `basename $f` = "setup.sh" ] && [ `basename $f` != ".git" ]; then
		continue
	fi

	ln -s $f ~/$(basename $f)
done

# Deploy symlinks

# Install vim stuff

# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Airline
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline

# Fugitive
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

# Better whitespace
git clone git://github.com/ntpeters/vim-better-whitespace.git ~/.vim/bundle/vim-better-whitespace
