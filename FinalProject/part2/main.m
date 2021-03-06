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
train_svm(nets, data);


% figure;
% make_graph(nets.pre_trained,data,'Pre trained');
% figure;
% make_graph(nets.fine_tuned,data,'Fine tuned') ;

function make_graph(net, data, net_type)
    image_label = [];
    points = [];
  
    net.layers{end}.type = 'softmax';

    s = size(data.images.data,4);
    for i = 1:s
        net_model = vl_simplenn(net, data.images.data(:, :,:, i));
        squeeze_net_model = squeeze(net_model(end-3).x);
        if ne(data.images.set(i) , 1)
            points = [points squeeze_net_model];
            image_label   = [image_label;  data.images.labels(i)];
        end
    end
    tsne_out = tsne(double(points'), double(image_label),64);
    gscatter(tsne_out(:,1),tsne_out(:,2), image_label);
    title(net_type);
   
end
