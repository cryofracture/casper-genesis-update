#!/usr/bin/env bash

# TOOL NAME: genesis_date_update
# WRITTEN BY: cryofracture
# DATE: 02/24/2021
# 
# First Worked: 10/18/2018
# Purpose: Quickly pieced together method to update the genesis timestamp for a test node (only connecting to 
# localhost for Proof of Concept / deploy testing.)
# Additional purpose to allow monitoring of current timestamp
#
#
# FUTTURE ADDITIONS:
# Looking to add a more explicit "monitor" function when I have more free time, prints fancy time stamp/creates a repeating loop to print to console timestamp reminders efficiently.
# 
#
#
# REV LIST:
# BY: cryofracture
# DATE: 
# CHANGES MADE: 
#
#
#

#set -x
##############################################
# MISC VARS
##############################################
# get current timestamp in utc
CURRENT_TIME=$(date --utc +%FT%TZ)
# current_plus_five
CURRENT_PLUS_FIVE="$(date --utc -d "($CURRENT_TIME) +5mins" +%FT%TZ)"
# grep regext for timestamp in format YYYY-MM-DDTHH:MM:SSZ and YYYY-DD-MMTHH:MM:SSZ
FIND_TIME=$(sudo grep -e "[0-9][0-9][0-9][0-9]\-[0-9][0-9]\-[0-9][0-9]T[0-9][0-9]:[0-9][0-9]:[0-9][0-9]Z" chainspec.toml | awk -F '=' -F ' ' '{print $3}')
# for sed command
QUOTE="'"

##############################################
# FUNCTIONS
##############################################
# Test Functionality of the script, get timestamp for monitoring purposes while waiting for genesis timestamp.
function ECHO() {
    echo "Current time: $CURRENT_TIME"
    echo "Current +5min: $CURRENT_PLUS_FIVE"
}

# Update the genesis timestamp to 5 minutes from now.
function GENESIS() {
    sudo sed -i "s/$FIND_TIME/$QUOTE$CURRENT_PLUS_FIVE$QUOTE/g" /etc/casper/1_0_0/chainspec.toml
    echo "Updated /etc/casper/1_0_0/chainspec.toml genesis timestamp with $CURRENT_PLUS_FIVE."
}


# Explain the script functionality
function USAGE() {
  cat <<EOF
This basic script generates a timestamp 5 minutes in the future for updating the genesis timestamp of a standalone/self-networked node of casper-client.
Usage:	$(basename "$0") genesis OR echo
  $(basename "$0") genesis
  $(basename "$0") echo
  genesis   Update /etc/casper/1_0_0/chainspec.toml genesis timestamp.
  echo      Just echo the timestamps for comparison.
EOF
	exit 1
}


# genesis will search for a timestamp without timezone in UTC and update chainspec.toml.
if [ "$1" == "genesis" ]; then
    GENESIS
# echo will only print to screen the current time and time +5 minutes for reference.
elif [ "$1" == "echo" ]; then
    ECHO
else
    USAGE
fi