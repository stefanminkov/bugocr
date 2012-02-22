function guesses=detectbb(I,beta,settings)
    maxout = settings.maxout;
    minout = settings.minout;
    
    bbs = slide_window(I);
    I = double(rgb2gray(I));
    guesses = zeros(size(bbs,1),1);
    for i=1:size(bbs,1)
        i
        window = imcrop(I,bbs(i,:));
        features = fgen(window);

        features = normalize_feature(features',maxout(1:45),minout(1:45));
        if p(features,beta) > .5
            guesses(i) = 1;
        end
    end
end