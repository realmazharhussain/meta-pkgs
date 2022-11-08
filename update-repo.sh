#!/bin/bash
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")
repo_name='meta-pkgs'
repo_dir="$script_dir/repo"
compression_ext='tar.xz'
db="${repo_dir}/${repo_name}".db
files="${repo_dir}/${repo_name}".files
gpg_key_id=D4A940F2A8CAABCDDBEBFBFDC2C4EBF5813AB6E3

repo-add --sign --key "${gpg_key_id}" "${db}.${compression_ext}" "${script_dir}"/repo/*.pkg.tar.zst

rm "${db}" "${db}".sig
mv "${db}.${compression_ext}" "${db}"
mv "${db}.${compression_ext}".sig "${db}".sig

rm "${files}" "${files}".sig
mv "${files}.${compression_ext}" "${files}"
mv "${files}.${compression_ext}".sig "${files}".sig
