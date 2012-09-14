% Things to do

% Obtain the data
%% Go through the file list
filepath = 'focustest';
filelist = dir(filepath);
filename = 'focused16';
I = imread(fullfile('focustest',strcat(filename,'.JPG')));
annotated_path = fullfile('focustest','annotation',filename);

%%
% Get the annotated bounding box
bb_text = read_data(filename);
[bbs,labels] = sample_data(I,bb_text);

% Get the feature vectors
fv = zeros(size(bbs,1),285);
for i=1:size(bbs,1)
    bb = bbs(i,:);
    cropped = imcrop(I,bb);
    resized = imresize(cropped,[64 128]);
    img = double(resized);
    fv(i,:) = fgen(img);
end

close all;
figure; imshow(I); hold on;
for i=1:size(bbs,1)
    if labels(i) == 1
        rectangle('Position',bbs(i,:),'EdgeColor','red');
    else
        rectangle('Position',bbs(i,:),'EdgeColor','blue');
    end
end

%% Train the logistic regression model
% Using SGD
[data,maxout,minout] = normalize_feature(fv,0,0);

settings.maxout = maxout;
settings.minout = minout;

data = [data labels];

beta=sgd(data,1,0.001);

%% Test the model
filename = 'focused6';
I = imread(fullfile('focustest',strcat(filename,'.JPG')));
bbs = cc_textdetect(I);
figure; imshow(I);
for i=1:size(bbs,1)
    cropped = double(imcrop(I,bbs(i,:)));
    resized = imresize(cropped,[64 128]);
    features = fgen(resized);
    features = normalize_feature(features',maxout,minout);
    prob = p(features,beta);
    if prob > .5
        rectangle('Position',bbs(i,:),'EdgeColor','red');
    end
end