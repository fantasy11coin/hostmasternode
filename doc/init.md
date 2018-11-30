Sample init scripts and service configuration for fantasy11d
==========================================================

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

    contrib/init/fantasy11d.service:    systemd service unit configuration
    contrib/init/fantasy11d.openrc:     OpenRC compatible SysV style init script
    contrib/init/fantasy11d.openrcconf: OpenRC conf.d file
    contrib/init/fantasy11d.conf:       Upstart service configuration file
    contrib/init/fantasy11d.init:       CentOS compatible SysV style init script

1. Service User
---------------------------------

All three Linux startup configurations assume the existence of a "fantasy11core" user
and group.  They must be created before attempting to use these scripts.
The OS X configuration assumes fantasy11d will be set up for the current user.

2. Configuration
---------------------------------

At a bare minimum, fantasy11d requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, fantasy11d will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that fantasy11d and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If fantasy11d is run with the "-server" flag (set by default), and no rpcpassword is set,
it will use a special cookie file for authentication. The cookie is generated with random
content when the daemon starts, and deleted when it exits. Read access to this file
controls who can access it through RPC.

By default the cookie is stored in the data directory, but it's location can be overridden
with the option '-rpccookiefile'.

This allows for running fantasy11d without having to do any manual configuration.

`conf`, `pid`, and `wallet` accept relative paths which are interpreted as
relative to the data directory. `wallet` *only* supports relative paths.

For an example configuration file that describes the configuration settings,
see `contrib/debian/examples/fantasy11.conf`.

3. Paths
---------------------------------

3a) Linux

All three configurations assume several paths that might need to be adjusted.

Binary:              `/usr/bin/fantasy11d`  
Configuration file:  `/etc/fantasy11core/fantasy11.conf`  
Data directory:      `/var/lib/fantasy11d`  
PID file:            `/var/run/fantasy11d/fantasy11d.pid` (OpenRC and Upstart) or `/var/lib/fantasy11d/fantasy11d.pid` (systemd)  
Lock file:           `/var/lock/subsys/fantasy11d` (CentOS)  

The configuration file, PID directory (if applicable) and data directory
should all be owned by the fantasy11core user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
fantasy11core user and group.  Access to fantasy11-cli and other fantasy11d rpc clients
can then be controlled by group membership.

3b) Mac OS X

Binary:              `/usr/local/bin/fantasy11d`  
Configuration file:  `~/Library/Application Support/Fantasy11Core/fantasy11.conf`  
Data directory:      `~/Library/Application Support/Fantasy11Core`
Lock file:           `~/Library/Application Support/Fantasy11Core/.lock`

4. Installing Service Configuration
-----------------------------------

4a) systemd

Installing this .service file consists of just copying it to
/usr/lib/systemd/system directory, followed by the command
`systemctl daemon-reload` in order to update running systemd configuration.

To test, run `systemctl start fantasy11d` and to enable for system startup run
`systemctl enable fantasy11d`

4b) OpenRC

Rename fantasy11d.openrc to fantasy11d and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
`/etc/init.d/fantasy11d start` and configure it to run on startup with
`rc-update add fantasy11d`

4c) Upstart (for Debian/Ubuntu based distributions)

Drop fantasy11d.conf in /etc/init.  Test by running `service fantasy11d start`
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon utility.

4d) CentOS

Copy fantasy11d.init to /etc/init.d/fantasy11d. Test by running `service fantasy11d start`.

Using this script, you can adjust the path and flags to the fantasy11d program by
setting the FANED and FLAGS environment variables in the file
/etc/sysconfig/fantasy11d. You can also use the DAEMONOPTS environment variable here.

4e) Mac OS X

Copy org.fantasy11.fantasy11d.plist into ~/Library/LaunchAgents. Load the launch agent by
running `launchctl load ~/Library/LaunchAgents/org.fantasy11.fantasy11d.plist`.

This Launch Agent will cause fantasy11d to start whenever the user logs in.

NOTE: This approach is intended for those wanting to run fantasy11d as the current user.
You will need to modify org.fantasy11.fantasy11d.plist if you intend to use it as a
Launch Daemon with a dedicated fantasy11core user.

5. Auto-respawn
-----------------------------------

Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
