%% HouseKeeping
clear all; close all; clc;

%% Initializing Variables
delimiter = '\t';
startRow = 2;
formatSpec = '%q%q%f%f%q%[^\n\r]';

num_positive = 0;
num_negative = 0;
accuracy = 0;
false_negative = 0;
error_reading_files = 0;
sent_array = [];

%% Import and Processing
for i=1:1000
    filename = strcat('senti_results_neg\1 (',num2str(i),').txt');
    fileID = fopen(filename,'r');
    try
        dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);
        fclose(fileID);
        Positive = dataArray{:, 3};
        Negative = dataArray{:, 4};
        score = sum(Positive) - sum(Negative);
        sent_array = [sent_array score];
        if (score > 0)
            num_positive = num_positive + 1;
        elseif (score < 0)
            num_negative = num_negative + 1;
        end
    catch
            error_reading_files = error_reading_files + 1;
%         disp(strcat('Error reading file=',num2str(i)));
    end
end

%% Print Results
accuracy = (num_negative/1000) * 100;
false_negative = (num_positive/1000) * 100;

disp(strcat('Error reading files :: ',num2str(error_reading_files)));
disp(strcat('Accuracy :: ',num2str(accuracy)));
disp(strcat('False Negatives :: ',num2str(false_negative)));

boxplot(sent_array);

% clearvars filename delimiter startRow formatSpec fileID dataArray ans;