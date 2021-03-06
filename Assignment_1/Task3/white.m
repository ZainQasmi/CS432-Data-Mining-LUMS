%% Import data from text file.
% Script for importing data from the following text file:
%
%    C:\Users\zainq\Google Drive\Spring 2017\Data Mining\assignment1\Task4\winequality-white.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2017/02/18 22:45:01

%% Initialize variables.
filename = 'C:\Users\zainq\Google Drive\Spring 2017\Data Mining\assignment1\Task4\winequality-white.csv';
delimiter = ';';
startRow = 2;

%% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
fixedacidity1 = dataArray{:, 1};
volatileacidity1 = dataArray{:, 2};
citricacid1 = dataArray{:, 3};
residualsugar1 = dataArray{:, 4};
chlorides1 = dataArray{:, 5};
freesulfurdioxide1 = dataArray{:, 6};
totalsulfurdioxide1 = dataArray{:, 7};
density1 = dataArray{:, 8};
pH1 = dataArray{:, 9};
sulphates1 = dataArray{:, 10};
alcohol1 = dataArray{:, 11};
quality1 = dataArray{:, 12};


%% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;