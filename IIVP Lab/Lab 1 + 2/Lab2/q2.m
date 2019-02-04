clc; 
  

c = imread('flower.jpg'); 
  

cd = double(c); 
  

c1 = mod(cd, 2); 
c2 = mod(floor(cd/2), 2); 
c3 = mod(floor(cd/4), 2); 
c4 = mod(floor(cd/8), 2); 
c5 = mod(floor(cd/16), 2); 
c6 = mod(floor(cd/32), 2); 
c7 = mod(floor(cd/64), 2); 
c8 = mod(floor(cd/128), 2); 
  
  

subplot(3, 5, 1); 
imshow(c); 
title('Original Image'); 
  

subplot(3, 5, 2); 
imshow(c1); 
title('Bit Plane 8'); 
subplot(3, 5, 3); 
imshow(c2); 
title('Bit Plane 7'); 
subplot(3, 5, 4); 
imshow(c3); 
title('Bit Plane 6'); 
subplot(3, 5, 5); 
imshow(c4); 
title('Bit Plane 5'); 
subplot(3, 5, 6); 
imshow(c5); 
title('Bit Plane 4'); 
subplot(3, 5, 7); 
imshow(c6); 
title('Bit Plane 3'); 
subplot(3, 5, 8); 
imshow(c7); 
title('Bit Plane 2'); 
subplot(3, 5, 9); 
imshow(c8); 
title('Bit Plane 1'); 

cc = (2 * (2 * (2 * (2 * (2 * (2 * (2 * c8 + c7) + c6) + c5) + c4) + c3) + c2) + c1); 

subplot(3, 5, 10); 
imshow(uint8(cc)); 
title('Recombined Original Image'); 

  
c71=c7;
c=100;
for row=1:size(c7,1)
    for col=1:size(c7,2)
        m=double(c7(row,col,:));
        c71(row,col,:)=c.*log10(1+m);
        
    end
end
subplot(3, 5, 11); 
imshow(c71); 
title('Modified Bit Plane 2');



c81=im2double(c8);
x=c81;
f=0.01;
[r,c]=size(c81);
for i=1:r
    for j=1:c
        
        x(i,j)=exp(c81(i,j)^f)-1;
        
    end
end
c81=x;
subplot(3, 5, 12); 
imshow(c81); 
title('Modified Bit Plane 1');


cc = (2 * (2 * (2 * (2 * (2 * (2 * (2 * c81 + c71) + c6) + c5) + c4) + c3) + c2) + c1); 


subplot(3, 5, 13); 
imshow(uint8(cc)); 
title('Recombined Image'); 