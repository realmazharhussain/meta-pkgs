#!/bin/bash
script_file=$(realpath "$0")
script_dir=$(dirname "${script_file}")

"$script_dir"/build-all-pkgs.sh
"$script_dir"/update-repo.sh
