% Project a point from 3D to 2D using a matrix operation

%% Test: Given point and focal length (units: mm)
p = [200 100 50];
f = 50;

%Output -> for z = f, we must get original x,y values as output.
disp(project_points(p, f));


%% Given: Point p in 3-space [x y z], and focal length f
 % Return: Location of projected point on 2D image plane [u v]

function final = project_points(p, f)
    projection_matrix = [f 0 0 0;
                         0 f 0 0;
                         0 0 1 0;];
    pdash = [p 1]'; %SINGLE QUOTE MEANS TRANSPOSE
    p_img = projection_matrix * pdash;
    % Here, f*x/z is being done as p_ing(1) = x and (3) is z/f (as
    % calculated)
    final = [p_img(1)/p_img(3) p_img(2)/p_img(3)];
end