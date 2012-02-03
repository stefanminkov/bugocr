function I=preprocess(I)
    gfilter = fspecial('gaussian',[7 7],5);
    I=imfilter(I,gfilter,'symmetric','conv');
end