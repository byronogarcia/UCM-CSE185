% init
I1 = im2double(imread('/Users/byrongarcia/Documents/CSE185/lab03/lena.jpg'));

% Lab03 - 1
H = [1, 2, 1; 0, 0, 0; -1, -2, -1]; % horizontal edge

img_sobel = sobel_filter(I1, H);
figure, imshow(img_sobel);
imwrite(img_sobel, 'sobel_y.jpg');

% Lab03 - 2
V = [1, 0, -1; 2, 0, -2; 1, 0, -1]; % vertical edge

img_sobel2 = sobel_filter(I1, V);
figure, imshow(img_sobel);
imwrite(img_sobel2, 'sobel_x.jpg');

% Lab03 - 3
img_break = sobel_filter(I1, H);
img_break2 = sobel_filter(img_break, V);
figure, imshow(img_break);

% Lab03 - 4

% Lab03 - 5
hsize = 5;
sigma = 2;
I2 = gaussian_filter(I1, hsize, sigma);
figure, imshow(I2);
imwrite(I2, 'gaussian_5.jpg');

% Lab03 - 6
hsize = 9;
sigma = 4;
I2 = gaussian_filter(I1, hsize, sigma);
figure, imshow(I2);
imwrite(I2, 'gaussian_9.jpg');

Lab03 - 7
function output = gaussian_filter(img, hsize, sigma)
	H = fspecial('gaussian', hszie, sigma);
	imageFiltered = zeros(size(img));
	uSh = size(img, 2);
	vSh = size(img, 1);
	for u = 1 : uSh
		for v = 1 : vSh
			if(u >= 1 && u <= uSh - hsize && v >= 1 && v <= vSh - hsize)
				t = sum(sum(H.* img(v:v + hsize - 1, u : u + hsize - 1)));
				imageFiltered(v, u, :) = t;
			else
				imageFiltered(v, u, :) = img(v, u);
			end
		end
	end
	output = imageFiltered;
end

% sobel filter function
function output = sobel_filter(img, kernel)
	imageFiltered = zeros(size(img));
	var = 1;
	shU = size(img, 2);
	shV = size(img, 1);
	for u = 2 + var : shV - var
		for v = 2 + var : shV - var
			temp = sum(sum(kernel.*img(v-1 : v+1, u-1 : u+1)));
			imageFiltered(v, u) = temp;
		end
	end
	output = imageFiltered;
end


