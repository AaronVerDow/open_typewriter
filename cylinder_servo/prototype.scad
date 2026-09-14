striker_d=35; //based off selectric size

// guessed variables
platen_d=20;
platen_w=150; // I do want an A5 sized platen
striker_h=35;

pad=0.1;
padd=pad*2;

shield_wall=5;
shield_lid=2.5;
shield_bearing_wall=shield_lid;
shield_gap=5;
shield_id=striker_d+shield_gap*2;
shield_od=shield_id+shield_wall*2;
shield_h=striker_h+shield_wall;

servo_h=36.1;

bearing_id=3;
bearing_od=7;
bearing_h=3;
bearing_lip=0.5; // used for width and depth

shift_d=50;

$fn=90;

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

module bearing() {
	color("silver")
	difference() {
		union() {
			cylinder(d=bearing_od,h=bearing_h);
			cylinder(d=bearing_od+bearing_lip*2,h=bearing_lip);
		}
		translate([0,0,-pad])
		cylinder(d=bearing_id,h=bearing_h+padd);
	}
}


module shield() {

	difference() {
		cylinder(d=shield_od,h=shield_h);
		translate([0,0,-pad])
		cylinder(d=shield_id,h=shield_h+padd);
	};

	translate([0,0,striker_h+bearing_lip])
	difference() {
		cylinder(d=bearing_od+shield_bearing_wall*2,h=shield_bearing_wall);
		translate([0,0,-pad])
		cylinder(d=bearing_od,h=shield_bearing_wall+padd);

	}


}

module striker_assembly() {
	striker();

	translate([-30,0,-50])
	futabas3003([0,0,0], [-90,0,0]);

	futabas3003([0,0,0], [0,0,0]);
	shield();

	*translate([0,0,striker_h])
	bearing();
}


//assemble();
striker_assembly();

