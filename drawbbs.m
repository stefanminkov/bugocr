function drawbbs(I,bbs,l)
    close all;
    imshow(I);
    for i=1:size(bbs,1)
        rectangle('Position',bbs(i,:));
        if l(i)
            rectangle('Position',bbs(i,:),'FaceColor','r');
        end
    end
end