#!/usr/bin/env -S bash -e
# GMT modern mode bash template
# Date:    2025-08-25T16:17:35
# User:    romulo
# Purpose: Create a map to publish on the LabSis website
export GMT_SESSION_NAME=$$	# Set a unique session name
rsisne() {
    while read LONG LAT; do
        echo $LAT $LONG | gmt plot -St0.35c -W0.7p -Gdimgray
    done < latlong.rsisne.txt
}

gmt begin mapa-noticia pdf
    #Lay down painted continent with national borders on a Mercator map
    #R:region minLat/maxLat/minLong/maxLong
    #gmt coast -R5/20/35/50 -Wthin -Gwheat -EIT+gblue -Df -Sazure -B -N1/thick,red -JM15c
    gmt coast -R-50/-30/-10/0 -W0.5p -Gwheat -JM0/20c -Slightblue2 -B -E"BR.MA,BR.PI,BR.RN,BR.CE,BR.PB,BR.PE,BR.BA,BR.SE,BR.AL"
    rsisne
    eventos_do_mes
    #echo -40.19 -10.84 | gmt plot -St0.2c -W1p,gray40 -Ggray40
    #Show where Brazil is in the world via a map inset
    gmt inset begin -DjTR+w5c+o0.2c -F+gwhite+pthick
        gmt coast -R-49/-30/-19/2 -W0.5p -Gwheat -JM -Slightblue2 -E"BR.MA,BR.PI,BR.RN,BR.CE,BR.PB,BR.PE,BR.BA,BR.SE,BR.AL"
        # gmt coast -Rg -JG40W/10S/? -Gwheat -Bg -E"BR.MA,BR.PI,BR.RN,BR.CE,BR.PB,BR.PE,BR.BA,BR.SE,BR.AL"+gred3
    gmt inset end
    # gmt legend
gmt end
