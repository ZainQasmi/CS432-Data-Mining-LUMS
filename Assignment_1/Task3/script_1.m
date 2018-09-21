clear all; close all; clc;
adult
red
white

ALL_RED = [alcohol chlorides citricacid density fixedacidity freesulfurdioxide pH quality residualsugar sulphates totalsulfurdioxide volatileacidity];
ALL_WHITE = [alcohol1 chlorides1 citricacid1 density1 fixedacidity1 freesulfurdioxide1 pH1 quality1 residualsugar1 sulphates1 totalsulfurdioxide1 volatileacidity1];


COMBINED = [ALL_RED; ALL_WHITE];
% COMBINED = [ [alcohol chlorides citricacid density fixedacidity freesulfurdioxide pH quality residualsugar sulphates totalsulfurdioxide volatileacidity]; [alcohol1 chlorides1 citricacid1 density1 fixedacidity1 freesulfurdioxide1 pH1 quality1 residualsugar1 sulphates1 totalsulfurdioxide1 volatileacidity1] ];

%% Part - a
CORRELATION = corrcoef(COMBINED);
% CORRELATION_WHITE = corrcoef(ALL_WHITE);

CORRELATION_QUALITY = CORRELATION(:,8);

CORRELATION_QUALITY(1); % ALCOHOL HAS MAX CORRELATION WITH QUALITY

%% Part - b ...ALL FRIKKING AUC's
f = figure('position',[0 0 1366 768]);

ALL_RED = [alcohol chlorides citricacid density fixedacidity freesulfurdioxide pH quality residualsugar sulphates totalsulfurdioxide volatileacidity ones(length(alcohol), 1) zeros(length(alcohol), 1)];
ALL_WHITE = [alcohol1 chlorides1 citricacid1 density1 fixedacidity1 freesulfurdioxide1 pH1 quality1 residualsugar1 sulphates1 totalsulfurdioxide1 volatileacidity1 zeros(length(alcohol1), 1) ones(length(alcohol1), 1)];
COMBINED_COLOR = [ALL_RED; ALL_WHITE];
CORRELATION_COLOR = corrcoef(COMBINED_COLOR);

CORRELATION_RED = CORRELATION_COLOR(:,13);

CORRELATION_RED(12); % 	

%% ALCOHOL - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [alcohol ones(length(alcohol), 1)] ; [alcohol1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,1)
scatter(pos, F_pos);
title({'Alcohol', trapz(pos, -1./F_pos) })
xlabel('Positive')
ylabel('False Positive')

%% CHLORIDES - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [chlorides ones(length(alcohol), 1)] ; [chlorides1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,2);
scatter(pos, F_pos);
title({'Chlorides', trapz(pos, -1./F_pos) })
xlabel('Positive')
ylabel('False Positive')

%% CITRICACID - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [citricacid ones(length(alcohol), 1)] ; [citricacid1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,3);
scatter(pos, F_pos);
title({'Citric Acid', trapz(pos, -1./F_pos) })
xlabel('Positive')
ylabel('False Positive')

%% DENSITY - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [density ones(length(alcohol), 1)] ; [density1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,4);
scatter(pos, F_pos);
title({'Density', trapz(pos, -1./F_pos) })
xlabel('Positive')
ylabel('False Positive')

%% FIXED ACIDITY - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [fixedacidity ones(length(alcohol), 1)] ; [fixedacidity1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,5);
scatter(pos, F_pos);
title({'Fixed Acidity', trapz(pos, -1./F_pos) })
xlabel('Positive')
ylabel('False Positive')

%% Free Sulphur Dioxide - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [freesulfurdioxide ones(length(alcohol), 1)] ; [freesulfurdioxide1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,6);
scatter(pos, F_pos);
title({'Free Sulfur Dioxide', trapz(pos, -1./F_pos) })
xlabel('Positive')
ylabel('False Positive')

%% new figure
f2 = figure('position', [0 0 1366 768]);

%% pH - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [pH ones(length(alcohol), 1)] ; [pH1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,1);
scatter(pos, F_pos);
title({'pH', trapz(pos, -1./F_pos) })
xlabel('Positive')
ylabel('False Positive')

%% Quality - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [quality ones(length(alcohol), 1)] ; [quality1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,2);
scatter(pos, F_pos);
title('Quality')
xlabel('Positive')
ylabel({'False Positive', trapz(pos, -1./F_pos) })

%% Residual Sugar - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [residualsugar ones(length(alcohol), 1)] ; [residualsugar1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,3);
scatter(pos, F_pos);
title({'Residual Sugar', trapz(pos, -1./F_pos) })
xlabel('Positive')
ylabel('False Positive')

%% Suplhates - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [sulphates ones(length(alcohol), 1)] ; [sulphates1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,4);
scatter(pos, F_pos);
title({'Sulphates', trapz(pos, -1./F_pos) })
xlabel('Positive')
ylabel('False Positive')

%% total Sulphir Dioxide - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [totalsulfurdioxide ones(length(alcohol), 1)] ; [totalsulfurdioxide1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,5);
scatter(pos, F_pos);
title({'Total Sulphur Dioxide', trapz(pos, -1./F_pos) });
xlabel('Positive');
ylabel('False Positive');

%% Volatile Acidity - RED
pos = [];
F_pos = [];
AUC_FILTER = [ [volatileacidity ones(length(alcohol), 1)] ; [volatileacidity1 zeros(length(alcohol1),1)] ];
counter = 1;
for j = 0:0.001:1
    for k = 1:length(AUC_FILTER)
        AUC_FILTER(k, 3) = AUC_FILTER(k, 1) > j;
        AUC_FILTER(k, 4) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 1;
        AUC_FILTER(k, 5) = AUC_FILTER(k, 3) == 1 && AUC_FILTER (k, 2) == 0;
    end
    pos(counter) = sum ( sum ( AUC_FILTER(:,4) ) ) / length(AUC_FILTER);
    F_pos(counter) = sum ( sum( AUC_FILTER(:,5) ) ) / length(AUC_FILTER);
    counter = counter+1;
end
counter = 1;
subplot(2,3,6);
scatter(pos, F_pos);
title({'Volatile Acidity AUC', trapz(pos, -1./F_pos) });
xlabel('Positive');
ylabel('False Positive');

%% Part - c

% Import_Adult;
[table,chiVal,pval] = crosstab(income_class, sex);
chiVal



