striker_d=35; //based off selectric size

// guessed variables
platen_d=20;
platen_w=150; // I do want an A5 sized platen
striker_h=35;

servo_h=36.1;

use <../lib/servos.scad>;
use <../lib/gears.scad>;


module platen() {
	color("#222222")
	rotate([0,90,0])
	cylinder(d=platen_d,h=platen_w,center=true);
}

module striker() {
	color("red")
	cylinder(d=striker_d,h=striker_h);
}

module assemble() {
	platen();
	striker();
}

module striker_assembly() {
	translate([0,0,8])
	striker();

	// just guessing mesh for now
	translate([0,38]) {
		futabas3003([0,0,0], [0,0,0]);
		herringbone_gear(modul=1.5, tooth_number=30, width=8, bore=6, pressure_angle=20, helix_angle=30);
	}

	herringbone_gear(modul=1.5, tooth_number=20, width=8, bore=6, pressure_angle=20, helix_angle=30);

}

//assemble();
striker_assembly();

