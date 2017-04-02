%% main function 
clc;
% cnn  = load('part2/data/pre_trained_model.mat');
%% section 3.1
%     vl_simplenn_display(cnn.net);
    
    % 1. Do you observe any pattern in the architecture of the network? If so, describe it in your own words.
    % 2. Which part of the network has the most parameters and the biggest size?

%% fine-tune cnn

[net, info, expdir] = finetune_cnn();
% vl_simplenn_display(net);
save(fullfile(expdir, 'fine_tuned_model.mat'), 'net');

%% extract features and train svm

% TODO: Replace the name with the name of your fine-tuned model
nets.fine_tuned = load(fullfile(expdir, 'fine_tuned_model.mat')); 
nets.fine_tuned = nets.fine_tuned.net;
nets.pre_trained = load(fullfile('part2','data', 'pre_trained_model.mat')); 
nets.pre_trained = nets.pre_trained.net; 
data = load(fullfile(expdir, 'imdb-caltech.mat'));
data.images.data = single(data.images.data);

vl_simplenn_display(nets.pre_trained);
%%

visualize(nets.pre_trained,data,'Pre trained')

train_svm(nets, data);
% 
visualize(nets.fine_tuned,data,'Fine tuned') 

function visualize(net, data, type)
    figure();
    net.layers{end}.type = 'softmax';
    label = [];
    feats = [];

    for i = 1:size(data.images.data,4)

        result = vl_simplenn(net, data.images.data(:, :,:, i));
        feat = result(end-3).x;
        feat = squeeze(feat);

        if (data.images.set(i) ~= 1)
            feats = [feats feat];
            label   = [label;  data.images.labels(i)];
        end

    end
    out_tsne = tsne(double(feats'), double(label));
    gscatter(out_tsne(:,1),out_tsne(:,2), label);
    title(type)

end
