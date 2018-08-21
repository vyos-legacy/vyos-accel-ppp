#
# Regular cron jobs for the vyos-accel-ppp package
#
0 4	* * *	root	[ -x /usr/bin/vyos-accel-ppp_maintenance ] && /usr/bin/vyos-accel-ppp_maintenance
