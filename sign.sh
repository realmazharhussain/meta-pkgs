#!/bin/bash
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")
repo_dir="$script_dir/repo"
gpg_key=D4A940F2A8CAABCDDBEBFBFDC2C4EBF5813AB6E3

for file in "${repo_dir}"/*; do
  if [[ "${file}" != *.sig ]]; then
    gpg --sign --detach-sign --default-key="${gpg_key}" --yes "${file}"
  fi
done
