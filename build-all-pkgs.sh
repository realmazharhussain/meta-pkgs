#!/bin/bash
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")
gpg_key_id=D4A940F2A8CAABCDDBEBFBFDC2C4EBF5813AB6E3

rm "$script_dir"/repo/*.pkg.tar.zst
rm "$script_dir"/repo/*.sig

for pkg_dir in "${script_dir}"/PKGBUILDs/*; do
   cd "$pkg_dir"
   makepkg -cd --sign --key "${gpg_key_id}"
   mv "$pkg_dir"/*.pkg.tar.zst{,.sig} "$script_dir"/repo/
done
