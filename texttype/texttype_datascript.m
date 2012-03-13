clear all;

% Collect data
npath = 'data/printed/';
ndir = dir(npath);
ndir = ndir(3:length(ndir));

fl=3456; % feature length

nl = length(ndir);
ndata = zeros(nl,fl);
size(ndata)
for i=1:nl
    i
    p = fullfile(npath,ndir(i).name);
    window = double(rgb2gray(imread(p)));
    window = imresize(window,[200 800]);
    hogf = hog(window,40,16);
    ndata(i,:) = hogf(:);
end

tpath = 'data/handwriting';
tdir = dir(tpath);
tdir = tdir(3:length(tdir));
tl = length(tdir);
tdata = zeros(tl,fl);
for i=1:tl
    i
    p = fullfile(tpath,tdir(i).name);
    window = double(rgb2gray(imread(p)));
    window = imresize(window,[200 800]);
    hogf = hog(window,40,16);
    tdata(i,:) = hogf(:);
end

data = [ndata; tdata];
labels = zeros(nl+tl,1);
labels(nl+1:length(labels)) = 1;

data = [data labels];

order = randperm(size(data,1));
data = data(order,:);

[data,maxout,minout] = normalize_feature(data,0,0);

settings.maxout = maxout;
settings.minout = minout;

save('data','data');
save('settings','settings');

beta=sgd(data,1,0.001);