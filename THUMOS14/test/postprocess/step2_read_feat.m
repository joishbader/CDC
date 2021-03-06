clear;
%
inputdir = '../feat/';

folder = dir(inputdir); 

prob = zeros(42124*32,22);

count = 0;
for folder_index = 3:size(folder,1)
    tic
    folder_index
    img = dir( [inputdir folder(folder_index).name '/*prob'] ); % be careful whether all are jpg
    for img_index = 1:size(img,1)
        [~,tmp] = read_binary_blob([inputdir folder(folder_index).name '/' img(img_index).name]);
        for i=1:32
            for c=1:22
                prob(count+i,c) = tmp(32*(c-1)+i);
            end
        end
        count = count + 32;
    end
    toc
end          

[max_class_score,max_class_index] = max(prob,[],2);

save('read_res.mat','prob','max_class_score','max_class_index');

clear;
%
load('read_res.mat');
load('metadata.mat');

prob = prob(kept_frm_index,:);
proball = prob(:,1:21)';

save('proball.mat','proball','videoid');


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
