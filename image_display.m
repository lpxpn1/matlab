% Thinking about image display
% Preliminaries
% Some useful commands
% 1. REading nifti files:
% niftoread()
% niftiinfo()

% Function for displaying 3d data: volumeViewer()

% 2. Displaying images
% image() % axis / image orientation
% imagesc() % display intensity images with weird ranges
% returnSlice() - a previous function

% Plan for montage
% montage()
% - Given a 3d array of data, how to display with function montage()?
% - change which images / slices are being displayed?
% - how to change the range of colours that are displayed.

% Create data
% - make a 3d array with some random numbers
% - some built-in datasets in matlab

%load MRI % load the MRI dataset. This reads into D which is a 4D array

% Convert the 4D dataset into 3D
%D_3d = squeeze(D);

% Histogram of the data
%histogram(D_3d(:)); % stretch the 3d array into a single array of values

% Display range of intensities where the histogram is mostly concentrated.
%montage(D_3d, 'DisplayRange', [40,80]);

% Load the actual data with niftiread
fname = '~/data/subject-C/mprage.nii.gz';
data = niftiread(fname);

montage(data);

% Get the number of slices. The last number in the size
nSlices = size(data, 3);
nDisplay = 25; % The number of images to display
idx = round(linspace(1, nSlices, nDisplay)); % to avoid decimal numbers and get integers
montage(data, 'Indices', idx);

% Now fix the display range
% Find 5 / 95 percentile that gives a better value for low and high points
% for colormap
robustRange = prctile(data(:), [5,95]);
montage(data, 'Indices', idx, 'DisplayRange', robustRange);

%% Weird orientation: Change the dimensions / permute the dimensions
% Swapping the x and y axes so that the images are properly oriented
dataP = permute(data, [2,1,3]);
montage(dataP, 'Indices', idx, 'DisplayRange', robustRange);