base vagrant box
================

## Description

This is a simple lamp stack sandbox

## Installation

Make use of librarian-puppet to get avoid of git submodules

https://github.com/voxpupuli/librarian-puppet

	cd environments/dev
	librarian-puppet install

You're done!

## Make it run

	vagrant up

## Machine data

OS: Ubuntu/Xenial 64

Apache ServerName: sandbox.dev

IP: 192.168.56.211

PHP Version 7.1 (fpm)

MailHog - current (http://sandbox.dev:8025)

## SSH user

Username: sandbox

Password: start100

## MySQL user

Username: root

Password: start100
