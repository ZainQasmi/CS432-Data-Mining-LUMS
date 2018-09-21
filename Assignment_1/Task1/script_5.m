%% SCORES PLAYING AWAY
team1 = [];team2 = [];team3 = [];team4 = [];team5 = [];
counter1 = 0;
counter2 = 0;
counter3 = 0;
counter4 = 0;
counter5 = 0;
for i=1:length(away)
    
    isHome = cell2mat(home1(i));
    isAway = cell2mat(away(i));
    winn = cell2mat(winner(i));
    
    tempStr = cell2mat(top5teams{1});
    if strcmp(tempStr, isHome) || strcmp(tempStr, isAway)
        if strcmp(tempStr, winn)
             counter1 = counter1 + 1;
             team1(end+1) = counter1;
        else
            counter1 = counter1 - 1;
             team1(end+1) = counter1;
        end
    end
    
        tempStr = cell2mat(top5teams{2});
    if strcmp(tempStr, isHome) || strcmp(tempStr, isAway)
        if strcmp(tempStr, winn)
             counter2 = counter2 + 1;
             team2(end+1) = counter2;
        else
            counter2 = counter2 - 1;
             team2(end+1) = counter2;
        end
    end
    
        tempStr = cell2mat(top5teams{3});
    if strcmp(tempStr, isHome) || strcmp(tempStr, isAway)
        if strcmp(tempStr, winn)
             counter3 = counter3 + 1;
             team3(end+1) = counter3;
        else
            counter3 = counter3 - 1;
             team3(end+1) = counter3;
        end
    end
    
        tempStr = cell2mat(top5teams{4});
    if strcmp(tempStr, isHome) || strcmp(tempStr, isAway)
        if strcmp(tempStr, winn)
             counter4 = counter4 + 1;
             team4(end+1) = counter4;
        else
            counter4 = counter4 - 1;
             team4(end+1) = counter4;
        end
    end
    
        tempStr = cell2mat(top5teams{5});
    if strcmp(tempStr, isHome) || strcmp(tempStr, isAway)
        if strcmp(tempStr, winn)
             counter5 = counter5 + 1;
             team5(end+1) = counter5;
        else
            counter5 = counter5 - 1;
             team5(end+1) = counter5;
        end
    end
end

%% TREND GRAPH
f1 = figure;
plot([1:length(team1)], team1,'b',[1:length(team2)],team2,'r',[1:length(team3)],team3,'g',[1:length(team4)],team4,'y', [1:length(team5)],team5,'m');
title('team1: blue, team2: red, team3: green, team4: yellow, team5: magenta')
%% histogram Q1 - d
f = figure;
subplot(1,2,1)
histogram(histT1);
title('Team 1 - Scores')
subplot(1,2,2)
histogram(histT2);
title('Team 2 - Scores')

%% scatter plot Q1 - e

tempStr1 = cell2mat(top5teams{1});
tempStr2 = cell2mat(top5teams{2});

tim1_score = [];
tim2_score = [];
tim1_scoreB = [];
tim2_scoreB = [];
winner1 = [];
loser1 = [];
winner2 = [];
loser2 = [];

for i=1:length(home1)
    if strcmp(tempStr1, home1{i}) && strcmp(tempStr2, away{i})
%         if strcmp(tempStr1, winner{i})
%             winner1(end+1) = 1;
%         else
%             
%         end
        
        if strcmp(tempStr1, innings1{i})
            tim1_score(end+1) = innings1_runs(i);
        end
        if strcmp(tempStr2, innings1{i})
            tim2_score(end+1) = innings1_runs(i);
        end
        if strcmp(tempStr1, innings2{i})
            tim1_score(end+1) = innings2_runs(i);
        end
        if strcmp(tempStr2, innings2{i})
            tim2_score(end+1) = innings2_runs(i);
        end
    end
    
    if strcmp(tempStr2, home1{i}) && strcmp(tempStr1, away{i})
        if strcmp(tempStr1, innings1{i})
            tim1_scoreB(end+1) = innings1_runs(i);
        end
        if strcmp(tempStr2, innings1{i})
            tim2_scoreB(end+1) = innings1_runs(i);
        end
        if strcmp(tempStr1, innings2{i})
            tim1_scoreB(end+1) = innings2_runs(i);
        end
        if strcmp(tempStr2, innings2{i})
            tim2_scoreB(end+1) = innings2_runs(i);
        end
    end    
    
end
% close all
f2 = figure;
hold on
scatter(tim1_score,tim2_score,'b','x') % Chennai ka home is blue
scatter(tim1_scoreB,tim2_scoreB,'r') % Mumbai ka home is red
title('Mumbai Home: Red, Chennai Home: Blue')




