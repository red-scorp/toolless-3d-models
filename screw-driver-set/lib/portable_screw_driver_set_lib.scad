/* Portable screw driver container module library file */

module portable_screw_driver_set_container() {

	difference(convexity = 10) {
		union() {
			difference() {
				union() {
					cylinder(h = outer_hull_len, d = outer_hull_dia);
					translate([0, 0, outer_hull_len]) cylinder(h = outer_hull_cone, d1 = outer_hull_dia, d2 = outer_hull_dia - outer_hull_cone * 2);
				}
				for(ang = [0: outer_rib_cnt - 1]) rotate([0, 0, ang * 360 / outer_rib_cnt]) translate([outer_hull_dia / 2 + outer_rib_dia / 2 - outer_rib_depth, 0, outer_rib_offset]) cylinder(d = outer_rib_dia, h = outer_hull_len);

				for(ang = [0: lock_cnt - 1]) rotate([0, 0, ang * 360 / lock_cnt]) translate([outer_hull_dia / 2 - lock_mark_depth, 0, outer_rib_offset / 2]) rotate([0, 90, 0]) cylinder(h = lock_mark_depth * 2, d = lock_mark_dia, $fn = 3);
		}

			}

		union() {
			cylinder(h = inner_container_len, d = inner_container_dia);
			translate([0, 0, inner_container_len]) cylinder(h = inner_container_cone, d1 = inner_container_dia, d2 = inner_container_dia - inner_container_cone * 2);
		}

		translate([0, 0, outer_hull_len + outer_hull_cone - hexal_hole_depth + 0.1]) cylinder(d = hexal_hole_dia, h = hexal_hole_depth, $fn = 6);

		union() {
			translate([0, 0, -lock_offset]) cylinder(h = lock_offset * 2, d = inner_container_dia + lock_tol);
			translate([0, 0, lock_offset]) cylinder(h = lock_hight, d = inner_container_dia + lock_depth * 2 + lock_tol);
			translate([0, 0, lock_offset + lock_depth]) cylinder(h = lock_hight, d1 = inner_container_dia + lock_depth * 2 + lock_tol, d2 = inner_container_dia);

			intersection() {
				translate([0, 0, lock_offset - lock_tol]) cylinder(h = lock_offset, d = inner_container_dia + lock_depth * 2 + lock_tol);
				for(ang = [0: lock_cnt - 1]) rotate([0, 0, ang * 360 / lock_cnt + 360 / lock_cnt / 2]) translate([0, -(lock_br - lock_tol) / 2, -lock_offset]) cube([inner_container_dia, lock_br - lock_tol, lock_offset * 2]);
			}

			intersection() {
				translate([0, 0, -lock_offset]) cylinder(h = lock_offset * 2, d = inner_container_dia + lock_depth * 2 + lock_tol);
				for(ang = [0: lock_cnt - 1]) rotate([0, 0, ang * 360 / lock_cnt]) translate([0, -(lock_br - lock_tol) / 2, -lock_offset]) cube([inner_container_dia, lock_br - lock_tol, lock_offset * 2]);
			}
		}
	}
}

module portable_screw_driver_set_lid() {

	difference() {
		union() {
			translate([0, 0, -lock_offset + lock_tol]) cylinder(h = lock_offset * 2 + lock_hight, d = inner_container_dia - lock_tol);

			intersection() {
				translate([0, 0, lock_offset + lock_tol]) cylinder(h = lock_hight, d1 = inner_container_dia + lock_depth * 2 - lock_tol, d2 = inner_container_dia);
				for(ang = [0: lock_cnt - 1]) rotate([0, 0, ang * 360 / lock_cnt]) translate([0, -(lock_br - lock_tol) / 2, lock_offset]) cube([inner_container_dia, lock_br - lock_tol, lock_offset * 2]);

			}

			difference() {
				union() {
					translate([0, 0, -lid_len]) cylinder(h = lid_len, d = lid_dia);
					translate([0, 0, -lid_len - lid_cone]) cylinder(h = lid_cone, d1 = lid_dia - 2 * lid_cone, d2 = lid_dia);
				}

				for(ang = [0: lid_rib_cnt - 1]) rotate([0, 0, ang * 360 / lid_rib_cnt]) translate([lid_dia / 2 + lid_rib_dia / 2 - lid_rib_depth, 0, -lid_len - lid_rib_offset]) cylinder(d = lid_rib_dia, h = lid_len);

				for(ang = [0: lock_cnt - 1]) rotate([0, 0, ang * 360 / lock_cnt]) translate([lid_dia / 2 - lid_cone - lid_rib_offset - lock_mark_dia / 2, 0, -lid_len - lid_cone - lock_mark_depth]) cylinder(h = lock_mark_depth * 2, d = lock_mark_dia, $fn = 3);
			}
		}

		translate([0, 0, -lid_hole_len + lock_offset + lock_hight + lock_tol * 2]) cylinder(h = lid_hole_len + lock_tol, d = lid_hole_dia);
	}
}
