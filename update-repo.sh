#!/bin/bash
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")
repo_name='meta-pkgs'
repo_dir="$script_dir/repo"
compression_ext='tar.xz'
db="${repo_dir}/${repo_name}".db
files="${repo_dir}/${repo_name}".files

repo-add "${db}.${compression_ext}" "${script_dir}"/repo/*.pkg.tar.zst

rm "${db}" "${files}"
mv "${db}.${compression_ext}" "${db}"
mv "${files}.${compression_ext}" "${files}"
