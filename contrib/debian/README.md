
Debian
====================
This directory contains files used to package betfintd/betfint-qt
for Debian-based Linux systems. If you compile betfintd/betfint-qt yourself, there are some useful files here.

## betfint: URI support ##


betfint-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install betfint-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your betfint-qt binary to `/usr/bin`
and the `../../share/pixmaps/betfint128.png` to `/usr/share/pixmaps`

betfint-qt.protocol (KDE)

