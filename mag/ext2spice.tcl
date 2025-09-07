load tt_um_rebelmike_incrementer.mag
flatten tt_um_flat
load tt_um_flat
select top cell
extract do local
extract all
ext2sim labels on
ext2sim
extresist tolerance 1
extresist
ext2spice lvs
ext2spice extresist on
ext2spice cthresh 1
ext2spice rthresh 1
ext2spice
quit -noprompt
