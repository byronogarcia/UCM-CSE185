function frequency_map = visualization(I1)
	frequency_map = fftshift(fft2(I1));
	figure, imagesc(log(abs(frequency_map) + 1)), colormap jet;
end