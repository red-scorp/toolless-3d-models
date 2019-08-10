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

translate([-7.5, -25, 0]) cube([15, 25, real_h]);


translate([15, -15, 0]) difference() {
	cylinder(d = 30, h = real_h, $fn = 50);
	cylinder(d = 10, h = real_h, $fn = 50);
}

translate([-15, -15, 0]) difference() {
	cylinder(d = 30, h = real_h, $fn = 50);
	cylinder(d = 10, h = real_h, $fn = 50);
}

translate([0, iil + irw - iih / 2, 0]) cylinder(d = iiw + tol, h = real_h, $fn = 50);


