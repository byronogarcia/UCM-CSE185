function mergingImage = hybrid_image(I1, I2, ratio)
	[low_frequency_img, high_frequency_img] = separate_frequency(I1, ratio);
	[low_frequency_img, high_frequency_img] = separate_frequency(I2, ratio);

	mergingImage = low_frequency_img + high_frequency_img;
end