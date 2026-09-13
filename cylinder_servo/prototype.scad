striker_d=35; //based off selectric size

// guessed variables
platen_d=20;
platen_w=150; // I do want an A5 sized platen
striker_h=35;

use <../lib/servos.scad>;


module platen() {
	color("#222222")
	rotate([0,90,0])
	cylinder(d=platen_d,h=platen_w,center=true);
}

module striker() {
	color("red")
	cylinder(d=striker_d,h=striker_h,center=true);
}

module assemble() {
	platen();
	striker();
}

assemble();

futabas3003();
