%% ADD topictoolbox to path first please Thanks

clear all; close all; clc;

disp('Loading files');

WS_DS = csvread('WSDS.csv');
filename = 'wordList.csv';
ImportVocab;
sortDoc = sortrows(WS_DS,2).';

WS = sortDoc(1,:);
DS = sortDoc(2,:);

%% SET T for # of Topics
T = 50; 
BETA = 0.01; 
ALPHA = 50/T;
N = 50; 
SEED = 3;
OUTPUT = 1; 

disp('Run GibbsSamplerLDA');
[ WP,DP,Z ] = GibbsSamplerLDA( WS , DS , T , N , ALPHA , BETA , SEED , OUTPUT);

%% Choose Top 5
[S] = WriteTopics( WP , BETA , WO , 5 , 0.7, 4 ,'mytopics.txt' );

disp('Most likely words...')
S(1:50)

% Word by topic matrix, transpose to get topic by word
WP(155366,50)