% Text localization using CC-based technique
function cc_textdetect(I)
    [rowc,colc,~] = size(I);
    gray = rgb2gray(I);
    
    % Preprocessing steps
    
    % Noise reduction
    gfilter = fspecial('gaussian',5,2);
    gray = imfilter(gray,gfilter);
    
    % CC-generation
    after_threshold = adaptivethreshold(gray,20,.03);
    after_threshold = 1 - after_threshold;
    
    figure; imshow(after_threshold); title('Results of adaptive threshold');
    
    after_removing_noise = bwareaopen(after_threshold,30);
    
    se90 = strel('line', 3, 90);
    se0 = strel('line', 3, 0);
    
    after_dilation = imdilate(after_removing_noise,[se90 se0]);
    
    after_clearing_border = imclearborder(after_dilation);
    
    cc = bwconncomp(after_clearing_border);
    
    close all; figure;
    subplot(2,2,1); imshow(after_threshold); title('Results of adaptive threshold');
    subplot(2,2,2); imshow(after_removing_noise); title('Noises removed');
    subplot(2,2,3); imshow(after_dilation); title('Noises removed');
    subplot(2,2,4); imshow(after_clearing_border); title('Remove borders');

    % Filter non-text
    
    gray_level_contrast = zeros(cc.NumObjects,1);
    gray_level = zeros(cc.NumObjects,1);
    aspect_ratio = zeros(cc.NumObjects,1);
    figure; imshow(gray)
    for i=1:cc.NumObjects
        [x y] = ind2sub([rowc,colc], cc.PixelIdxList{i});
        box = [min(y) min(x) max(y)-min(y) max(x)-min(x)];
        outer_box = [box(1)-5 box(2)-5 box(3)+5 box(4)+5];
        
        box_gray = imcrop(gray,box);
        outer_box_gray = imcrop(gray,outer_box);
        
        box_average = sum(box_gray(:))./double(length(box_gray(:)));
        
        outerbox_numpix = double(length(outer_box_gray(:)-length(box_gray(:))));
        outerbox_total = sum(outer_box_gray(:))-sum(box_gray(:));
        outer_box_average = outerbox_total/outerbox_numpix;
        
        gray_level_contrast(i) = outer_box_average-box_average;
        gray_level(i) = sum(gray(cc.PixelIdxList{i}));
        aspect_ratio(i) = box(3)./double(box(4));
        rectangle('Position',box)
    end
    
    gray_level = gray_level/max(gray_level);
    idx = find(aspect_ratio > 5);
    image = after_clearing_border;
    for i=1:length(idx)
        image(cc.PixelIdxList{idx(i)}) = 0;
    end
    
    idx = find(aspect_ratio < .5);
    for i=1:length(idx)
        image(cc.PixelIdxList{idx(i)}) = 0;
    end
    
    figure; imshow(image);
    
    % Component grouping
    copy = gray;
end