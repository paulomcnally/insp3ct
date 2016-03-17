#!/bin/bash -ex
# based on http://tldp.org/HOWTO/html_single/Debian-Binary-Package-Building-HOWTO/

name=insp3ct
version=1.0

cat > debian/DEBIAN/control << EOF
Package: $name
Version: $version
Section: base
Priority: optional
Architecture: all
Depends: curl, git
Maintainer: Paulo McNally <paulomcnally@gmail.com>
Installed-Size: 2048
Homepage: http://paulomcnally.github.io/insp3ct/
Description: Identify intruders change files in git projects.
EOF

# tell dpkg that this is a configuration file
#echo /etc/default/$name > debian/DEBIAN/conffiles

# build a package
pkg=${name}_${version}_all.deb
fakeroot dpkg-deb --build debian $pkg
#cp $pkg ~/debian-repository/binary
