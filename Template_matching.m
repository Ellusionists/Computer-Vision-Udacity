%Find 1D Template
signal = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
template = [1 1 0];
disp('Signal:'), disp([1:size(signal,2); signal]);
disp('Template:'), disp([1:size(template,2); template]);
find_template_1D(template, signal);


function index = find_template_1D(t, s)
    %We use normalised cross correlation here
    nxc = normxcorr2(t, s);
    %The normxcorss function doesn't return the index where matching begins
    %Rather it returns the index where matching ends
    [~, rawIndex] = max(nxc);
    %Hence, we need to extract a raw index from nxc
    %And then subtract the size of filter(template) and add 1 to get the
    %final output index
    index = rawIndex - size(t, 2) + 1;
    disp("The Index where the template(filter) matches the signal most is at:");
    disp(index);
end
