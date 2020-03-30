function [magnitude, orientation] = sobel_feature(img) 
	% Horizontal edge
	Hy = [1, 2, 1; 0, 0, 0; -1, -2, -1];
	% Vertical edge
	Hx = [1, 0, -1; 2, 0, -2; 1, 0, -1];

	% Sobel filtering
	% imfilter from sobel_filter in lab03
% 	I2 = zeros(size(img));
    

	%Gx = imfilter(img, Hx);
	%Gy = imfilter(img, Hy);
    
    sobelH = imfilter(img,Hy);
    sobelV = imfilter(img,Hx);

	% computer gradient magnitude and orientation
% 	magnitude = img;
% 	orientation = img;

    % change img to your gradient magnitude
    magnitude = sqrt((sobelH.^2)+(sobelV.^2)); 
    % change img to your gradient orientation
    orientation = atan2(sobelH,sobelV); 
end