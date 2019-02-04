in1 = imread('new_pic.jpg');
subplot(2,2,1), imshow(in1);
%in2 = in1(:,end:-1:1,:);
%subplot(2,2,2), imshow(in2);
im1 = imread('new_pic.jpg');
im3 = imresize(im1,[100,200]);
im2 = imread('new_pic.jpg');
im4 = imresize(im2,[100,200]);
H = [im3 im4];
subplot(2,2,3), imshow(H)
V = [im3;im4];
subplot(2,2,4), imshow(V)
