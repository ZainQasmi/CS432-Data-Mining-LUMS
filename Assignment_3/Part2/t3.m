%% Housekeeping

clear all;
close all; 
clc;

%% Import Data

nips_import;
vocab_import;

%% Create Dense Matrix

sparseMatrix = [DocumentID WordID CountInDoc];
tupleMatrix = spconvert(sparseMatrix);
denseMatrix = full(tupleMatrix);

net_length = length(denseMatrix(:,1));
cosine_matrix = zeros(net_length);

for i=1:net_length
    for j=1:net_length
        if (i==j)
            cosine_matrix(i,j) = 0;
        elseif (i > j)
            cosine_matrix(i,j) = dot(denseMatrix(i,:),denseMatrix(j,:)) / (norm(denseMatrix(i,:)) * norm(denseMatrix(j,:)));
            cosine_matrix(j,i) = cosine_matrix(i,j);
        end
    end
end

