#!/bin/bash

# erlang solutions repo
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
sudo apt-get update
sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir
mix local.hex --force
mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
