points = csvread('Data/d5.csv');
x = points(:, 2);
y = points(:, 3);
z = points(:, 4);

yerr = points(:, 1);

figure('Name', 'scatter');
scatter3(x, y, z);%, [], abs(yerr));
%axis equal;

[g_x, g_y, g_z] = meshgrid(0 : 0.01 : 0.03, 0 : 0.01 : 0.07, 0.0 : 0.004 : 0.013);
g_x = reshape(g_x, 1, []);
g_y = reshape(g_y, 1, []);
g_z = reshape(g_z, 1, []);

g = [g_x', g_y', g_z'];

mask = ~isnan(x);
g = g(mask, :);
points = points(mask, :);

[e, T] = calculate_point_transform(g, points(:, 2 : 4), g, points(:, 2 : 4));

transformed = nan(size(g));
for i = 1 : size(g, 1)
	tmptrans = T \ [g(i, :)'; 1];
	transformed(i, :) = tmptrans(1 : 3)';
end

% e = nan(size(transformed, 1), 1);
% for i = 1 : size(transformed, 1)
% 	e(i) = norm(transformed(i, :) - points(i, 2 : 4));
% end
% 
% e

max(e)
mean(e)
median(e)

hold on;
scatter3(transformed(:, 1), transformed(:, 2), transformed(:, 3));
hold off;

figure('Name', 'hist');
hist(e);