// old key handle insert (need 2 items)

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

real_h = iih - tol;

translate([-(iiw - tol) / 2, 0, 0]) cube([iiw - tol, iil + irw, real_h]);
translate([-irw / 2, -irl, 0]) cube([irw, irl * 2, real_h]);

translate([-7.5, -20, 0]) cube([10, 20, real_h]);
translate([-5, -25, 0]) cube([10, 25, real_h]);

translate([-5, -20, 0]) difference() {
	cube([25, 20, real_h]);
	translate([13, 9, 0]) cube([12, 2, real_h]);
	translate([18, 4, 0]) cube([2, 12, real_h]);

	translate([13, 10, 0]) cylinder(d = 4, h = real_h, $fn = 50);
	translate([19, 4, 0]) cylinder(d = 4, h = real_h, $fn = 50);
	translate([19, 16, 0]) cylinder(d = 4, h = real_h, $fn = 50);
}

translate([0, iil + irw - iih / 2, 0]) cylinder(d = iiw + tol, h = real_h, $fn = 50);


