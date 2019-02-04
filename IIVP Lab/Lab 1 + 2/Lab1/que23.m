A = imread('new_pic.jpg');
B = rgb2gray(A);
CC = bwconncomp(B);
