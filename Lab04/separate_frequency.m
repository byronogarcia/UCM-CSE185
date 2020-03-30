function [low_pass_img, high_pass_img] = separate_frequency(I1, ratio)
	% FFT
	frequency_map = fft2(I1);

	% shift
	frequency_map_shifted = fftshift(frequency_map);

	% compute low freq mask
	height = ratio * size(I1, 1);
	width = ratio * size(I1, 2);

	y1 = round(size(I1, 1) / 2) - height;
	y2 = round(size(I1, 1) / 2) + height;
	x1 = round(size(I1, 2) / 2) - width;
	x2 = round(size(I1, 2) / 2) + width;
	mask = zeros(size(I1));
	mask(y1 : y2, x1 : x2, :) = 1;

	% separate low-freq and high-freq maps
    low_frequency_map_shifted = frequency_map_shifted .* mask;
    high_frequency_map_shifted = frequency_map_shifted .* (1 - mask);
    
    % shift frequency maps back
    low_frequency_map = ifftshift(low_frequency_map_shifted);
    high_frequency_map = ifftshift(high_frequency_map_shifted);
    
    % apply Inverse FFT
    low_pass_img = real(ifft2(low_frequency_map)); 
    high_pass_img = real(ifft2(high_frequency_map));
    
end
