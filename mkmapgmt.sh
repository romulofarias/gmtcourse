#!/usr/bin/env bash

# 1. Select data region: part of earth you want to display
# 2. Select projection: types and parameters of a projection
# 3. Select frame: draw a frame around the map (optional)
FIGURE_NAME=$1
gmt begin $FIGURE_NAME pdf,png
    #Lay down painted continent with national borders on a Mercator map
    gmt coast -R-34/5/-74/-34 -Wthin -Gwheat -EIT+gred -Df -Sazure -B -N1/thick,red -JM15c
    #Show where Italy is in the world via a map inset
    gmt inset begin -DjTR+w4c+o0.2c -F+gwhite+pthick
        gmt coast -Rg -JG10E/25N/? -Gwheat -Bg -EIT+gred
    gmt inset end
gmt end show

