// primer handle (need 2 items)

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

translate([-7.5, -30, 0]) cube([15, 30, real_h]);

translate([-50, -40, 0]) cube([100, 15, real_h]);


