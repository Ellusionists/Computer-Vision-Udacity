%% Average Filter
img1 = imread('AE.jpg');
filtered = average_filter(img1);

imshow(uint8(filtered));
title("New");

%% FUNCTIONS 

function [filtered_img] = average_filter(input_image)
    [m,n] = size(input_image);
    filtered_img = zeros(m,n);
    for i = 1:m-2
        for j = 1:n-2
              filtered_img(i+1, j+1) = mean2(input_image(i:i+2, j:j+2));
              filtered_img = uint8(filtered_img);
        end
    end
end
