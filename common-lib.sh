# Description: A library to support common functions for shell scripts.

releasefile=/etc/redhat-release
export PATH=/usr/sbin:/usr/bin:/sbin:/bin

# determine the architecture of our releasefile
__osarch=`rpm -qf --queryformat '%{arch}' $releasefile`

# find our OS version from the releasefile
osrelease=`rpm -qf --queryformat '%{version}' $releasefile`
[[ "$osrelease" == "5Server" || "$osrelease" = "5" ]] && __osrelease=5
[[ "$osrelease" == "6Server" || "$osrelease" = "6" ]] && __osrelease=6

# a death function
__die() { echo "$1" >&2 ; exit 1; }

# use the $__var naming convention to specify variables which to be
# exported from this script
export __osrelease
export __osarch

