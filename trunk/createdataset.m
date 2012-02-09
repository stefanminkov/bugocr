function createdataset(filename)
    I = imread(filename);
    bbs = slide_window(I,1);
    for i=1:size(bbs,1)
        i
        try
            x = I(bbs(i,2):bbs(i,2)+bbs(i,4),bbs(i,1):bbs(i,1)+bbs(i,3),:);
            imwrite(x,sprintf('%s%d%d.jpg',filename,bbs(i,1),bbs(i,2)));
        catch
            continue
        end
    end
end