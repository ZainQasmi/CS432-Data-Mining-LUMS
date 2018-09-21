%% Load Data
red
white
%% Initialization
close all
clc
%% Question 4 - a
f1 = figure('Position', [0, 0, 1366, 768]);
hold on
scatterRed = scatter(alcohol - mean(alcohol), chlorides - mean(chlorides),'r');
scatterWhite = scatter(alcohol1 - mean(alcohol1), chlorides1 - mean(chlorides1),'b');
%% Question 4 - b
f2 = figure('Position', [0, 0, 1366, 768]);
hold on
scatter(zscore(alcohol),zscore(chlorides),'r');
scatter(zscore(alcohol1),zscore(chlorides1),'b');
%% Question 4 - c

f3 = figure('Position', [0, 0, 1366, 768]);
hold on
ALL_MATRIX_RED = [alcohol chlorides citricacid density fixedacidity freesulfurdioxide pH quality residualsugar sulphates totalsulfurdioxide volatileacidity];
ALL_MATRIX_WHITE = [alcohol1 chlorides1 citricacid1 density1 fixedacidity1 freesulfurdioxide1 pH1 quality1 residualsugar1 sulphates1 totalsulfurdioxide1 volatileacidity1];

subplot(2,1,1)
[COEFF_R,SCORE_R] = pca(ALL_MATRIX_RED, 'NumComponents', 2);
scatterPCA_red = scatter(SCORE_R(:,1),SCORE_R(:,2),'r');
subplot(2,1,2)
[COEFF_W,SCORE_W] = pca(ALL_MATRIX_WHITE, 'NumComponents', 2);
scatterPCA_white = scatter(SCORE_W(:,1),SCORE_W(:,2),'b');
 

%% Question 4 - d

f4 = figure('Position', [0, 0, 1366, 768]);
hold on
[NNMF_RED,H_r] = nnmf(ALL_MATRIX_RED,2);
subplot(2,1,1)
scatterNNMF_red = scatter(NNMF_RED(:,1),NNMF_RED(:,2),'r');
[NNMF_WHITE,H_w] = nnmf(ALL_MATRIX_WHITE,2);
subplot(2,1,2)
scatterNNMF_white = scatter(NNMF_WHITE(:,1),NNMF_WHITE(:,2),'b');

%% Question 4 - e

f5 = figure('Position', [0, 0, 1366, 768]);
hold on
[lambda_red,psi_red] = factoran(ALL_MATRIX_RED,2);
% subplot(2,1,1)
% scatter_factoran_red = scatter(lambda_red(:,1),lambda_red(:,2),'r');
biplot(lambda_red,'LineWidth',2,'MarkerSize',20,'Color','r')

[lambda_white,psi_white] = factoran(ALL_MATRIX_WHITE,2);
% subplot(2,1,2)
% scatter_factoran_white = scatter(lambda_white(:,1),lambda_white(:,2),'b');
biplot(lambda_white,'LineWidth',2,'MarkerSize',20,'Color','b')

%% Question 4 - f






