%Find 1D Template
signal = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
template = [1 1 0];
disp('Signal:'), disp([1:size(signal,2); signal]);
disp('Template:'), disp([1:size(template,2); template]);
find_template_1D(template, signal);


function index = find_template_1D(t, s)
    %We use normalised cross correlation here
    nxc = normxcorr2(t, s);
    [~, rawIndex] = max(nxc);
    index = rawIndex - size(t, 2) + 1;
    disp("The Index where the template(filter) matches the signal most is at:");
    disp(index);
end
