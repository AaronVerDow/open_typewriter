striker_d=35; //based off selectric size

// guessed variables
platen_d=20;
platen_w=150; // I do want an A5 sized platen
striker_h=35;

pad=0.1;
padd=pad*2;

shield_wall=5;
shield_gap=5;
shield_id=striker_d+shield_gap*2;
shield_od=shield_id+shield_wall*2;
shield_h=striker_h+shield_wall;

servo_h=36.1;

bearing_d=7;
bearing_h=3;
bearing_lip=0.5; // used for width and depth

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

module shield() {

	difference() {
		cylinder(d=shield_od,h=shield_h);
		translate([0,0,-pad])
		cylinder(d=shield_id,h=shield_h+padd);
	};

}

module striker_assembly() {
	striker();

	futabas3003([0,0,0], [0,0,0]);
	shield();

}


//assemble();
striker_assembly();

