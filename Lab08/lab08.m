% name = 'lines';
% name = 'bridge';
 name = 'hill';

I = imread(sprintf('%s.png', name));


% extract edge map
edge_map = edge(rgb2gray(I), 'canny', 0.1, 3);
figure, imshow(edge_map);


% HOUGH TRANFROM MB
[m, b] = hough_transform(edge_map);
x = 1:size(I, 2);
y = m * x + b;

figure, imshow(I); title('Your implementation (mb)'); hold on;
plot(x, y, 'LineWidth', 4, 'Color', 'red');
h = gcf;
saveas(h, sprintf('%s_mb_line.png', name));


% HOUGH TRANSFROM POLAR
[r, theta] = hough_transform_polar(edge_map);
x = 1:size(I, 2);
y = -(cos(theta)/sin(theta)) * x + (r / sin(theta));

figure, imshow(I); title('Your implementation (polar)'); hold on;
plot(x, y, 'LineWidth', 4, 'Color', 'blue');
h = gcf;
saveas(h, sprintf('%s_polar_line.png', name));