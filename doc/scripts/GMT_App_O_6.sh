#!/bin/sh
#	$Id: GMT_App_O_6.sh,v 1.6 2006-10-24 01:53:19 remko Exp $
#
#	Makes Fig 6 for Appendix O (labeled lines)
#

pscoast -R50/160/-15/15 -JM5.5i -Glightgray -A500 -K -P > GMT_App_O_6.ps
grdcontour geoid.grd -J -O -K -B20f10WSne -C10 -A20+d+s8 -Gl50/10S/160/10S -S10 \
	-T:'-+' >> GMT_App_O_6.ps
psxy -R -J -O -SqD1000k:+g+LD+an+p -Wthick transect.d >> GMT_App_O_6.ps
