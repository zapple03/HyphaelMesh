#!/bin/bash

initUSER=$USER

cd ~

sudo pacman -S postgresql

sudo su postgres

initdb -D /var/lib/postgres/data

exit

sudo systemctl start postgresql

sudo systemctl enable postgresql

sudo su postgres

createuser -s $initUSER

createdb NodesList
