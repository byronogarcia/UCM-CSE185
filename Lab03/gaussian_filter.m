function output = gaussian_filter(img, hsize, sigma)
    H = fspecial('gaussian', hsize, sigma);
    % your code here
    I2 = zeros(size(img));

    for u = 1 : size(img, 2)
        for v = 1 : size(img, 1)
            if(u >= 1 && u <= size(img, 1) - hsize && v >= 1 && v <= size(img, 2) - hsize)
                t = sum(sum(H.* img(v:v + hsize - 1, u : u + hsize - 1)));
                I2(v, u, :) = t; 
            else
                I2(v, u, :) = img(v, u);
            end
        end
    end
    output = I2;
end