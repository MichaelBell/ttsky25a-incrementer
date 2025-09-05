

set REPEATS 8     ;# Repeats of the pair of cells
set ROW_HEIGHT 544
set ROW_HALF_HEIGHT 272
set HA_OFFSET 151

for {set i 0} {$i < $REPEATS} {incr i} {
    # Instantiate the cells
    box 0 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT] 0 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
    getcell sky130_fd_sc_hd__dfrtp_1
    box 0 [expr $i * $ROW_HEIGHT] 0 [expr $i * $ROW_HEIGHT]
    getcell sky130_fd_sc_hd__dfrtp_1 v
    box 920 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT] 920 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
    getcell sky130_fd_sc_hd__tapvpwrvgnd_1
    box 920 [expr $i * $ROW_HEIGHT] 920 [expr $i * $ROW_HEIGHT]
    getcell sky130_fd_sc_hd__tapvpwrvgnd_1 v
    box 983 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT + $HA_OFFSET] 983 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT + $HA_OFFSET]
    getcell ha child 0 0
    box 983 [expr $i * $ROW_HEIGHT + $HA_OFFSET] 983 [expr $i * $ROW_HEIGHT + $HA_OFFSET]
    getcell ha_flip v child 0 0

    # Clock
    box 15 [expr $i * $ROW_HEIGHT + 130] 34 [expr $i * $ROW_HEIGHT + 164]
    paint viali
    box  9 [expr $i * $ROW_HEIGHT + 121] 38 [expr $i * $ROW_HEIGHT + 173]
    paint metal1
    box  9 [expr $i * $ROW_HEIGHT + 130] 37 [expr $i * $ROW_HEIGHT + 164]
    paint via1

    box 15 [expr $i * $ROW_HEIGHT + 390] 34 [expr $i * $ROW_HEIGHT + 424]
    paint viali
    box  9 [expr $i * $ROW_HEIGHT + 381] 38 [expr $i * $ROW_HEIGHT + 433]
    paint metal1
    box  9 [expr $i * $ROW_HEIGHT + 390] 37 [expr $i * $ROW_HEIGHT + 424]
    paint via1

    # Reset
    box 705 [expr $i * $ROW_HEIGHT + 153] 733 [expr $i * $ROW_HEIGHT + 187]
    paint via1
    box 705 [expr $i * $ROW_HEIGHT + 359] 733 [expr $i * $ROW_HEIGHT + 393]
    paint via1

    # D
    box 146 [expr $i * $ROW_HEIGHT + 486] 168 [expr $i * $ROW_HEIGHT + 503]
    paint viali
    box 139 [expr $i * $ROW_HEIGHT + 483] 174 [expr $i * $ROW_HEIGHT + 506]
    paint metal1
    box 139 [expr $i * $ROW_HEIGHT + 487] 963 [expr $i * $ROW_HEIGHT + 503]
    paint metal1
    box 928 [expr $i * $ROW_HEIGHT + 480] 963 [expr $i * $ROW_HEIGHT + 506]
    paint metal1
    box 931 [expr $i * $ROW_HEIGHT + 480] 960 [expr $i * $ROW_HEIGHT + 506]
    paint via1
    box 928 [expr $i * $ROW_HEIGHT + 480] 1400 [expr $i * $ROW_HEIGHT + 506]
    paint metal2
    box 1121 [expr $i * $ROW_HEIGHT + 480] 1148 [expr $i * $ROW_HEIGHT + 506]
    paint via1
    box 1118 [expr $i * $ROW_HEIGHT + 480] 1151 [expr $i * $ROW_HEIGHT + 506]
    paint metal1

    box 146 [expr $i * $ROW_HEIGHT + 41] 168 [expr $i * $ROW_HEIGHT + 58]
    paint viali
    box 139 [expr $i * $ROW_HEIGHT + 38] 174 [expr $i * $ROW_HEIGHT + 61]
    paint metal1
    box 139 [expr $i * $ROW_HEIGHT + 41] 963 [expr $i * $ROW_HEIGHT + 57]
    paint metal1
    box 928 [expr $i * $ROW_HEIGHT + 38] 963 [expr $i * $ROW_HEIGHT + 64]
    paint metal1
    box 931 [expr $i * $ROW_HEIGHT + 38] 960 [expr $i * $ROW_HEIGHT + 64]
    paint via1
    box 928 [expr $i * $ROW_HEIGHT + 38] 1400 [expr $i * $ROW_HEIGHT + 64]
    paint metal2
    box 1121 [expr $i * $ROW_HEIGHT + 38] 1148 [expr $i * $ROW_HEIGHT + 64]
    paint via1
    box 1118 [expr $i * $ROW_HEIGHT + 38] 1151 [expr $i * $ROW_HEIGHT + 64]
    paint metal1

    # Q
    box 888 [expr $i * $ROW_HEIGHT + 429] 905 [expr $i * $ROW_HEIGHT + 455]
    paint viali
    box 885 [expr $i * $ROW_HEIGHT + 423] 915 [expr $i * $ROW_HEIGHT + 461]
    paint metal1
    box 885 [expr $i * $ROW_HEIGHT + 429] 915 [expr $i * $ROW_HEIGHT + 455]
    paint via1
    box 882 [expr $i * $ROW_HEIGHT + 423] 1080 [expr $i * $ROW_HEIGHT + 461]
    paint metal2

    box 888 [expr $i * $ROW_HEIGHT + 89] 905 [expr $i * $ROW_HEIGHT + 115]
    paint viali
    box 885 [expr $i * $ROW_HEIGHT + 83] 915 [expr $i * $ROW_HEIGHT + 121]
    paint metal1
    box 885 [expr $i * $ROW_HEIGHT + 89] 915 [expr $i * $ROW_HEIGHT + 115]
    paint via1
    box 882 [expr $i * $ROW_HEIGHT + 83] 1080 [expr $i * $ROW_HEIGHT + 121]
    paint metal2

    # PWR
    for {set j 0} {$j < 4} {incr j} {
        box [expr $j * 40 + 209] [expr $i * $ROW_HEIGHT - 16] [expr $j * 40 + 241] [expr $i * $ROW_HEIGHT + 16]
        paint via3
        box [expr $j * 40 + 211] [expr $i * $ROW_HEIGHT - 14] [expr $j * 40 + 239] [expr $i * $ROW_HEIGHT + 14]
        paint via2
    }
    for {set j 0} {$j < 5} {incr j} {
        box [expr $j * 32 + 208] [expr $i * $ROW_HEIGHT - 14] [expr $j * 32 + 234] [expr $i * $ROW_HEIGHT + 14]
        paint via1
    }
    box 200 [expr $i * $ROW_HEIGHT - 17] 370 [expr $i * $ROW_HEIGHT + 17]
    paint metal3
    box 200 [expr $i * $ROW_HEIGHT - 17] 370 [expr $i * $ROW_HEIGHT + 17]
    paint metal2

    # GND
    for {set j 0} {$j < 4} {incr j} {
        box [expr $j * 40 + 509] [expr $i * $ROW_HEIGHT - 16 + 272] [expr $j * 40 + 541] [expr $i * $ROW_HEIGHT + 16 + 272]
        paint via3
        box [expr $j * 40 + 511] [expr $i * $ROW_HEIGHT - 14 + 272] [expr $j * 40 + 539] [expr $i * $ROW_HEIGHT + 14 + 272]
        paint via2
    }
    for {set j 0} {$j < 5} {incr j} {
        box [expr $j * 32 + 508] [expr $i * $ROW_HEIGHT - 14 + 272] [expr $j * 32 + 534] [expr $i * $ROW_HEIGHT + 14 + 272]
        paint via1
    }
    box 500 [expr $i * $ROW_HEIGHT - 17 + 272] 670 [expr $i * $ROW_HEIGHT + 17 + 272]
    paint metal3
    box 500 [expr $i * $ROW_HEIGHT - 17 + 272] 670 [expr $i * $ROW_HEIGHT + 17 + 272]
    paint metal2
}

# Final PWR
for {set j 0} {$j < 4} {incr j} {
    box [expr $j * 40 + 209] [expr $i * $ROW_HEIGHT - 16] [expr $j * 40 + 241] [expr $i * $ROW_HEIGHT + 16]
    paint via3
    box [expr $j * 40 + 211] [expr $i * $ROW_HEIGHT - 14] [expr $j * 40 + 239] [expr $i * $ROW_HEIGHT + 14]
    paint via2
}
for {set j 0} {$j < 5} {incr j} {
    box [expr $j * 32 + 208] [expr $i * $ROW_HEIGHT - 14] [expr $j * 32 + 234] [expr $i * $ROW_HEIGHT + 14]
    paint via1
}
box 200 [expr $i * $ROW_HEIGHT - 17] 370 [expr $i * $ROW_HEIGHT + 17]
paint metal3
box 200 [expr $i * $ROW_HEIGHT - 17] 370 [expr $i * $ROW_HEIGHT + 17]
paint metal2

# Clock
box 9 121 43 [expr $REPEATS * $ROW_HEIGHT + 50]
paint metal2

# Reset
box 705 121 739 [expr $REPEATS * $ROW_HEIGHT + 50]
paint metal2

# Inc
box 1183 [expr $REPEATS * $ROW_HEIGHT + 8] 1200 [expr $REPEATS * $ROW_HEIGHT + 38]
paint locali
box 1183 [expr $REPEATS * $ROW_HEIGHT + 11] 1200 [expr $REPEATS * $ROW_HEIGHT + 35]
paint viali
box 1177 [expr $REPEATS * $ROW_HEIGHT + 8] 1206 [expr $REPEATS * $ROW_HEIGHT + 48]
paint metal1
box 1177 [expr $REPEATS * $ROW_HEIGHT + 14] 1206 [expr $REPEATS * $ROW_HEIGHT + 42]
paint via1
box 1177 [expr $REPEATS * $ROW_HEIGHT + 8] 1206 [expr $REPEATS * $ROW_HEIGHT + 50]
paint metal2

# Power
box 200 -50 370 [expr $REPEATS * $ROW_HEIGHT + 50]
paint metal4

# Ground
box 500 -50 670 [expr $REPEATS * $ROW_HEIGHT + 50]
paint metal4

box 0 -50 1400 [expr $REPEATS * $ROW_HEIGHT + 50]
save incrementer.mag
quit -noprompt
