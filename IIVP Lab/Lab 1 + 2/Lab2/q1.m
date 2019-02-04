img=imread('flower.jpg');
subplot(2,3,1);
imshow(img);
title('Input ');


img1=img;

for row=1:size(img,1)
    for col=1:size(img,2)
        img1(row,col,:)=255-img(row,col,:);
    end
end
subplot(2,3,2);
imshow(img1);
title('Negative');

img2=img;
c=100;
for row=1:size(img,1)
    for col=1:size(img,2)
        m=double(img(row,col,:));
        img2(row,col,:)=c.*log10(1+m);
        
    end
end
subplot(2,3,3);
imshow(img2);
title('Log');

img3=im2double(img);
x=img3;
f=2;
[r,c]=size(img3);
for i=1:r
    for j=1:c
        
        x(i,j)=exp(img3(i,j)^f)-1;
        
    end
end
subplot(2,3,4);
imshow(x);
title('Inverse-Log');



img4=im2double(img);
x2=img4;
f=0.3;
cons=10;
[r,c]=size(img4);
for i=1:r
    for j=1:c
        
        x2(i,j)=cons*(img4(i,j)^f);
        
    end
end
subplot(2,3,5);
imshow(x2);
title('Gamma');






