%Load Image
img = imread("Saturn.png");
imshow(img);

%Adding Noise
noise_sigma = 25;
noise = uint8(randn(size(img))) .* noise_sigma;
noisy_image = img + noise;
imshow(noisy_image);

%Create a Gaussian Filter
filter_size = 11;
filter_sigma = 2;
%If you're using Octave, use "pkg load img" before next statement
filter = fspecial('gaussian', filter_size, filter_sigma);

%Applying Filter to remove noise
smoothed = imfilter(noisy_image, filter);
imshow(smoothed);
