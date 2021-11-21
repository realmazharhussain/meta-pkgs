#!/usr/bin/env bash
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")
rm -rf "${script_dir}"/pkgs/*/{src,pkg,*.pkg.tar.zst}
