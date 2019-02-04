%% Reading Images
img1 = imread('barbara.png');
img2 = imread('AE.jpg');

%% Equilization

%Choose the image to equilize
I = img2;

%Checking if rgb. If, then convert to grayscale
[height,width, numberOfColorChannels]=size(img1);
if numberOfColorChannels > 1
  disp(numberOfColorChannels);
  I = rgb2gray(img1);
end

%Displaying image
subplot(1,2,1)
imshow(I)
title('Original Image');

[height,width]=size(I);

%% To form histogram, note down the frequencies
%NOTE: Scale is 0:255, we need to add 1 every time which adding freq.
NumPixel = zeros(1,256);
for i = 1:height
    for j = 1:width
        NumPixel( I(i,j) + 1 ) = NumPixel( I(i,j) + 1 ) + 1;
    end
end

%% Plot histogram
% subplot(_,_,_)
% bar(NumPixel)
% title('NumPixel');

[height,width]=size(I);

%% Finding the probability distribution
ProbPixel = zeros(1,256);
for i = 1:256
    ProbPixel(i) = NumPixel(i) / (height * width * 1.0);
end

% subplot(_,_,_)
% bar(ProbPixel)
% title('ProbPixel');

%% Cummilative Frequency 
CumuPixel = zeros(1,256);
for i = 1:256
    if i == 1
        CumuPixel(i) = ProbPixel(i);
    else
        CumuPixel(i) = CumuPixel(i-1) + ProbPixel(i);
    end
end

% subplot(_,_,_);
% bar(CumuPixel)
% title('CumPixel');

%% Multiplying with scale and rounding off to neartest integer
Map = zeros(1,256);
for i = 1:256
    Map(i) = uint8(255 * CumuPixel(i)+0.5);
end
for i = 1:height
    for j = 1:width
        I(i,j)=Map(I(i,j) + 1);
    end
end

%% Display new image
subplot(1,2,2)
imshow(I)
title('Equilized Image')


%% Specification
NewPixels = zeros(1,256);
NewPixels(106) = 200000;
NewPixels(104) = 50000;
NewPixels(153) = 5124;
NewPixels(186) = 2457;
NewPixels(256) = 4563;

% Equilizing new historgram

sizeNewHist = 262114; % Sum on frequencies
NewProbPixel = zeros(1,256);
for i = 1:256
    NewProbPixel(i) = NewPixels(i) / sizeNewHist;
end
NewCumuPixel = zeros(1,256);
for i = 1:256
    if i == 1
        NewCumuPixel(i) = NewProbPixel(i);
    else
        NewCumuPixel(i) = NewCumuPixel(i-1) + NewProbPixel(i);
    end
end

NewMap = zeros(1,256);
for i = 1:256
    NewMap(i) = uint8(255 * NewCumuPixel(i)+0.5);
end
for i = 1:height
    for j = 1:width
        I(i,j)= NewMap(I(i,j) + 1);
    end
end

imshow(i);