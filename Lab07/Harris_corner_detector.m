function [corner_x, corner_y] = Harris_corner_detector(I, sigma1, sigma2, alpha, R_threshold)
	% Image names

	% Guassian kernels
    val1 = sigma1 * 2;
    val2 = sigma2 * 2;
    
    hsize1 = 1 + 2 * ceil(val1);
    hsize2 = 1 + 2 * ceil(val2);

	guassian_kernel1 = fspecial('gaussian', hsize1, sigma1);
	guassian_kernel2 = fspecial('gaussian', hsize2, sigma2);

	% derivative filter
	Dx = [1, 0, -1];
	Dy = [1; 0; -1];

	% Use derivative of Guassian to compute x-gradient (Ix) and y-gradient (Iy)
	Ix = imfilter(I, Dx, 'replicate');
    figure, imshow(Ix);
	imwrite(Ix + 0.5, 'Dx_cross_I.png'); % IMAGE 1

	Ix = imfilter(Ix, guassian_kernel1, 'replicate');
    figure, imshow(Ix);
	imwrite(Ix + 0.5, 'I_x.png'); % IMAGE 2 

	Iy = imfilter(I, Dy, 'replicate');
    figure, imshow(Iy);
	imwrite(Iy + 0.5, 'Iy_cross_I.png'); % IMAGE 3

	Iy = imfilter(Iy, guassian_kernel1, 'replicate');
    figure, imshow(Iy);
	imwrite(Iy + 0.5, 'I_y.png'); % IMAGE 4


	% Ixx / Iyy / Ixy
	Ixx = Ix .* Ix;
	Iyy = Iy .* Iy;
	Ixy = Ix .* Iy;

	% Sxx / Syy / Sxy
	Sxx = imfilter(Ixx, guassian_kernel2);
	Syy = imfilter(Iyy, guassian_kernel2);
	Sxy = imfilter(Ixy, guassian_kernel2);

	% corner response
	% worked out below:
	% determinant = (Sxx .* Syy) - (Sxy .* Sxy)
	% trace = Sxx + Syy
	% R = determinant - alpha * (trace).^2

	R = ((Sxx .* Syy) - (Sxy .* Sxy)) - alpha*((Sxx + Syy).^2);
    figure, imagesc(R), colormap;
	imwrite(R, 'cornerresponse.png'); % IMAGE 5

	% corner map
	corner_map = R > R_threshold;
    figure, imshow(corner_map);
	imwrite(corner_map, 'response_threshold.png');


	% local maxima of R
	local_maxima = max_sup(R);
    figure, imshow(local_maxima);
	imwrite(local_maxima, 'cornermax.png');

	% final corner map and x / y coordinate
	final_corner_map = corner_map & local_maxima;
    figure, imshow(final_corner_map);
	imwrite(final_corner_map, 'finalcornermap.png');

	[corner_y, corner_x] = find(final_corner_map);


end