function guesses=detectbb(I,beta)
    bbs = slide_window(I);
    I = double(rgb2gray(I));
    guesses = zeros(size(bbs,1),1);
    for i=1:size(bbs,1)
        i
        try
            window = I(bbs(i,1):bbs(i,1)+bbs(i,3),bbs(i,2):bbs(i,2)+bbs(i,4));
            features = fgen(window);
            if p(features,beta) > .5
                guesses(i) = 1;
            end
        catch
            continue
        end
    end
end