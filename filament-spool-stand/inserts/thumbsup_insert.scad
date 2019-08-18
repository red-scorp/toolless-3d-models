// thumbsup insert (need 2 items)

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

translate([-15, -5.5, 0]) cube([5, 5, real_h]);
translate([-15, -0.5, 0]) difference() {
	cylinder(d = 10, h = real_h, $fn = 50);
	translate([-5, 0, 0]) cube([10, 5, real_h]);
}

translate([-9.5, -12, 0]) cube([17, 12, real_h]);
translate([-9.5, -13, 0]) cube([4, 4, real_h]);
translate([-9, -3, 0]) cylinder(d = 6, h = real_h, $fn = 50);
translate([-6.5, -13, 0]) cylinder(d = 6, h = real_h, $fn = 50);
translate([-2.5, -13.5, 0]) cylinder(d = 6, h = real_h, $fn = 50);
translate([1.5, -13, 0]) cylinder(d = 6, h = real_h, $fn = 50);
translate([5, -12, 0]) cylinder(d = 5, h = real_h, $fn = 50);

translate([0, iil + irw - iih / 2, 0]) cylinder(d = iiw + tol, h = real_h, $fn = 50);

