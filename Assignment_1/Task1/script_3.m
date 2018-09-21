%% INITIALIZATION

clc
close all

%% DATA CLEANING
% N0 = length(winner);
cleaned_winners = winner;
for i=1:length(winner)
    if ~isempty(findstr('Match',winner{i})) || ~isempty(strfind('No result',winner{i}))
        cleaned_winners{i} = '';
    end    
end
cleaned_winners(cellfun('isempty',regexprep(cleaned_winners,'^-.*',''))) = [];
%  cleaned_winners(strcmp('',cleaned_winners))

%% FINDING UNIQUES
ALL_TEAMS = unique(transpose(horzcat(transpose(unique(home1)), transpose(unique(away)))));
ALL_CITIES = unique(venue);

[unique_winners, ~, J]=unique(cleaned_winners) ;
unique_winners_count = histc(J, 1:numel(unique_winners));
 
%% MERGING
mrg = {unique_winners unique_winners_count};
unique_winners_doubles =  cell2mat(mrg(2));
unique_winners_chars = char(unique_winners);

% N = length(unique_winners);
winners_concat = cell(length(unique_winners),2);
for i=1:length(unique_winners)
    winners_concat{i,1} = unique_winners_chars(i,:);
    winners_concat{i,2} = unique_winners_doubles(i);
end

%% TOP FIVE
[sortedValues,sortIndex] = sort(unique_winners_doubles(:),'descend');  %# Sort the values in descending order
top5index = sortIndex(1:5);  %# Get a linear index into A of the 5 largest values

sortedValues = unique(unique_winners_doubles(:));          %# Unique sorted values
winCount = sortedValues(end-4:end);                         %# Get the 5 largest values
top5index = ismember(unique_winners_doubles,winCount);     %# Get a logical index of all values
                                      %#   equal to the 5 largest values
top5teams = cell(5,1);

for i = 1:length(unique_winners)
    if winCount(5) == unique_winners_doubles(i)
        top5teams{1,1} = unique_winners(i);
    end
    if winCount(4) == unique_winners_doubles(i)
        top5teams{2,1} = unique_winners(i);
    end
    if winCount(3) == unique_winners_doubles(i)
        top5teams{3,1} = unique_winners(i);
    end
    if winCount(2) == unique_winners_doubles(i)
        top5teams{4,1} = unique_winners(i);
    end
    if winCount(1) == unique_winners_doubles(i)
        top5teams{5,1} = unique_winners(i);
    end
end


%% BOXPLOT

% innings_concat = vertcat(innings1,innings2);
% innings_run_concat = vertcat(innings1_runs, innings2_runs);
% 
% % data = cell2mat(top5teams);
% counter = 1;
% team1 = [];team2 = [];team3 = [];team4 = [];team5 = [];
% for i=1:length(innings_concat)
%     tempStr = cell2mat(top5teams{1});
%     if strcmp(tempStr, innings_concat{i})
%         team1(end+1) = innings_run_concat(i);
%     end
%     tempStr = cell2mat(top5teams{2});
% %     if ~isempty(strfind(tempStr,innings_concat{i}))
%     if strcmp(tempStr, innings_concat{i})
%         team2(end+1) = innings_run_concat(i);
%     end
%     tempStr = cell2mat(top5teams{3});
%     if strcmp(tempStr, innings_concat{i})
%         team3(end+1) = innings_run_concat(i);
%     end
%     tempStr = cell2mat(top5teams{4});
%     if strcmp(tempStr, innings_concat{i})
%         team4(end+1) = innings_run_concat(i);
%     end
%     tempStr = cell2mat(top5teams{5});
%     if strcmp(tempStr, innings_concat{i})
%         team5(end+1) = innings_run_concat(i);
%     end
%     
% end
% 
% teamScores = [team1, team2, team3, team4, team5];
% 
% subplot(1,5,1);
% boxplot(team1,'colors','b','positions',1);
% subplot(1,5,2);
% boxplot(team2,'colors','b','positions',2);
% subplot(1,5,3);
% boxplot(team3,'colors','b','positions',3);
% subplot(1,5,4);
% boxplot(team4,'colors','b','positions',4);
% subplot(1,5,5);
% boxplot(team5,'colors','b','positions',5);
% 
% %
