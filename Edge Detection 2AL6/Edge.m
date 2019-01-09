frizzy  = imread('Frizzy.png');
froomer = imread('Froomer.png');

%% Finding edge in images
% Step 1: Convert image to grayscale
frizzy_gray  = rgb2gray(frizzy);
froomer_gray = rgb2gray(froomer);

%Step 2: Find Edges
frizzy_edge  = edge(frizzy_gray, 'canny');
froomer_edge = edge(froomer_gray, 'canny');

%% Display the hidden code
%To find the hidden code, we add the two images by using &(ampersand)
%operator, as the two images are binary.
imshow(frizzy_edge & froomer_edge);
%The result is 007