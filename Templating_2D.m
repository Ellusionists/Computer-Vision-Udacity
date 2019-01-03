img = imread('tablet.png');
% imshow(img);
glyph = img(75:165, 150:185);
% imshow(glyph);

%The glyph is taken from points starting at 75,150 and thus the answered
%returned by this function must also be the same.
[y, x] = find_2d_template(glyph, img);
disp([y, x]);

%Plot the location of template.
colormap('gray'), imagesc(img); %image with scaled colors
hold on;
% plot(x, y, 'r+', 'markersize', 16);
%Plotting polygon(rectangle) to highlight the area used as filter.
pgon = polyshape([x, x, x+size(glyph, 2),x+size(glyph, 2)],[y, y+size(glyph,1),y+size(glyph,1), y]);
plot(pgon,'FaceColor','red','FaceAlpha',0.1)
hold off;

function [yIndex, xIndex] = find_2d_template(template, img)
    c = normxcorr2(template, img);
    %We use c(:) because intially c is a 2D array, and max would just give
    %us the maximum from the columns. By using `:`, we flatted out the
    %array and then find the maximum. `FIND` returns the row and column of
    %each element from c
    [yRaw, xRaw] = find(c == max(c(:)));
    yIndex = yRaw - size(template,1) +1;
    xIndex = xRaw - size(template,2) +1;
    %Changing the raw coordinates to obtain the desired answer.
end
