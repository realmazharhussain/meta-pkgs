#!/bin/bash
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")
for pkg_dir in "${script_dir}"/pkgs/*; do
   cd "$pkg_dir"
   makepkg -cd
   return_value=$?
   if [ $return_value = 13 ]; then
      echo $'\e[1A'already built: $'\e[1m'$(basename "$pkg_dir")$'\e[K'
   elif [ $return_value != 0 ]; then
      echo package: $(basename "$pkg_dir")
      exit $return_value
   fi
done
