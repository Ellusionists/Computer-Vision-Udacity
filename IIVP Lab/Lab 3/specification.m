%% Reading Images
img1 = imread('barbara.png');
img2 = imread('AE.jpg');

%% Equilization

%Choose the image to equilize
I = img2;

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
subplot(1,2,1)
imshow(I)
title('Equilized Image')


%% Specification

pixelLocations = [105, 103, 152, 185, 255];
newPixels = [200000, 50000, 5124, 2457, 4563];

% Equilizing new historgram

sizeNewHist = 262114; % Sum on frequencies
NewProbPixel = zeros(1,5);
for i = 1:5
    NewProbPixel(i) = newPixels(i) / 262114.0;
end

NewCumuPixel = zeros(1,5);
for i = 1:5
    if i == 1
        NewCumuPixel(i) = NewProbPixel(i);
    else
        NewCumuPixel(i) = NewCumuPixel(i-1) + NewProbPixel(i);
    end
end

NewMap = zeros(1,256);

min = 1002003;
location = 0;

for i = 1:256
    for j = 1:5
        if(abs(double(CumuPixel(i) - NewCumuPixel(j))) < min)
            min = abs(double(CumuPixel(i) - NewCumuPixel(j)));
            location = j;
        end
    end
    NewMap(i) = pixelLocations(location);
end

I2 = I;
for i = 1:height
    for j = 1:width
        I(i, j) = NewMap(I(i, j));
    end
end

subplot(1,2,2)
imshow(img2);