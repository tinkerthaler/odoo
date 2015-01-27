Startup database

su - postgres
nix-shell
pg_ctl start -l /var/lib/pgsql/logs/postgres.log
# password

psql
\l

\c paintcreation
\dt
\d+ res_users
select login from res_users;


exit

cd /opt/odoo-tinkhaven
./odoo.py --addons-path=addons --db-filter=paintcreation$

On client
ssh -L 9000:jujuy:8069 tinkerthaler@jujuy

http://localhost:9000
steven / password
admin / password

