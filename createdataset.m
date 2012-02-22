function createdataset(filename)
    I = imread(filename);
    bbs = slide_window(I);
    for i=1:size(bbs,1)
        x = imcrop(I,bbs(i,:));
        imwrite(x,sprintf('%s%d%d.jpg',filename,bbs(i,1),bbs(i,2)));
    end
end