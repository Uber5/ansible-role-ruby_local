#!/bin/bash -e

git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc

source ~/.bashrc # TODO: why is this not effectice? PATH in the current script
                 # remains the same... (it's because of the initial conditionals in bashrc...)

git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash

export PATH=$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

rbenv install 2.2.0
rbenv global 2.2.0

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler

echo "done" > ~/.ruby-installed-via-ansible
