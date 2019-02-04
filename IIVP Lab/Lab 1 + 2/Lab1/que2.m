org_img=imread('new_pic.jpg');

org_img = rgb2gray(org_img);
subplot(1,2,1), imshow(org_img);
[m,n]=size(org_img);
B=org_img;

for i=1:m
    for j=1:n
        B(i,j)=org_img(i,n-j+1);
        
       
    end
end

subplot(1,2,2), imshow(B);
        

       
        
