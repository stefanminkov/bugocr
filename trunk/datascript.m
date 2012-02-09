% Collect data
npath = 'nontext';
ndir = dir(npath);
ndir = ndir(3:length(ndir));

fl=19; % feature length

nl = length(ndir);
ndata = zeros(nl,fl);
for i=1:length(ndir)
    i
    if strcmp(ndir(i).name,'.') || strcmp(ndir(i).name,'..')
        continue
    end
    p = fullfile(npath,ndir(i).name);
    window = double(rgb2gray(imread(p)));
    features = fgen(window);
    ndata(i,:) = features;
end

tpath = 'text';
tdir = dir(tpath);
tdir = tdir(3:length(tdir));
tl = length(tdir);
tdata = zeros(tl,fl);
for i=1:length(tdir)
    i
    p = fullfile(tpath,tdir(i).name);
    window = double(rgb2gray(imread(p)));
    features = fgen(window);
    tdata(i,:) = features;
end

data = [ndata; tdata];
labels = zeros(nl+tl,1);
labels(nl+1:length(labels)) = 1;