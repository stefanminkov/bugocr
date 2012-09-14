% Read in the annotated data
function annotation=read_data(filename)
    path = fullfile('focustest',strcat(filename,'.JPG'));
    annotated_path = fullfile('focustest','annotation',filename);
    I = imread(path);
    annotation = textread(annotated_path);
    
    % Debug
%     close all; imshow(I);
%     for i=1:size(annotation,1)
%         rectangle('Position',annotation(i,:));
%     end
end