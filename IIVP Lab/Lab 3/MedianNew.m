img1 = imread('AE.jpg');
img2 = imread("barbara.png");
I = img2;


[height, width] = size(I);
median = [1,2,3,4,5,6];
med_holder = 1;

for i = 2:height - 1
    for j = 2:width - 1
        mask = I(i-1:i+1, j-1:j+1);
        median = sort(mask);
        med_holder = median(4);
%         med_holder = median(6); %To test if function is working
        I2(i, j) = uint8(med_holder);
    end
end

subplot(1,2,1)
imshow(I);
title("Original Image");
subplot(1,2,2)
imshow(I2);
title("Median Image");