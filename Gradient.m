%% load and convert image to double type, range [0,1] for convinience
img = double(imread('Octagon.png')) / 255.0;
imshow(img) %uses range [0,1] for double images

%% compute gradients in x and y direction
[gx, gy] = imgradientxy(img, 'sobel');  % Here gx, gy are not normalised
%To View the calculated gradients
% For x
imshow((gx + 4)/8); % as range for gx is [-4,4].
% we can also do imshow(gx, []) to autoselect the range instead of manually
% adjusting it.
% Similarly, for y
imshow((gy + 4)/8);

%% Obtain gradient magnitude and direction
[gmag, gdir] = imgradient(gx, gy);
% displaying the magnitudes
imshow(gmag / (4 * sqrt(2))); 
imshow((gdir + 180) / 360); %As range in [-180 180]

%% Function to find the pixels which lie in given mag & angle range