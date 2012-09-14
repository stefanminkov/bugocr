% Get negative data for learning algorithm
function [bbs,labels] = sample_data(I,bb_text)
    % Perform preprocessing steps
    bbs = cc_textdetect(I);
    
    % Get the negative bbs by comparing the overlap between
    labels = zeros(size(bbs,1),1);
    for i=1:size(bbs,1)
        for j=1:size(bb_text,1)
            bb1 = bbs(i,:);
            bb2 = bb_text(j,:);
            %fs = fgen(bb1);
            intersection_area = bbApply('area',bbApply('intersect',bb1,bb2));
            union_area = bbApply('area',bbApply('union',bb1,bb2));
            overlap = intersection_area/union_area;
            
            if overlap > 0
                labels(i) = 1;
                break;
            end
            
            % Summary
            % compute the overlap
            % extract the feature vectors and add to the positive data
            % overlap(bb1,bb2) = area(intersect(bb1,bb2))/area(union(bb1,bb2))
            % if overlap > .5
            % then classify as text
            % else as non-text
        end
    end
end