

set REPEATS 8     ;# Repeats of the pair of cells
set ROW_HEIGHT 544
set ROW_HALF_HEIGHT 272
set HA_OFFSET 151

for {set i 0} {$i < $REPEATS} {incr i} {
    # Instantiate the cells
    box -138 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT] 0 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
    getcell sky130_fd_sc_hd__decap_3
    box -138 [expr $i * $ROW_HEIGHT] 0 [expr $i * $ROW_HEIGHT]
    getcell sky130_fd_sc_hd__decap_3 v
    box 0 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT] 0 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
    getcell sky130_fd_sc_hd__dfrtp_1
    box 0 [expr $i * $ROW_HEIGHT] 0 [expr $i * $ROW_HEIGHT]
    getcell sky130_fd_sc_hd__dfrtp_1 v
    box 920 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT] 920 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT]
    getcell sky130_fd_sc_hd__tapvpwrvgnd_1
    box 920 [expr $i * $ROW_HEIGHT] 920 [expr $i * $ROW_HEIGHT]
    getcell sky130_fd_sc_hd__tapvpwrvgnd_1 v
    box 982.5 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT + $HA_OFFSET] 982.5 [expr $i * $ROW_HEIGHT + $ROW_HALF_HEIGHT + $HA_OFFSET]
    getcell ha child 0 0
    box 982.5 [expr $i * $ROW_HEIGHT + $HA_OFFSET - 30] 982.5 [expr $i * $ROW_HEIGHT + $HA_OFFSET - 30]
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
    box 1120.5 [expr $i * $ROW_HEIGHT + 480] 1147.5 [expr $i * $ROW_HEIGHT + 506]
    paint via1
    box 1117.5 [expr $i * $ROW_HEIGHT + 480] 1150.5 [expr $i * $ROW_HEIGHT + 506]
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
    box 1120.5 [expr $i * $ROW_HEIGHT + 38] 1147.5 [expr $i * $ROW_HEIGHT + 64]
    paint via1
    box 1117.5 [expr $i * $ROW_HEIGHT + 38] 1150.5 [expr $i * $ROW_HEIGHT + 64]
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
}

for {set i 0} {$i <= $REPEATS} {incr i} {
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

box -138 [expr $REPEATS * $ROW_HEIGHT] -138 [expr $REPEATS * $ROW_HEIGHT]
getcell sky130_fd_sc_hd__decap_3 v
box 0 [expr $REPEATS * $ROW_HEIGHT] 0 [expr $REPEATS * $ROW_HEIGHT]
getcell sky130_fd_sc_hd__clkbuf_8 180
box 506 [expr $REPEATS * $ROW_HEIGHT] 506 [expr $REPEATS * $ROW_HEIGHT]
getcell sky130_fd_sc_hd__tapvpwrvgnd_1 v
box 552 [expr $REPEATS * $ROW_HEIGHT] 552 [expr $REPEATS * $ROW_HEIGHT]
getcell sky130_fd_sc_hd__buf_6 180

# Clock
box 9 121 43 [expr $REPEATS * $ROW_HEIGHT + 191]
paint metal2
box 9 [expr $REPEATS * $ROW_HEIGHT + 111] 110 [expr $REPEATS * $ROW_HEIGHT + 191]
paint metal2
box 75 [expr $REPEATS * $ROW_HEIGHT + 114] 104 [expr $REPEATS * $ROW_HEIGHT + 138]
paint viali
box 69 [expr $REPEATS * $ROW_HEIGHT + 111] 110 [expr $REPEATS * $ROW_HEIGHT + 141]
paint metal1
box 75 [expr $REPEATS * $ROW_HEIGHT + 111] 104 [expr $REPEATS * $ROW_HEIGHT + 141]
paint via1
box 75 [expr $REPEATS * $ROW_HEIGHT + 164] 104 [expr $REPEATS * $ROW_HEIGHT + 188]
paint viali
box 69 [expr $REPEATS * $ROW_HEIGHT + 161] 110 [expr $REPEATS * $ROW_HEIGHT + 191]
paint metal1
box 75 [expr $REPEATS * $ROW_HEIGHT + 161] 104 [expr $REPEATS * $ROW_HEIGHT + 191]
paint via1

box 473 [expr $REPEATS * $ROW_HEIGHT + 144] 498 [expr $REPEATS * $ROW_HEIGHT + 178]
paint viali
box 466 [expr $REPEATS * $ROW_HEIGHT + 135] 502 [expr $REPEATS * $ROW_HEIGHT + 187]
paint metal1
box 466 [expr $REPEATS * $ROW_HEIGHT + 144] 501 [expr $REPEATS * $ROW_HEIGHT + 178]
paint via1
box 460 [expr $REPEATS * $ROW_HEIGHT + 135] 501 [expr $REPEATS * $ROW_HEIGHT + 187]
paint metal2
box 426 [expr $REPEATS * $ROW_HEIGHT + 135] 460 [expr $REPEATS * $ROW_HEIGHT + 187]
paint metal2
box 426 [expr $REPEATS * $ROW_HEIGHT + 133] 470 [expr $REPEATS * $ROW_HEIGHT + 190]
paint metal3
box 427 [expr $REPEATS * $ROW_HEIGHT + 136] 459 [expr $REPEATS * $ROW_HEIGHT + 176]
paint via3
box 431 [expr $REPEATS * $ROW_HEIGHT + 138] 459 [expr $REPEATS * $ROW_HEIGHT + 174]
paint via2
box 426 [expr $REPEATS * $ROW_HEIGHT + 135] 460 [expr $REPEATS * $ROW_HEIGHT + $ROW_HALF_HEIGHT + 50]
paint metal4


# Reset
box 705 121 739 [expr $REPEATS * $ROW_HEIGHT + 191]
paint metal2
box 698 [expr $REPEATS * $ROW_HEIGHT + 111] 739 [expr $REPEATS * $ROW_HEIGHT + 191]
paint metal2
box 704 [expr $REPEATS * $ROW_HEIGHT + 114] 733 [expr $REPEATS * $ROW_HEIGHT + 138]
paint viali
box 698 [expr $REPEATS * $ROW_HEIGHT + 111] 739 [expr $REPEATS * $ROW_HEIGHT + 141]
paint metal1
box 704 [expr $REPEATS * $ROW_HEIGHT + 111] 733 [expr $REPEATS * $ROW_HEIGHT + 141]
paint via1
box 704 [expr $REPEATS * $ROW_HEIGHT + 164] 733 [expr $REPEATS * $ROW_HEIGHT + 188]
paint viali
box 698 [expr $REPEATS * $ROW_HEIGHT + 161] 739 [expr $REPEATS * $ROW_HEIGHT + 191]
paint metal1
box 704 [expr $REPEATS * $ROW_HEIGHT + 161] 733 [expr $REPEATS * $ROW_HEIGHT + 191]
paint via1

box 868 [expr $REPEATS * $ROW_HEIGHT + 144] 918 [expr $REPEATS * $ROW_HEIGHT + 162]
paint viali
box 862 [expr $REPEATS * $ROW_HEIGHT + 140] 925 [expr $REPEATS * $ROW_HEIGHT + 166]
paint metal1
box 868 [expr $REPEATS * $ROW_HEIGHT + 140] 921 [expr $REPEATS * $ROW_HEIGHT + 166]
paint via1
box 862 [expr $REPEATS * $ROW_HEIGHT + 137] 927 [expr $REPEATS * $ROW_HEIGHT + 192]
paint metal2

box 868 [expr $REPEATS * $ROW_HEIGHT + 135] 920 [expr $REPEATS * $ROW_HEIGHT + 192]
paint metal3
box 878 [expr $REPEATS * $ROW_HEIGHT + 138] 910 [expr $REPEATS * $ROW_HEIGHT + 178]
paint via3
box 882 [expr $REPEATS * $ROW_HEIGHT + 140] 910 [expr $REPEATS * $ROW_HEIGHT + 176]
paint via2
box 877 [expr $REPEATS * $ROW_HEIGHT + 137] 911 [expr $REPEATS * $ROW_HEIGHT + $ROW_HALF_HEIGHT + 50]
paint metal4

# Inc
box 1182.5 [expr $REPEATS * $ROW_HEIGHT + 8] 1199.5 [expr $REPEATS * $ROW_HEIGHT + 38]
paint locali
box 1182.5 [expr $REPEATS * $ROW_HEIGHT + 11] 1199.5 [expr $REPEATS * $ROW_HEIGHT + 35]
paint viali
box 1176.5 [expr $REPEATS * $ROW_HEIGHT + 8] 1205.5 [expr $REPEATS * $ROW_HEIGHT + 48]
paint metal1
box 1176.5 [expr $REPEATS * $ROW_HEIGHT + 14] 1205.5 [expr $REPEATS * $ROW_HEIGHT + 42]
paint via1
box 1170 [expr $REPEATS * $ROW_HEIGHT + 8] 1212 [expr $REPEATS * $ROW_HEIGHT + 50]
paint metal2

box 1170 [expr $REPEATS * $ROW_HEIGHT + 8] 1212 [expr $REPEATS * $ROW_HEIGHT + 70]
paint metal3
box 1176 [expr $REPEATS * $ROW_HEIGHT + 11] 1208 [expr $REPEATS * $ROW_HEIGHT + 47]
paint via3
box 1176 [expr $REPEATS * $ROW_HEIGHT + 13] 1206 [expr $REPEATS * $ROW_HEIGHT + 45]
paint via2
box 1170 [expr $REPEATS * $ROW_HEIGHT + 8] 1212 [expr $REPEATS * $ROW_HEIGHT + $ROW_HALF_HEIGHT + 50]
paint metal4

# Power
box 200 -50 370 [expr $REPEATS * $ROW_HEIGHT + $ROW_HALF_HEIGHT + 50]
paint metal4

# Ground
box 500 -50 670 [expr $REPEATS * $ROW_HEIGHT + $ROW_HALF_HEIGHT + 50]
paint metal4

box 0 -50 1400 [expr $REPEATS * $ROW_HEIGHT + $ROW_HALF_HEIGHT + 50]
save incrementer.mag
quit -noprompt
