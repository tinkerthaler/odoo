with import <nixpkgs> {};

buildPythonPackage {
  name = "odoo-tink";
  buildInputs = [ pkgs.python pkgs.libxml2 pkgs.libxslt pkgs.openldap pkgs.cyrus_sasl pkgs.postgresql];
  src = null;
  # gcc won't find sasl.h if it's not in the include part
  NIX_CFLAGS_COMPILE = "-I${pkgs.cyrus_sasl}/include/sasl -I${pkgs.libxml2}/include/libxml";
}
