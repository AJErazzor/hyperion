#!/bin/sh

# Script for downloading and installing the latest Hyperion release

# Find out if we are on XBian
IS_XBIAN=`cat /etc/issue | grep XBian | wc -l`

# Make sure that the boblight daemon is no longer running
BOBLIGHT_PROCNR=$(ps -e | grep "boblight" | wc -l)
if [ $BOBLIGHT_PROCNR -eq 1 ];
then
	echo 'Found running instance of boblight. Please stop boblight via XBMC menu before installing hyperion'
	exit
fi

# Stop hyperion daemon if it is running
/sbin/initctl stop hyperion

# Get the Hyperion executable
wget -N github.com/tvdzwan/hyperion/raw/master/deploy/hyperiond -P /usr/bin/
chmod +x /usr/bin/hyperiond

# Get the Hyperion command line utility
wget -N github.com/tvdzwan/hyperion/raw/master/deploy/hyperion-remote -P /usr/bin/
chmod +x /usr/bin/hyperion-remote

# Copy the gpio changer (gpio->spi) to the /usr/bin
if [ $IS_XBIAN -eq 0 ]; then
	wget -N github.com/tvdzwan/hyperion/raw/master/deploy/gpio2spi -P /usr/bin/
	chmod +x /usr/bin/gpio2spi
fi

# Copy the service control configuration to /etc/int
if [ $IS_XBIAN -eq 0 ]; then
	wget -N github.com/tvdzwan/hyperion/raw/master/deploy/hyperion.conf -P /etc/init/
else
	wget -N github.com/tvdzwan/hyperion/raw/master/deploy/hyperion.xbian.conf -P /etc/init/ -O hyperion.conf
fi

# Start the hyperion daemon
/sbin/initctl start hyperion
