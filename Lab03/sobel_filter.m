function output = sobel_filter(img, H)
    % your code here
    I2 = zeros(size(img));
    
    for u = 1 + 1 : size(img, 2) - 2
        for v = 1 + 1 : size(img, 1) - 2
            
            t = 0;
            
            for i = -1 : 1
                for j = - 1 : 1
                    t = t + sum(sum(H(i + 2, j + 2) * img(v + j, u + i))); 
                end
            end 
        I2(v, u) = t;
        end
    end
    output = I2;
end

% Hx1 = [1, 1, 1; 2, 2, 2; 1, 1, 1];
% Hx2 = [1, 0, -1];
% tic
% [rows, cols] = size(I1);
% I2 = zeros(rows+2, cols+2);
% I2(1+1:)
%
%
%
%
%
%
%
%
%
%
%
%
%
%
%