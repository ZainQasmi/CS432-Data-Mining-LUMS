%% Housekeeping

clear all;
close all; 
clc;

%% Import Data

nips_import; %first three rows removed
vocab_import;

%% (a) Create Matrix

sparseMatrix = [docID wID count];
tupleMatrix = spconvert(sparseMatrix);
denseMatrix = full(tupleMatrix);

net_length = length(denseMatrix(:,1));
cosine_matrix = zeros(net_length);

%% (b) (i) K-means

DEFINE_K = 10;
kmeans_computed = kmeans(denseMatrix, DEFINE_K, 'Distance', 'Cosine');

%% (b) (i) NNMF

[NNMFout,DEFINE_K] = nnmf(denseMatrix,2);

%% (c) Plot SSE against number of cluters, k



%% (d) top 5 in each cluster at K = 10

for i=1:length(kmeans_computed)
    kmeans_computed(i,2) = i;
end

kmeans_computed_sorted = sortrows(kmeans_computed, 1);

% Initilize
clusterSum = 0;
clusterSumList = [];

for i=1:length(kmeans_computed_sorted)
    if (kmeans_computed_sorted(i,1) == clusterSum)
        clusterSumList = clusterSumList + denseMatrix(i,:);
    else
        clusterSum =clusterSum + 1;
        if (clusterSum ~= 1)
            toDisp = ['common cluster words: ', num2str(clusterSum-1)];
            disp(toDisp);
            netCluster = [1:length(datArr); clusterSumList];
            netCluster = transpose(netCluster);
            netCluster = sortrows(netCluster, [-2]);
            top5 = [(datArr(netCluster(1,1))) (datArr(netCluster(2,1))) (datArr(netCluster(3,1))) (datArr(netCluster(4,1))) (datArr(netCluster(5,1)))];
            disp(top5);
        end
        clusterSumList = denseMatrix(i,:);
    end
end