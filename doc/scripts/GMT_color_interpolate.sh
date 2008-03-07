#!/bin/sh
#	$Id: GMT_color_interpolate.sh,v 1.2 2008-03-07 18:03:46 remko Exp $
#
ps=GMT_color_interpolate.ps
psbasemap -Jx1i -R0/6.8/0/2.0 -B0 -K > $ps

# Plot polar color map in the left; right (top) and wrong (bottom)
makecpt -Cpolar -T-1/1/1 -Z > tmp.cpt
psscale -D1.7/1.6/3i/0.3ih -Ctmp.cpt -B0.5f0.1 -O -K >> $ps
psscale -D1.7/0.7/3i/0.3ih -Ctmp.cpt -B0.5f0.1 -O -K --COLOR_MODEL=+HSV >> $ps

# Plot rainbow color map in the left; right (top) and wrong (bottom)
makecpt -Crainbow -T-1/1/2 -Z > tmp.cpt
psscale -D5.1/1.6/3i/0.3ih -Ctmp.cpt -B0.5f0.1 -O -K >> $ps
psscale -D5.1/0.7/3i/0.3ih -Ctmp.cpt -B0.5f0.1 -O -K --COLOR_MODEL=+RGB >> $ps

psxy -R -J -Sd0.1i -O -K -Wblack -Gwhite >> $ps <<END
0.2 1.6
1.7 1.6
3.2 1.6
3.6 1.6
6.6 1.6
0.2 0.7
1.7 0.7
3.2 0.7
3.6 0.7
6.6 0.7
END

pstext -R -J -O >> $ps <<END
1.7 1.7 14 0 1 BC polar (RGB)
1.7 0.8 14 0 1 BC polar (HSV)
5.1 1.7 14 0 1 BC rainbow (HSV)
5.1 0.8 14 0 1 BC rainbow (RGB)
END
rm -f tmp.cpt
