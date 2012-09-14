% Script to start the annotation tools
train_filelist = textread('focustest\train.txt','%s');
i = 1;
filename = train_filelist{i};
I = imread(fullfile('focustest',strcat(filename,'.JPG')));
annotated_path = fullfile('focustest','annotation',filename);
figure(1); imshow(I);

done = false;
bb = [];
while ~done
    reply = input('Command([B]ox,[N]ext,[Q]uit): ', 's');
    switch reply
        case 'B'
            % Do something here
            fprintf('New box\n');
            h = imrect;
            position = wait(h);
            bb = [bb; position]
        case 'N'
            second_reply = input('Save the last one?): ', 's');
            if second_reply == 'Y'
                dlmwrite(annotated_path, bb, 'delimiter', '\t')
            end
            
            fprintf('Next picture(%d/%d)\n',i,length(train_filelist));
            i = i + 1;
            filename = train_filelist{i};
            I = imread(fullfile('focustest',strcat(filename,'.JPG')));
            annotated_path = fullfile('focustest','annotation',filename);
            figure(1); imshow(I);
            bb = [];
        case 'Q'
            fprintf('Saving the annotation to file...\n');
            dlmwrite(annotated_path, bb, 'delimiter', '\t')
            fprintf('Quitting...\n');
            done = true;
            continue;
        otherwise
            fprintf('Bad commands. Try again.\n');
    end
end