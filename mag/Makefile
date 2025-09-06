all: tt_um_rebelmike_incrementer.mag

incrementer.mag: incrementer.tcl
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc -noconsole -dnull incrementer.tcl

tt_um_rebelmike_incrementer.mag: magic_project.tcl incrementer.mag
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc -noconsole -dnull magic_project.tcl

magic: tt_um_rebelmike_incrementer.mag
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc tt_um_rebelmike_incrementer.mag

spice: tt_um_rebelmike_incrementer.mag
	magic -rcfile $(PDK_ROOT)/sky130A/libs.tech/magic/sky130A.magicrc -noconsole -dnull ext2spice.tcl
	@mv tt_um_flat.* ../spice
