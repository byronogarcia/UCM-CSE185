% Lab 02 - 1
I = imread('01.jpg');
I2 = zeros(300, 400, 3, 'uint8');

for y1 = 1:300
    for x1 = 1:400
        y2 = (y1 - 150) * cosd(45) + (x1 - 200) * sind(45);
        x2 = -(y1 - 150) * sind(45) + (x1 - 200) * cosd(45);
        y2 = round(y2) + 150;
        x2 = round(x2) + 200;
        
        if(1 <= y2 && y2 <= 300 && 1 <= x2 && x2 <= 400)
            I2(y2, x2, :) = I(y1, x1, :);
        end
    end
end

imwrite(I2, 'rotate_0.jpg');
I2 = ('rotate_0.jpg');
figure, imshow(I2);

% Lab 02 - 2
I = imread('01.jpg');
I2 = zeros(300, 400, 3, 'uint8');

for y1 = 1:300
    for x1 = 1:400
        y2 = (y1 - 150) * cosd(45) + -(x1 - 200) * sind(45);
        x2 = (y1 - 150) * sind(45) + (x1 - 200) * cosd(45);
        y2 = round(y2) + 150;
        x2 = round(x2) + 200;
        
        if(1 <= y2 && y2 <= 300 && 1 <= x2 && x2 <= 400)
            I2(y2, x2, :) = I(y1, x1, :);
        end
    end
end

imwrite(I2, 'rotate_1.jpg');
I2 = ('rotate_1.jpg');
figure, imshow(I2);

% Lab 02 - 3
ln = im2double(imread('lena_noisy.jpg'));

patch_size = [3, 3];
img_median = median_filter(ln, patch_size);
imwrite(img_median, 'median_0.jpg');
%imwrite(medfilt2(ln, patch_size), 'mediantest.jpg');
I2 = ('median_0.jpg');
figure, imshow(I2);

% Lab 02 - 4
ln = im2double(imread('lena_noisy.jpg'));

patch_size = [5, 5];
img_median = median_filter(ln, patch_size);
imwrite(img_median, 'median_1.jpg');
%imwrite(medfilt2(ln, patch_size), 'mediantest.jpg');
I2 = ('median_1.jpg');
figure, imshow(I2); 



