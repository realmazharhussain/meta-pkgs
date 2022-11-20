# meta-pkgs
A pacman repository with meta packages which make installing and configuring software much easier.

## How to add meta-pkgs to pacman?
Install meta-pkgs-keyring

```bash
sudo pacman -U https://github.com/realmazharhussain/meta-pkgs/raw/main/repo/meta-pkgs-keyring-1-1-any.pkg.tar.zst
```

Append meta-pkgs-keyring to the `SyncFirst` line in `/etc/pacman.conf` file (*if such line exists*)

```diff
- SyncFirst = manjaro-system archlinux-keyring manjaro-keyring
+ SyncFirst = manjaro-system archlinux-keyring manjaro-keyring meta-pkgs-keyring
```

Add the following at the end of `/etc/pacman.conf` file

```ini
[meta-pkgs]
SigLevel = Optional TrustAll
Server = https://github.com/realmazharhussain/meta-pkgs/raw/main/repo
```

Do a system upgrade

```bash
sudo pacman -Syu
```

## Packages
- **meta-pkgs-keyring**: Install GPG keyring for this repo
- **gnome-minimal**: Install a minimal GNOME session along with a minimal set of GNOME apps
  - **gnome-apps-minimal**: Install minimal amount of GNOME apps required for a minimal session to be usable
  - **gnome-session-minimal**: Install core components of GNOME for a minimal session to be usable
    - **gdm-meta**: Install, enable GNOME Display Manager
- **phpmyadmin-meta**: Install Apache, MariaDB, Php, and PhpMyAdmin, configure everything for PhpMyAdmin, and restart Apache web server
  - **php-apache-meta**: Install Apache & Php, set up Php on Apache web server, and restart Apache web server
    - **apache-meta**: Install, enable and start Apache web server
  - **php-mariadb-meta**: Install Php & MariaDB and configure Php for MariaDB
    - **mariadb-meta**: Install, configure, enable and start MariaDB (MySQL) server
