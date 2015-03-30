#{ stdenv, fetchurl, python27, python27Package }:

let
  pkgs = import <nixpkgs> {};
  stdenv = pkgs.stdenv;
  fetchurl = pkgs.fetchurl;
  python27 = pkgs.python27;
  
in stdenv.mkDerivation {
  name = "odoo";
  src = fetchurl {
    url = https://nightly.odoo.com/8.0/nightly/src/odoo_8.0.20150330.tar.gz;
    md5 = "8686e5fbc3f1d36c38948645d8b3ffc1";
  };
  buildInputs = with pkgs.python27Packages; [
    setuptools
    Babel
    jinja2
    Mako
    markupsafe
    pillow
    pychart
    pyyaml
    werkzeug
    argparse
    decorator
    docutils
    feedparser
    gdata
    gevent
    greenlet
    jcconv
    lxml
    mock
    passlib
    psutil
    psycogreen
    psycopg2
    pyPdf
    pydot
    pyparsing
    pyserial
    dateutil
    # Note: ldap fails to build (gcc -> cc change in nixpkgs.)
    #       temp workaround undo commits (see https://github.com/NixOS/nixpkgs/issues/5655)
    ldap
    openid
    pytz
    pyusb
    qrcode
    reportlab
    requests
    simplejson
    six
    unittest2
    vatnumber
    vobject
    wsgiref
    xlwt
    pkgs.postgresql
    pkgs.nodejs
    pkgs.nodePackages.npm
    pkgs.nodePackages.less
    pkgs.nodePackages.less-plugin-clean-css
  ];

  PGDATA="/var/lib/pgsql/data";

  inherit python27;
}
