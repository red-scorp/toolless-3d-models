/* Portable screw driver container COMMON configuration file */

xxx = 0; /* MUST be overwritten by inidividual config file */

inner_container_len = xxx;
inner_container_dia = xxx;
inner_container_cone = xxx;

outer_hull_len = xxx;
outer_hull_dia = xxx;
outer_hull_cone = xxx;

outer_rib_cnt = xxx;
outer_rib_depth = 2;
outer_rib_dia = xxx;
outer_rib_offset = 10;

hexal_hole_dia = 7.9;
hexal_hole_depth = 15;

lock_offset = 2.5;
lock_depth = 2.5;
lock_hight = 2.5;
lock_cnt = xxx;
lock_br = 10;
lock_tol = 0.2;

lid_len = xxx;
lid_dia = outer_hull_dia;
lid_cone = 1;

lid_rib_cnt = outer_rib_cnt;
lid_rib_depth = outer_rib_depth;
lid_rib_dia = outer_rib_dia;
lid_rib_offset = 2;

lid_hole_len = lid_len + lid_cone;
lid_hole_dia = inner_container_dia - 4;

lock_mark_depth = 0.5;
lock_mark_dia = 5;

$fn = 100;
