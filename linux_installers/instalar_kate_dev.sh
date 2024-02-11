#! /bin/bash

# Servidores de lenguaje para Kate

## Clang
sudo apt-get install -y clangd

## Python
sudo apt-get install -y python3-pylsp

## R
sudo apt-get install -y --no-install-recommends build-essential libcurl4-openssl-dev libssl-dev libxml2-dev r-base

## Perl
sudo apt-get install -y libanyevent-perl libclass-refresh-perl libcompiler-lexer-perl libdata-dump-perl libio-aio-perl libjson-perl libmoose-perl libpadwalker-perl libscalar-list-utils-perl libcoro-perl
sudo cpan Perl::LanguageServer

## Bash
sudo npm i -g bash-language-server

## Typescript
sudo npm install -g typescript-language-server typescript

## TeX
sudo cargo install texlab

## Go
go install golang.org/x/tools/gopls@latest
