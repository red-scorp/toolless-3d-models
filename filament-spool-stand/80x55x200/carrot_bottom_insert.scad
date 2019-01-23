// carrot bottom insert

// clearance
tol = 0.25;

// innere insert parameters
iih = 10;
iiw = 10;
iil = 20;

// outer insert parameters
iob = 45;
iol = 20;
ioh = iih;
irh = iih;
irw = 15;
irl = 6;

real_h = iih - tol;

pp = [[-iob / 2, 0],
	[-iob / 3 , -iol / 2],
	[0, -iol],
	[iob / 3 , -iol / 2],
	[iob / 2, 0]];
pl = [[0, 1, 2, 3, 4]];

translate([-(iiw - tol) / 2, 0, 0]) cube([iiw - tol, iil + irw, real_h]);
translate([-irw / 2, -irl, 0]) cube([irw, irl * 2, real_h]);
translate([0, iil + irw - iih / 2, 0]) cylinder(d = iiw + tol, h = real_h, $fn = 50);
translate([0, 0, 0]) linear_extrude(real_h) polygon(pp, pl, 10);
