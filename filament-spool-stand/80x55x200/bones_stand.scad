// bones stand

// clearance
tol = 0.25;

// innere insert parameters
iih = 10;
iiw = 10;
iil = 20;

// outer insert parameters
iod = 15;
ioh = iih;
irh = iih;
irw = 15;
irl = 6;

// drum thickness
odh = 80;

// side length
sod = 140;
sst = 5;
ssd = 225;

drum_delta = odh + (irl - sst);
z_offset = sod / 2 - irw / 2;

translate([0, 0, (sod + 40) / 4]) {
	rotate([0, -90, 0]) {
		translate([0, 0, -drum_delta / 2 - sst / 2]) side();
		translate([0, 0, 0]) connection(drum_delta);
		translate([0, 0, drum_delta / 2 + sst / 2]) side();
	}
}

module side() {
	difference() {
		difference() {
			union() {
				translate([10, -18, 0]) rotate([0, 0, 30]) half_bone(sod, irw, sst);
				translate([10, 18, 0]) rotate([0, 0, -30]) half_bone(sod, irw, sst);
				translate([-37.5, 0 ,0]) rotate([0, 0, 90]) full_bone(sod, irw, sst);
			}
			translate([-60, 0, 0]) cube([30, sod * 2, sst + 5], center = true);
		}
		translate([z_offset, 0, 0]) cube([irw + tol, irh + tol, irl], center = true);
	}
}

module connection(h) {
	translate([-40, -sod * 3 / 7, 0]) rotate([0, 90, 0]) full_bone(h + irw * 2, irw, sst * 2);
	translate([-40, sod * 3 / 7, 0]) rotate([0, 90, 0]) full_bone(h + irw * 2, irw, sst * 2);
}

module half_bone(l, b, h) {
	cube([l + b / 2, b, h], center = true);
	translate([l / 2, b / 3, 0]) cylinder(d = b, h = h, $fn = 100, center = true);
	translate([l / 2, -b / 3, 0]) cylinder(d = b, h = h, $fn = 100, center = true);
}

module full_bone(l, b, h) {
	cube([l + b / 2, b, h], center = true);
	translate([l / 2, b / 3, 0]) cylinder(d = b, h = h, $fn = 100, center = true);
	translate([l / 2, -b / 3, 0]) cylinder(d = b, h = h, $fn = 100, center = true);
	translate([-l / 2, b / 3, 0]) cylinder(d = b, h = h, $fn = 100, center = true);
	translate([-l / 2, -b / 3, 0]) cylinder(d = b, h = h, $fn = 100, center = true);
}
