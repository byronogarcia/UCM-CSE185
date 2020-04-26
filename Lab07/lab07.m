% I1 = im2double(imread(sprintf('baboon.png')));
% I1 = im2double(imread(sprintf('cameraman.png')));
 I1 = im2double(imread(sprintf('checkboard.png')));

% parameters
sigma1 = 1;
sigma2 = 2;
alpha = 0.04;
R_threshold = 1e-5 * 5;

% corner detecter
% [corner_x, corner_y] = Harris_corner_detector(I1, sigma1, sigma2, alpha, R_threshold);
% [corner_x, corner_y] = Harris_corner_detector(I1, sigma1, sigma2, alpha, R_threshold);
 [corner_x, corner_y] = Harris_corner_detector(I1, sigma1, sigma2, alpha, R_threshold);

% visualize baboon
% figure, imshow(I1); hold on;
% plot(corner_x, corner_y, 'ro');

% visualize cameraman
%  figure, imshow(I1); hold on;
%  plot(corner_x, corner_y, 'ro');
% 
% visualize checkboard
 figure, imshow(I1); hold on;
 plot(corner_x, corner_y, 'ro');

h = gcf;

% imwrite(I1, 'baboon_corners.png');
% imwrite(I1, 'cameraman_corners.png');
 imwrite(I1, 'checkboard_corners.png');