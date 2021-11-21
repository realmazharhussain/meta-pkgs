#!/bin/bash
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")
repo_name='meta-pkgs'
compression_ext='tar.xz'
db="${script_dir}/${repo_name}".db
files="${script_dir}/${repo_name}".files

repo-add "${db}.${compression_ext}" "${script_dir}"/pkgs/*/*.pkg.tar.zst

rm "${db}" "${files}"
mv "${db}.${compression_ext}" "${db}"
mv "${files}.${compression_ext}" "${files}"
