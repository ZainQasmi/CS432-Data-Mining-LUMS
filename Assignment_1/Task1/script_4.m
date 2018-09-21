%% BOXPLOT

innings_concat = vertcat(innings1,innings2);
innings_run_concat = vertcat(innings1_runs, innings2_runs);

FigHandle = figure('Position', [0, 0, 1366, 768]);

% idioticTemp = top5teams{2};
% top5teams{2} = top5teams{4};
% top5teams{4} = idioticTemp;

%% SCORES BOXPLOT
team1 = [];team2 = [];team3 = [];team4 = [];team5 = [];
for i=1:length(innings_concat)
    tempStr = cell2mat(top5teams{1});
    if strcmp(tempStr, innings_concat{i})
        team1(end+1) = innings_run_concat(i);
    end
    tempStr = cell2mat(top5teams{2});
    if strcmp(tempStr, innings_concat{i})
        team2(end+1) = innings_run_concat(i);
    end
    tempStr = cell2mat(top5teams{3});
    if strcmp(tempStr, innings_concat{i})
        team3(end+1) = innings_run_concat(i);
    end
    tempStr = cell2mat(top5teams{4});
    if strcmp(tempStr, innings_concat{i})
        team4(end+1) = innings_run_concat(i);
    end
    tempStr = cell2mat(top5teams{5});
    if strcmp(tempStr, innings_concat{i})
        team5(end+1) = innings_run_concat(i);
    end
    
end


subplot(5,5,1);
boxplot(team1,'colors','b','positions',1);
subplot(5,5,2);
boxplot(team2,'colors','b','positions',2);
subplot(5,5,3);
boxplot(team3,'colors','b','positions',3);
subplot(5,5,4);
boxplot(team4,'colors','b','positions',4);
subplot(5,5,5);
boxplot(team5,'colors','b','positions',5);

histT1 = team1;
histT2 = team2;

%% SCORES PLAYING FIRST
team1 = [];team2 = [];team3 = [];team4 = [];team5 = [];

for i=1:length(innings1)
    tempStr = cell2mat(top5teams{1});
    if strcmp(tempStr, innings1{i})
        team1(end+1) = innings1_runs(i);
    end
    tempStr = cell2mat(top5teams{2});
    if strcmp(tempStr, innings1{i})
        team2(end+1) = innings1_runs(i);
    end
    tempStr = cell2mat(top5teams{3});
    if strcmp(tempStr, innings1{i})
        team3(end+1) = innings1_runs(i);
    end
    tempStr = cell2mat(top5teams{4});
    if strcmp(tempStr, innings1{i})
        team4(end+1) = innings1_runs(i);
    end
    tempStr = cell2mat(top5teams{5});
    if strcmp(tempStr, innings1{i})
        team5(end+1) = innings1_runs(i);
    end
    
end

subplot(5,5,6);
boxplot(team1,'colors','b','positions',1);
subplot(5,5,7);
boxplot(team2,'colors','b','positions',2);
subplot(5,5,8);
boxplot(team3,'colors','b','positions',3);
subplot(5,5,9);
boxplot(team4,'colors','b','positions',4);
subplot(5,5,10);
boxplot(team5,'colors','b','positions',5);

%% SCORES PLAYING SECOND
team1 = [];team2 = [];team3 = [];team4 = [];team5 = [];

for i=1:length(innings2)
    tempStr = cell2mat(top5teams{1});
    if strcmp(tempStr, innings2{i})
        team1(end+1) = innings2_runs(i);
    end
    tempStr = cell2mat(top5teams{2});
    if strcmp(tempStr, innings2{i})
        team2(end+1) = innings2_runs(i);
    end
    tempStr = cell2mat(top5teams{3});
    if strcmp(tempStr, innings2{i})
        team3(end+1) = innings2_runs(i);
    end
    tempStr = cell2mat(top5teams{4});
    if strcmp(tempStr, innings2{i})
        team4(end+1) = innings2_runs(i);
    end
    tempStr = cell2mat(top5teams{5});
    if strcmp(tempStr, innings2{i})
        team5(end+1) = innings2_runs(i);
    end
    
end

subplot(5,5,11);
boxplot(team1,'colors','b','positions',1);
subplot(5,5,12);
boxplot(team2,'colors','b','positions',2);
subplot(5,5,13);
boxplot(team3,'colors','b','positions',3);
subplot(5,5,14);
boxplot(team4,'colors','b','positions',4);
subplot(5,5,15);
boxplot(team5,'colors','b','positions',5);

%% SCORES PLAYING HOME
team1 = [];team2 = [];team3 = [];team4 = [];team5 = [];

for i=1:length(home1)
    
    inn1 = cell2mat(innings1(i));
    inn2 = cell2mat(innings2(i));

    tempStr = cell2mat(top5teams{1});
    if strcmp(tempStr, home1{i})
        if strcmp(tempStr, inn1)
            team1(end+1) = innings1_runs(i);
        else
            team1(end+1) = innings2_runs(i);
        end
    end
    tempStr = cell2mat(top5teams{2});
    if strcmp(tempStr, home1{i})
        if strcmp(tempStr, inn1)
            team2(end+1) = innings1_runs(i);
        else
            team2(end+1) = innings2_runs(i);
        end
    end
    tempStr = cell2mat(top5teams{3});
    if strcmp(tempStr, home1{i})
        if strcmp(tempStr, inn1)
            team3(end+1) = innings1_runs(i);
        else
            team3(end+1) = innings2_runs(i);
        end
    end
    tempStr = cell2mat(top5teams{4});
    if strcmp(tempStr, home1{i})
        if strcmp(tempStr, inn1)
            team4(end+1) = innings1_runs(i);
        else
            team4(end+1) = innings2_runs(i);
        end
    end
    tempStr = cell2mat(top5teams{5});
    if strcmp(tempStr, home1{i})
        if strcmp(tempStr, inn1)
            team5(end+1) = innings1_runs(i);
        else
            team5(end+1) = innings2_runs(i);
        end
    end
    
end

subplot(5,5,16);
boxplot(team1,'colors','b','positions',1);
subplot(5,5,17);
boxplot(team2,'colors','b','positions',2);
subplot(5,5,18);
boxplot(team3,'colors','b','positions',3);
subplot(5,5,19);
boxplot(team4,'colors','b','positions',4);
subplot(5,5,20);
boxplot(team5,'colors','b','positions',5);


%% SCORES PLAYING AWAY
team1 = [];team2 = [];team3 = [];team4 = [];team5 = [];

for i=1:length(away)
    
    inn1 = cell2mat(innings1(i));
    inn2 = cell2mat(innings2(i));
    
    tempStr = cell2mat(top5teams{1});
    if strcmp(tempStr, away{i})
        if strcmp(tempStr, inn1)
            team1(end+1) = innings1_runs(i);
        else
            team1(end+1) = innings2_runs(i);
        end
    end
    tempStr = cell2mat(top5teams{2});
    if strcmp(tempStr, away{i})
        if strcmp(tempStr, inn1)
            team2(end+1) = innings1_runs(i);
        else
            team2(end+1) = innings2_runs(i);
        end
    end
    tempStr = cell2mat(top5teams{3});
    if strcmp(tempStr, away{i})
        if strcmp(tempStr, inn1)
            team3(end+1) = innings1_runs(i);
        else
            team3(end+1) = innings2_runs(i);
        end
    end
    tempStr = cell2mat(top5teams{4});
    if strcmp(tempStr, away{i})
        if strcmp(tempStr, inn1)
            team4(end+1) = innings1_runs(i);
        else
            team4(end+1) = innings2_runs(i);
        end
    end
    tempStr = cell2mat(top5teams{5});
    if strcmp(tempStr, away{i})
        if strcmp(tempStr, inn1)
            team5(end+1) = innings1_runs(i);
        else
            team5(end+1) = innings2_runs(i);
        end
    end
    
end

subplot(5,5,21);
boxplot(team1,'colors','b','positions',1);
title('Team 1 - Away');
subplot(5,5,22);
boxplot(team2,'colors','b','positions',2);
title('Team 2 - Away');
subplot(5,5,23);
boxplot(team3,'colors','b','positions',3);
title('Team 3 - Away');
subplot(5,5,24);
boxplot(team4,'colors','b','positions',4);
title('Team 4 - Away');
subplot(5,5,25);
boxplot(team5,'colors','b','positions',5);
title('Team 5 - Away');