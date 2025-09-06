simulation.spice: pre.spice tt_um_flat.spice post.spice
    # magic puts subckt and end around extract, so remove it
	echo ".lib '$(PDK_ROOT)/sky130A/libs.tech/ngspice/sky130.lib.spice' tt" > pdk_lib.spice
	#sed -i -e 's/.ends//' tt_um_flat.spice
	#sed -i -e 's/.subckt tt_um_flat//' tt_um_flat.spice
	# build a simulation with pre and post.spice
	cat $^ > $@

sim: simulation.spice
	# run the simulation
	ngspice $^
