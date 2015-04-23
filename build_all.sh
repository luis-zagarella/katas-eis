#!/usr/bin/env sh
set -e
bundle install
cd ejemplo_banco
cd ..
cd char_counter
bundle exec rake
