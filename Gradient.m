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

%% Find Pixels with desired gradient direction
gradient_pixel = select_gdir(gmag, gdir, 1, 30, 45); % 45degree with +/- 15;
imshow(gradient_pixel);
% We can find pixels within any range
gradient_pixel = select_gdir(gmag, gdir, 1, -15, 15);
imshow(gradient_pixel);
gradient_pixel = select_gdir(gmag, gdir, 1, -150, -120);
imshow(gradient_pixel);

%% Function to find the pixels which lie in given mag & angle range

function result = select_gdir(gmag, gdir, min_mag, min_ang, max_ang)
    result = gmag >= min_mag & min_ang <= gdir & max_ang >= gdir;
end