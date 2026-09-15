striker_d=35; //based off selectric size

pad=0.1;
padd=pad*2;
zero=0.0001;

// eyeballed
servo_wing_top=7;

// guessed variables
platen_d=20;
platen_w=150; // I do want an A5 sized platen
striker_h=35;

shield_wall=2.5;
shield_lid=2.5;
shield_bearing_wall=shield_wall;
shield_gap=2.5;
shield_upper_gap=0.5; //must account for bearing flange
shield_id=striker_d+shield_gap*2;
shield_od=shield_id+shield_wall*2;
shield_h=striker_h+shield_bearing_wall+shield_upper_gap+servo_wing_top;


servo_h=36.1;

bearing_id=3;
bearing_od=7;
bearing_h=3;
bearing_lip=0.5; // used for width and depth

shield_point_od=bearing_od+shield_bearing_wall*2;

shift_d=50;


$fn=90;

use <../lib/servos.scad>;
use <../lib/gears.scad>;


module pad_z() {
	translate([0,0,-pad])
	children();
}

module arc(arc,a=0,b=0,height=zero,corner=zero) {
	minkowski() {
		rotate(a)
		rotate_extrude(angle=b-a)
		square([arc-corner/2,height]);
		cylinder(d=corner,h=zero);
	}


}

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
	shield_angle = 90;

	// main body
	translate([0,0,-servo_wing_top])
	rotate([0,0,180])
	intersection() {
		difference() {
			arc(shield_od/2+pad,-shield_angle/2,shield_angle/2,shield_h,shield_point_od);
			pad_z()
			cylinder(d=shield_id,h=shield_h-shield_bearing_wall+pad);
			translate([0,0,pad])
			cylinder(d=bearing_od,h=shield_h);
		};
	};
}

module striker_assembly() {
	striker();

	futabas3003([0,0,0], [0,0,0]);
	shield();

	*translate([0,0,striker_h])
	bearing();
}


//assemble();
striker_assembly();

