
Debian
====================
This directory contains files used to package fantasy11d/fantasy11-qt
for Debian-based Linux systems. If you compile fantasy11d/fantasy11-qt yourself, there are some useful files here.

## fantasy11: URI support ##


fantasy11-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install fantasy11-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your fantasy11-qt binary to `/usr/bin`
and the `../../share/pixmaps/fantasy11128.png` to `/usr/share/pixmaps`

fantasy11-qt.protocol (KDE)

