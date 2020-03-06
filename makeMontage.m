function makeMontage(fileName, nDisplay)
% Make a montage from data in a file.
% specify filename
% specify the number of slices to display from start to end
% makeMontage('~/data/subject-C/mprage.nii.gz', 20)

% load image
data = niftiread(fileName);

% Figure out indices
nSlices = size(data, 3);
idx = round(linspace(1, nSlices, nDisplay)); % to avoid decimal numbers and get integers

% Robust range
robustRange = prctile(data(:), [5,95]);

% Permute the axes
% TODO: choice for permutation works for the image here. There can be a
% generic solution to the same.
dataP = permute(data, [2,1,3]);

% Make a montage wih the command
montage(dataP, 'Indices', idx, 'DisplayRange', robustRange);
end