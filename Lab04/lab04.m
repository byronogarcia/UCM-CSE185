% init
I1 = im2double(imread('/Users/byrongarcia/Documents/CSE185/lab04/lena.jpg'));
marilyn = im2double(imread('/Users/byrongarcia/Documents/CSE185/lab04/marilyn.jpg'));
einstein = im2double(imread('/Users/byrongarcia/Documents/CSE185/lab04/einstein.jpg'));
newyork = im2double(imread('/Users/byrongarcia/Documents/CSE185/lab04/new_york.jpg'));
flowers = im2double(imread('/Users/byrongarcia/Documents/CSE185/lab04/flowers.jpg'));

% Lab04 - 2
ratio = 0.1;
I2 = separate_frequency(I1, ratio);
figure, imshow(I2)
[low_pass_img, high_pass_img] = separate_frequency(I1, ratio);
imwrite(low_pass_img, 'lena_low_0.1.jpg'); % lena_low_0.1.jpg
imwrite(high_pass_img + 0.5, 'lena_high_0.1.jpg'); % lena_high_0.1.jpg

% Lab04 - 3
ratio = 0.2;
I2 = separate_frequency(I1, ratio);
figure, imshow(I2)
[low_pass_img, high_pass_img] = separate_frequency(I1, ratio);
imwrite(low_pass_img, 'lena_low_0.2.jpg'); % lena_low_0.2.jpg
imwrite(high_pass_img + 0.5, 'lena_high_0.2.jpg'); % lena_high_0.2.jpg

% Lab04 - 5
ratio = 0.18;
H1 = hybrid_image(marilyn, einstein, ratio);
figure, imshow(H1);
imwrite(H1 + 0.5, 'hybrid_1.jpg'); % hybrid_1.jpg

% Lab03 - 6
ratio = 0.3;
H2 = hybrid_image(einstein, marilyn, ratio);
figure, imshow(H2);
imwrite(H2 + 0.5, 'hybrid_2.jpg'); % hybrid_2.jpg

%Lab03 - 8
I2 = visualization(newyork);
imwrite(I2, 'new_york_frequency.jpg'); % new_york_frequency.jpg

I2 = visualization(flowers);
imwrite(I2, 'flowers_frequency.jpg'); % flowers_ frequency.jpg





