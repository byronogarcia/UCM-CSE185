
lena = im2double(imread('lena.jpg'));

sigma = 2.0;
hsize = 7;
scale = 5;


%% Gaussian Pyramid
I = lena;

for s = 1:scale
    
    % Gaussian filtering
    kernel = fspecial('gaussian', hsize, sigma);
    var = floor(hsize/2);
    % your code here
    for u = 1 : size(img, 2)
        for v = 1 : size(img, 1)
            x1 = u - var; x2 = u + var;
            y1 = v - var; y2 = v + var;
            
            if ((x1 > 1) && (x2 < (size(img, 2) - var)) && (y1 > 1) && (y2 < (size(img, 1) - var))  )
                patch = img(y1:y2, x1:x2);
                value = patch .* kernel;
                value = sum(value(:));
            else
                value = img(v,u);
            end
            
            %(v, u) = value;
        end
    end
    
    % Save or show image
    imwrite(I, sprintf('Gaussian_scale%d.jpg', s)); % change I to the output of Gaussian filter
    figure;imshow(I);
    % Down-sampling
    I = imresize(I,1/2);
end


%% Laplacian Pyramid
I = lena;
for s = 1:scale
    
    % Gaussian filtering
    kernel = fspecial('gaussian', hsize, sigma);
    var = floor(hsize/2);
    % your code here
    for u = 1 : size(img, 2)
        for v = 1 : size(img, 1)
            x1 = u - var; x2 = u + var;
            y1 = v - var; y2 = v + var;
            
            if ((x1 > 1) && (x2 < (size(img, 2) - var)) && (y1 > 1) && (y2 < (size(img, 1) - var))  )
                patch = img(y1:y2, x1:x2);
                value = patch .* kernel;
                value = sum(value(:));
            else
                value = img(v,u);
            end
            
            I(v, u) = value;
        end
    end
    % Laplacian filtering
    I = img - I +0.5;
    % Save or show image
    imwrite(I + 0.5, sprintf('Laplacian_scale%d.jpg', s)); % change I to the output of Laplacian filter
    figure;imshow(I);
    % Down-sampling
    I = img;
    I = imresize(I,1/2);
    img = imresize(img,1/2);
end