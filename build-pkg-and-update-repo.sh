#!/bin/bash -e
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")
gpg_key_id=D4A940F2A8CAABCDDBEBFBFDC2C4EBF5813AB6E3
pkgname=$1
pkgdir="${script_dir}"/PKGBUILDs/"$pkgname"

cd "$pkgdir"
rm -f "$pkgdir"/*.pkg.tar.zst{,.sig}
makepkg -cd --sign --key "${gpg_key_id}"

rm -f "$script_dir"/repo/"$pkgname"*.pkg.tar.zst
rm -f "$script_dir"/repo/"$pkgname"*.sig

mv "$pkgdir"/*.pkg.tar.zst{,.sig} "$script_dir"/repo/

"$script_dir"/update-repo.sh
