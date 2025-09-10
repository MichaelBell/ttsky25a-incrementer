# SPDX-License-Identifier: Apache-2.0
# Copyright (c) 2024 Tiny Tapeout LTD
# Author: Uri Shaked
# Description: This script initializes a new Magic project for an analog design on Tiny Tapeout.

# Important: before running this script, download the the .def file from
# https://raw.githubusercontent.com/TinyTapeout/tt-support-tools/tt08/def/analog/tt_analog_1x2.def

# Change the settings below to match your design:
# ------------------------------------------------
set TOP_LEVEL_CELL     tt_um_rebelmike_incrementer
set TEMPLATE_FILE      tt_block_1x1_pg.def
set POWER_STRIPE_WIDTH 1.7um                 ;# The minimum width is 1.2um

# Power stripes: NET name, x position. You can add additional power stripes for each net, as needed.
set POWER_STRIPES {
    VDPWR 12um
    VGND  15um
}
# If you use the 3v3 template, uncomment the line below:
#lappend POWER_STRIPES VAPWR 7um

# Read in the pin positions
# -------------------------
def read $TEMPLATE_FILE
cellname rename tt_um_template $TOP_LEVEL_CELL

# Draw the power stripes
# --------------------------------
proc draw_power_stripe {name x} {
    global POWER_STRIPE_WIDTH
    box $x 5um $x 109um
    box width $POWER_STRIPE_WIDTH
    paint met4
    label $name FreeSans 0.25u -met4
    port make
    port use [expr {$name eq "VGND" ? "ground" : "power"}]
    port class bidirectional
    port connections n s e w
}

# You can extra power stripes, as you need.
foreach {name x} $POWER_STRIPES {
    puts "Drawing power stripe $name at $x"
    draw_power_stripe $name $x
}

# Add incrementer
box 1000 6108 1000 6108
getcell incrementer child 0 0

proc draw_top_signal_wire {cxl cyl cxt hyl px} {
    box $cxl $cyl $cxt [expr $hyl + 36]
    paint metal4
    box [expr $cxl + 1] $hyl [expr $cxt - 1] [expr $hyl + 32]
    paint via3
    box [expr $cxl - 2] $hyl [expr $px + 21] [expr $hyl + 32]
    paint metal3
    box [expr $px - 18] [expr $hyl - 0] [expr $px + 18] [expr $hyl + 32]
    paint via3
    box [expr $px - 19] [expr $hyl - 1] [expr $px + 19] [expr $hyl + 33]
    paint metal4
    box [expr $px - 15] [expr $hyl + 24] [expr $px + 15] 11052
    paint metal4
}

proc draw_side_signal_wire {cxl cyl px} {
    box $cxl $cyl [expr $cxl + 50] [expr $cyl + 34]
    paint metal2
    box [expr $cxl + 6] [expr $cyl + 3] [expr $cxl + 44] [expr $cyl + 31]
    paint via2
    box $cxl $cyl [expr $px + 23] [expr $cyl + 34]
    paint metal3
    box [expr $px - 18] [expr $cyl + 1] [expr $px + 18] [expr $cyl + 33]
    paint via3
    box [expr $px - 19] [expr $cyl - 4] [expr $px + 19] [expr $cyl + 34]
    paint metal4
    box [expr $px - 15] [expr $cyl + 24] [expr $px + 15] 11052
    paint metal4
}

proc add_via1_to4 {llx lly} {
    box $llx $lly [expr $llx + 32] [expr $lly + 38]
    paint metal1
    box [expr $llx + 3] [expr $lly + 6] [expr $llx + 29] [expr $lly + 32]
    paint via1
    box $llx $lly [expr $llx + 40] [expr $lly + 34]
    paint metal2
    box [expr $llx + 6] [expr $lly + 3] [expr $llx + 34] [expr $lly + 31]
    paint via2
    box $llx $lly [expr $llx + 50] [expr $lly + 48]
    paint metal3
    box [expr $llx + 3] [expr $lly + 1] [expr $llx + 47] [expr $lly + 37]
    paint via3
    box $llx $lly [expr $llx + 50] [expr $lly + 38]
    paint metal4
}

# Wire clk
draw_top_signal_wire 1426 10782 1460 10982 14398

# Wire reset
draw_top_signal_wire 1877 10782 1911 10917 14122

# Wire inc
draw_top_signal_wire 2170 10782 2212 10852 13846

# Wire bits
for {set i 0} {$i < 8} {incr i} {
    draw_side_signal_wire 2400 [expr 10396 - 544 * $i] [expr 9430 - 552 * $i]
    draw_side_signal_wire 2400 [expr 9954 - 544 * $i] [expr 9154 - 552 * $i]
}

# Tie uio_oe high
box 2881 10170 2881 10170
getcell tie_highs

box 1320 10900 1370 11052
paint metal4
box 1320 11052 2750 11102
paint metal4
box 2700 10754 2750 11052
paint metal4
add_via1_to4 2700 10754
box 2700 10754 2955 10783
paint metal1

for {set i 0} {$i < 8} {incr i} {
  add_via1_to4 [expr 3053 + 150 * $i] 10628
  box [expr 3067 + 150 * $i] 10628 [expr 3097 + 150 * $i] [expr 11142 - 65 * $i]
  paint metal4
  box [expr 3067 + 150 * $i] [expr 11117 - 65 * $i] [expr 3097 + 276 * $i] [expr 11147 - 65 * $i]
  paint metal4
  box [expr 3067 + 276 * $i] [expr 11117 - 65 * $i] [expr 3097 + 276 * $i] 11052
  paint metal4
}

box 1670 10188 2850 10238
paint metal4
add_via1_to4 2800 10188
box 2800 10188 2955 10217
paint metal1

# Add logo
box 5200 0 5200 0
getcell logo.mag
select top cell

# Save the layout and export GDS/LEF
# ----------------------------------
save ${TOP_LEVEL_CELL}.mag
file mkdir gds
gds write ../gds/${TOP_LEVEL_CELL}.gds
file mkdir lef
lef write ../lef/${TOP_LEVEL_CELL}.lef -hide -pinonly

quit -noprompt
