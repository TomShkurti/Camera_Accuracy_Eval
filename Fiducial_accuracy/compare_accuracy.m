fidlocs = csvread('locations_retroreflective.csv');
camera_locs = fidlocs(:, 1 : 3);
cart_locs = fidlocs(:, 4 : 6);

[e, T] = calculate_point_transform(camera_locs, cart_locs, camera_locs, cart_locs);

e