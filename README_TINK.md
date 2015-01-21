## Prepare system

In summary we will checkout a particular branch of nixpkgs that (1) contains all odoo-requirements and (2) that currently works (JAN 2015, at the moment NixOS/nixpkgs is broken wrt python packages such as ldap due to gcc->cc refactoring)

We will ensure your old nixpkgs doesn't get lost

    sudo mkdir /src
    chown $USER:users /src
    cd /src
    git clone --single-branch https://github.com/tinkerthaler/nixpkgs.git nixpkgs-odoo
    cd /etc/nixos
    sudo mv nixpkgs nixpkgs.before-odoo
    sudo ln -s /src/nixpkgs-odoo nixpkgs

## Postgres

Before moving on, let's first prepare postgres

The easiest is to install postgresql on your machine system-wide. If you don't like that you can always setup an environment for that (but you'll need to manoeuvre around a bit in the commands below but FYI: I didn't install postgresql system-wide...)

First create a postgres user

    su - 
    groupadd -g 41 postgress
    useradd -c "PostgreSQL Server" -g postgres -d /var/lib/pgsql/data -u 41 postgress
    chown -Rv postgres:postgres /var/lib/pgsql

    su - postgres -c 'createuser -s <your_account>'
    su - postgres -c 'pg_ctl --version'
    su - postgres -c 'pg_ctl -D /var/lib/pgsql/data initdb'
    su - postgres -c 'pg_ctl start -l /var/lib/pgsql/logs/postgres.log'

## Checkout odoo-8 and checkout the nix file

The easiest is to checkout my branch, but if you like you can clone the original odoo and just use (and possibly update) my default.nix

    git clone https://github.com/tinkerthaler/odoo.git

Now enter the nix-env (this might take a while because everything is build from source!)

    nix-shell 

