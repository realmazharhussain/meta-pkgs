#!/bin/bash
scriptfile=$(realpath "$0")
scriptdir=$(dirname "$scriptfile")
pkgname="$1"
if [ ! "$pkgname" ]; then
   echo "Error: No package name provided!" >&2
   exit 1
fi

pkgdir="$scriptdir/PKGBUILDs/$pkgname"
if [ -d "$pkgdir" ]; then
   echo "Package already exists!" >&2
   exit 2
fi

if [[ $pkgname == *-meta ]]; then
   _pkgname=${pkgname%-meta}
fi

install="post_install() {
}
pre_remove() {
}"

PKGBUILD="# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=$pkgname
pkgver=1
pkgrel=1
pkgdesc=\"Meta Package for ${_pkgname:-$pkgname}\"
arch=(any)
url=\"https://github.com/realmazharhussain/meta-pkgs/PKGBUILDs/\$pkgname\"
license=('GPL')
depends=(${_pkgname})
install=\$pkgname.install
"

mkdir -p "$pkgdir"
echo "$PKGBUILD" > "$pkgdir/PKGBUILD"
echo "$install" > "$pkgdir/$pkgname.install"
