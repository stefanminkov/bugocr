%run
clear all;
load data;

% Normalizing the feature
data=normalize_feature(data);

% Shuffle data
order = randperm(size(data,1));
data = data(order,:);

satrainingdata = data(1:2000,:);
testdata = data(2001:size(data,1),:);




%test(testdata,beta)
