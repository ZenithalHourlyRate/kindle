#!/bin/sh
#
# Screen helper script
#

enable()
{
  initctl stop powerd
  touch /mnt/us/screen/enable
}

disable()
{
  rm -f /mnt/us/screen/enable
  initctl start powerd
}

show()
{
  eips -f -g /tmp/screen.png
}

test()
{
  eips -f -g /mnt/us/screen/test.png
}

update()
{
  if [ -f /tmp/screen.png ] && [ -f /mnt/us/screen/enable ]; then
    eips -f -g /tmp/screen.png
  fi
}

stop_framework()
{
  if [ -f /tmp/screen.png ] && [ -f /mnt/us/screen/enable ]; then
    initctl stop framework
  fi
}


## Main
case "${1}" in
	"enable" )
		${1}
	;;
	"disable" )
		${1}
	;;
	"show" )
		${1}
	;;
	"test" )
		${1}
	;;
	"update" )
		${1}
	;;
	"stop_framework" )
		${1}
	;;
	* )
		echo "invalid action (${1})"
	;;
esac
