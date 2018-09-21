clear all; 
close all; 
clc;

%% Load Data

SAMPLING_TYPE = 2; % 1 = Stratified
                   % 2 = Random

filename = 'output_lemmatized_TF-IDF.csv';
ImportCSV;
ImportVocab;

lemmatizedTFIDF = [lemmatizedTFIDF; [ones(1,1000) zeros(1,1000)]]; 
lemmatizedTFIDF = [lemmatizedTFIDF; [zeros(1,1000) ones(1,1000)]];

num_docs = length(lemmatizedTFIDF(1,:));

%% Partition the Dataset into Training and Test
num_partition1 = 0.6 * num_docs;
num_partition2 = num_docs - num_partition1;

if (SAMPLING_TYPE==1)
    partition1_docs = [1:(num_partition1/2) 1000+(1:(num_partition1/2))];
    partition2_docs = [(num_partition1/2)+(1:(num_partition2/2)) (num_partition1/2)+1000+(1:(num_partition2/2))];
    
    training = lemmatizedTFIDF(:,partition1_docs);
    test = lemmatizedTFIDF(:,partition2_docs);
else
    partition1_docs = [];
    for i=1:num_partition1
        random_index = ceil(rand()*2000);
        while ~(sum(find(partition1_docs==random_index))==0)
            random_index = ceil(rand()*2000);
        end
        partition1_docs = [partition1_docs random_index];
    end
    
    partition2_docs = [];
    for i=1:num_docs
        if (sum(find(partition1_docs==i))==0)
            partition2_docs = [partition2_docs i];
        end
    end

    training = lemmatizedTFIDF(:,partition1_docs(1));
    test = lemmatizedTFIDF(:,partition2_docs(1));

    for i=2:num_partition1
        training = [training lemmatizedTFIDF(:,partition1_docs(i))];
    end

    for i=2:num_partition2
        test = [test lemmatizedTFIDF(:,partition2_docs(i))];
    end
end

%% Run LSI/SVD on TFIDF Matrix

[U,S,V] = svds(lemmatizedTFIDF);

%% Perform Training on Training Dataset

colnames = [lemmatizedVocab(1:5000)'];

for i=1:length(colnames)
    colnames{i} = strcat(colnames{i},'_');
end

training_table = array2table(training([1:5000],:)', 'VariableNames', colnames);

disp '(i) Learning Regression Model Classifier';
mdl = fitlm(training_table, 'linear');

