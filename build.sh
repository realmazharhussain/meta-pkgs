#!/bin/bash
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")

rm "$script_dir"/repo/*.pkg.tar.zst

for pkg_dir in "${script_dir}"/PKGBUILDs/*; do
   cd "$pkg_dir"
   makepkg -cd
   mv "$pkg_dir"/*.pkg.tar.zst "$script_dir"/repo/
done
