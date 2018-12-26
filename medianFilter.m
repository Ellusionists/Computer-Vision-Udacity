%Load image
img = imread("moon.png");

%Adding Salt and pepper noise
newimage = imnoise(img, 'salt & pepper');
% imshow(newimage);
%Default is 5% or you can mention another parameter such as 0.03 

%Apply median filter
median_filtered_image = medfilt2(newimage);
imshow(median_filtered_image);
