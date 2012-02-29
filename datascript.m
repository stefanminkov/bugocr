clear all;

% Collect data
npath = 'focusnontext';
ndir = dir(npath);
ndir = ndir(3:length(ndir));

fl=154; % feature length

nl = length(ndir);
ndata = zeros(nl,fl);
for i=1:nl
    i
    p = fullfile(npath,ndir(i).name);
    window = double(rgb2gray(imread(p)));
    fs = fgen(window);
    ndata(i,:) = fs;
end

tpath = 'focustext';
tdir = dir(tpath);
tdir = tdir(3:length(tdir));
tl = length(tdir);
tdata = zeros(tl,fl);
for i=1:tl
    i
    p = fullfile(tpath,tdir(i).name);
    window = double(rgb2gray(imread(p)));
    fs = fgen(window);
    tdata(i,:) = fs;
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