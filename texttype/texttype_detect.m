function prob=texttype_detect(I,beta,settings)
    maxout = settings.maxout;
    minout = settings.minout;
    
    I = imresize(double(rgb2gray(I)),[200 800]);
    features = hog(I,40,16);
    features = features(:);
    features = normalize_feature(features',maxout(1:3456),minout(1:3456));
    prob = p(features,beta);
end