%% main function 
clc;
cnn  = load('part2/data/pre_trained_model.mat');
%% section 3.1
%     vl_simplenn_display(cnn.net);
    % 1. Do you observe any pattern in the architecture of the network? If so, describe it in your own words.
    % 2. Which part of the network has the most parameters and the biggest size?

%% fine-tune cnn

[net, info, expdir] = finetune_cnn();

%% extract features and train svm

% TODO: Replace the name with the name of your fine-tuned model
nets.fine_tuned = load(fullfile(expdir, 'net-epoch-50.mat')); 
nets.fine_tuned = nets.fine_tuned.net;
nets.pre_trained = load(fullfile('part2','data', 'pre_trained_model.mat')); 
nets.pre_trained = nets.pre_trained.net; 
data = load(fullfile(expdir, 'imdb-caltech.mat'));

vl_simplenn_display(nets.pre_trained);
%%
train_svm(nets, data);
