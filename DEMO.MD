## OS

Check nixpkgs

## Database
Startup database

su - postgres
nix-shell
pg_ctl start -l /var/lib/pgsql/logs/postgres.log
# password

psql
\l

# If db does not yet exist, create it
  CREATE DATABASE odoo WITH OWNER=odoo ENCODING='UTF8';
  # Go to the server to have it initialized
  ./odoo.py --addons-path=addons --log-level=debug --db-filter=paintcreation$
  master password: admin (todo: where does this come from?)
  database name: odoo
  password: password

# \c paintcreation
\c odoo
\dt
\d+ res_users
select login from res_users;


exit

cd /opt/odoo-tinkhaven
git checkout 8.0_DEMO_PAINTCREATION
./odoo.py --addons-path=addons --log-level=debug --db-filter=paintcreation$

On client
ssh -L 9000:jujuy:8069 tinkerthaler@jujuy

http://localhost:9000
steven / password
admin / password

