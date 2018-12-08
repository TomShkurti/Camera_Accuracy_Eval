i = imread('red_to_blue.png');
r = i(:,:,1);
g = i(:,:,2);
b = i(:,:,3);

%Get histValues for each channel
[yr, xr] = imhist(r);
[yg, xg] = imhist(g);
[yb, xb] = imhist(b);

%Plot them together in one plot
plot(xr, yr, 'Red', xg, yg, 'Green', xb, yb, 'Blue');
axis([0 255 0 inf]);