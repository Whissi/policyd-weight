#!/bin/sh
#
#
# PROVIDE: policyd-weight
# REQUIRE: LOGIN cleanvar
# KEYWORD: shutdown
#
# Add the following lines to /etc/rc.conf to enable policyd-weight:
# policyd_weight_enable (bool):	
#       Set it to "YES" to enable policyd-weight.
#		Default is "NO".


. /etc/rc.subr

name="policyd-weight"
rcvar=policyd_weight_enable

start_cmd=policyd_weight_start
stop_cmd=policyd_weight_stop

# defaults
policyd_weight_enable=${policyd_weight_enable:-"NO"}

load_rc_config "policyd_weight"

case "$policyd_weight_enable" in
    [Yy][Ee][Ss] | 1 | [Oo][Nn] | [Tt][Rr][Uu][Ee]) ;;
    *) echo "To make use of $name set $rcvar=\"YES\" in /etc/rc.conf" ;;
esac

command="/usr/local/libexec/postfix/policyd-weight"
pidfile=/var/run/policyd-weight.pid

policyd_weight_start() {
    /usr/local/libexec/postfix/policyd-weight start
}

policyd_weight_stop() {
    echo "Stopping $name"
    /usr/local/libexec/postfix/policyd-weight stop
}

run_rc_command "$1"
