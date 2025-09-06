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
box 1000 6380 1000 6380
getcell incrementer child 0 0

# Wire uio_oe to VDPWR
box 1250 11052 5029 11082
paint metal4
box 1250 10900 1280 11052
paint metal4

proc draw_top_signal_wire {cxl cyl cxt hyl px} {
    box $cxl $cyl $cxt [expr $hyl + 36]
    paint metal2
    box $cxl $hyl $cxt [expr $hyl + 30]
    paint via1
    box [expr $cxl - 3] $hyl [expr $px + 18] [expr $hyl + 30]
    paint metal1
    box [expr $px - 15] $hyl [expr $px + 15] [expr $hyl + 30]
    paint via1
    box [expr $px - 21] [expr $hyl - 6] [expr $px + 21] [expr $hyl + 38]
    paint metal2
    box [expr $px - 15] $hyl [expr $px + 15] [expr $hyl + 30]
    paint via2
    box [expr $px - 23] [expr $hyl - 4] [expr $px + 23] [expr $hyl + 50]
    paint metal3
    box [expr $px - 18] [expr $hyl - 3] [expr $px + 18] [expr $hyl + 29]
    paint via3
    box [expr $px - 19] [expr $hyl - 4] [expr $px + 19] [expr $hyl + 30]
    paint metal4
    box [expr $px - 15] [expr $hyl + 24] [expr $px + 15] 11052
    paint metal4
}

proc draw_side_signal_wire {cxl cyl cyt px} {
    box $cxl $cyl [expr $cxl + 38] $cyt
    paint metal2
    box [expr $cxl + 6] $cyl [expr $cxl + 32] $cyt
    paint via1
    box $cxl $cyl [expr $px + 18] [expr $cyl + 30]
    paint metal1
    box [expr $px - 15] $cyl [expr $px + 15] [expr $cyl + 30]
    paint via1
    box [expr $px - 21] [expr $cyl - 6] [expr $px + 21] [expr $cyl + 38]
    paint metal2
    box [expr $px - 15] $cyl [expr $px + 15] [expr $cyl + 30]
    paint via2
    box [expr $px - 23] [expr $cyl - 4] [expr $px + 23] [expr $cyl + 50]
    paint metal3
    box [expr $px - 18] [expr $cyl - 3] [expr $px + 18] [expr $cyl + 29]
    paint via3
    box [expr $px - 19] [expr $cyl - 4] [expr $px + 19] [expr $cyl + 30]
    paint metal4
    box [expr $px - 15] [expr $cyl + 24] [expr $px + 15] 11052
    paint metal4
}


# Wire clk
draw_top_signal_wire 1009 10782 1043 10992 14398

# Wire reset
draw_top_signal_wire 1705 10782 1739 10942 14122

# Wire inc
draw_top_signal_wire 2176.5 10782 2205.5 10892 13846

# Wire bits
for {set i 0} {$i < 8} {incr i} {
    draw_side_signal_wire 2400 [expr 10668 - 544 * $i] [expr 10694 - 544 * $i] [expr 9430 - 552 * $i]
    draw_side_signal_wire 2400 [expr 10226 - 544 * $i] [expr 10252 - 544 * $i] [expr 9154 - 552 * $i]
}

# Save the layout and export GDS/LEF
# ----------------------------------
save ${TOP_LEVEL_CELL}.mag
file mkdir gds
gds write ../gds/${TOP_LEVEL_CELL}.gds
file mkdir lef
lef write ../lef/${TOP_LEVEL_CELL}.lef -hide -pinonly

quit -noprompt
