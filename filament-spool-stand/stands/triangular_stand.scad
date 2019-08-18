// triangle stand

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
			intersection() {
				cylinder(d = sod + 40, h = sst, $fn = 3, center = true);
				cylinder(d = sod, h = sst, $fn = 100, center = true);
			}
			cylinder(d = sod - 40, h = sst + 0.2, $fn = 3, center = true);
		}
		translate([z_offset, 0, 0]) cube([irw + tol, irh + tol, irl], center = true);
	}
}

module connection(h) {
	difference() {
		intersection() {
			cylinder(d = sod + 40, h = h, $fn = 3, center = true);
			cylinder(d = sod, h = h, $fn = 100, center = true);
		}
		translate([z_offset, 0, 0]) cylinder(d = ssd, h = h + 0.2, $fn = 100, center = true);
	}
}