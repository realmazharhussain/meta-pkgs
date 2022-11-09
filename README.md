# meta-pkgs
A pacman repository with meta packages which make installing and configuring software much easier.

## How to add meta-pkgs to pacman?
- Install meta-pkgs-keyring
  ```bash
  sudo pacman -U https://github.com/realmazharhussain/meta-pkgs/raw/main/repo/meta-pkgs-keyring-1-1-any.pkg.tar.zst
  ```
- Add the following at the end of `/etc/pacman.conf` file
  ```
  [meta-pkgs]
  SigLevel = Optional TrustAll
  Server = https://github.com/realmazharhussain/meta-pkgs/raw/main/repo
  ```
- Do a system upgrade
  ```bash
  sudo pacman -Syu
  ```

## List of packages
To a list of all the packages in this repo, either
- visit [this link](https://github.com/realmazharhussain/meta-pkgs/tree/main/repo)

or
- add this repo to pacman and then run the command `pacman -Sl meta-pkgs`
