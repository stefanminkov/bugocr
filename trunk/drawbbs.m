function drawbbs(I,bbs,l)
    close all;
    imshow(I);
    for i=1:size(bbs,1)
        if l(i)
            rectangle('Position',bbs(i,:),'EdgeColor','r');
        end
    end
end