img = im2double(imread('lena.jpg'));

% compute gradient magnitude and orientation with Sobel filter
[magnitude, orientation] = sobel_feature(img);

% apply threshold to detect edge
threshold = 0.3;
e = magnitude > threshold;

% use built-in function to detect edge
e1 = edge(img, 'Sobel');
e2 = edge(img, 'Canny');

figure, imshow(img);
figure, imshow(e1); title('Sobel Edge');
figure, imshow(e2); title('Canny Edge');

imwrite(e1, 'lena_sobel_edge.jpg');
imwrite(e2, 'lena_canny_edge.jpg');

