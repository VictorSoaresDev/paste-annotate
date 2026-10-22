#!/bin/sh
# Build paste-annotate_<version>_all.deb in the current directory.
set -eu
cd "$(dirname "$0")/.."
version=${1:-1.0.1}
root=$(mktemp -d)
trap 'rm -rf "$root"' EXIT

mkdir -p "$root/DEBIAN" "$root/usr/bin" "$root/etc/xdg/autostart" "$root/usr/share/applications"
cp paste-annotate "$root/usr/bin/paste-annotate"
chmod 755 "$root/usr/bin/paste-annotate"
cp packaging/paste-annotate.desktop "$root/usr/share/applications/paste-annotate.desktop"
cp packaging/paste-annotate-autostart.desktop "$root/etc/xdg/autostart/paste-annotate.desktop"
chmod 644 "$root/usr/share/applications/paste-annotate.desktop" "$root/etc/xdg/autostart/paste-annotate.desktop"
cp packaging/postinst "$root/DEBIAN/postinst"
chmod 755 "$root/DEBIAN/postinst"
find "$root" -type d -exec chmod 755 {} \;

size=$(du -sk "$root" | awk '{print $1}')
cat > "$root/DEBIAN/control" << EOF
Package: paste-annotate
Version: $version
Section: utils
Priority: optional
Architecture: all
Depends: python3, python3-gi, gir1.2-gtk-3.0, gir1.2-gdkpixbuf-2.0, python3-pil, libx11-6, libxtst6
Installed-Size: $size
Maintainer: VictorSoaresDev <cvictorsda@gmail.com>
Homepage: https://github.com/VictorSoaresDev/paste-annotate
Description: Draw on an image before Ctrl+V pastes it
 Opens a marker when Ctrl+V would paste an image, then pastes the marked image.
 Text pastes are replayed. Requires an Xorg session.
EOF

out=${2:-/tmp/paste-annotate_${version}_all.deb}
dpkg-deb --root-owner-group --build "$root" "$out" >/dev/null
echo "$out"
