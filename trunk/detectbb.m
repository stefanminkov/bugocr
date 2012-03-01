function heatmap=detectbb(I,beta,settings)
    maxout = settings.maxout;
    minout = settings.minout;
    
    gray = rgb2gray(I);
    heatmap = zeros(size(gray));
    bbs = slide_window(I);
    I = double(rgb2gray(I));
    for i=1:size(bbs,1)
        i
        bbsi = bbs(i,:);
        window = imcrop(I,bbs(i,:));
        features = fgen(window);

        features = normalize_feature(features',maxout(1:154),minout(1:154));
        prob = p(features,beta);
        heatmap(bbsi(2):bbsi(2)+bbsi(4),bbsi(1):bbsi(1)+bbsi(3)) = heatmap(bbsi(2):bbsi(2)+bbsi(4),bbsi(1):bbsi(1)+bbsi(3)) + prob;
    end
end