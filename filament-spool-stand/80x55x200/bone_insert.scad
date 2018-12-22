// insert (need 2 items)

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

pp = [[-(iiw - tol) / 2, 0],
	[(iiw - tol) / 2, 0],
	[(iiw - tol - tol) / 2, 5],
	[(iiw - tol) / 4, 1],
	[0, 3],
	[-(iiw - tol) / 4, 4]];
pl = [[0, 1, 2, 3, 4]];

translate([-(iiw - tol) / 2, 0, 0]) cube([iiw - tol, iil + irw, real_h]);
translate([-irw / 2, -irl, 0]) cube([irw, irl * 2, real_h]);
translate([iod / 3, -iod / 2, 0]) cylinder(d = iod, h = real_h, $fn = 50);
translate([-iod / 3, -iod / 2, 0]) cylinder(d = iod, h = real_h, $fn = 50);
translate([0, iil + irw - iih / 2, 0]) cylinder(d = iiw + tol, h = real_h, $fn = 50);
translate([0, iil + irw, 0]) linear_extrude(real_h) polygon(pp, pl, 10);
