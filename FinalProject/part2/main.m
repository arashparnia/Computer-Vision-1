%% main function 
% run ('matconvnet-1.0-beta23/matlab/vl_setupnn');
cnn  = load('data/pre_trained_model.mat');
%% section 3.1
    vl_simplenn_display(cnn.net);
    % 1. Do you observe any pattern in the architecture of the network? If so, describe it in your own words.
    
    % layer|    0|     1|      2|     3|     4|     5|      6|     7|     8|      9|     10|     11|     12|     13|
    %       type|input|  conv|  mpool|  relu|  conv|  relu|  apool|  conv|  relu|  apool|   conv|   relu|   conv|softmxl|
    %       name|  n/a|layer1| layer2|layer3|layer4|layer5| layer6|layer7|layer8| layer9|layer10|layer11|layer12|layer13|
    % ----------|-----|------|-------|------|------|------|-------|------|------|-------|-------|-------|-------|-------|
    %    support|  n/a|     5|      3|     1|     5|     1|      3|     5|     1|      3|      4|      1|      1|      1|
    %   filt dim|  n/a|     3|    n/a|   n/a|    32|   n/a|    n/a|    32|   n/a|    n/a|     64|    n/a|     64|    n/a|
    % filt dilat|  n/a|     1|    n/a|   n/a|     1|   n/a|    n/a|     1|   n/a|    n/a|      1|    n/a|      1|    n/a|
    %  num filts|  n/a|    32|    n/a|   n/a|    32|   n/a|    n/a|    64|   n/a|    n/a|     64|    n/a|     10|    n/a|
    %     stride|  n/a|     1|      2|     1|     1|     1|      2|     1|     1|      2|      1|      1|      1|      1|
    %        pad|  n/a|     2|0x1x0x1|     0|     2|     0|0x1x0x1|     2|     0|0x1x0x1|      0|      0|      0|      0|
    % ----------|-----|------|-------|------|------|------|-------|------|------|-------|-------|-------|-------|-------|
    %    rf size|  n/a|     5|      7|     7|    15|    15|     19|    35|    35|     43|     67|     67|     67|     67|
    %  rf offset|  n/a|     1|      2|     2|     2|     2|      4|     4|     4|      8|     20|     20|     20|     20|
    %  rf stride|  n/a|     1|      2|     2|     2|     2|      4|     4|     4|      8|      8|      8|      8|      8|
    % ----------|-----|------|-------|------|------|------|-------|------|------|-------|-------|-------|-------|-------|
    %  data size|   32|    32|     16|    16|    16|    16|      8|     8|     8|      4|      1|      1|      1|      1|
    % data depth|    3|    32|     32|    32|    32|    32|     32|    64|    64|     64|     64|     64|     10|      1|
    %   data num|    1|     1|      1|     1|     1|     1|      1|     1|     1|      1|      1|      1|      1|      1|
    % ----------|-----|------|-------|------|------|------|-------|------|------|-------|-------|-------|-------|-------|
    %   data mem| 12KB| 128KB|   32KB|  32KB|  32KB|  32KB|    8KB|  16KB|  16KB|    4KB|   256B|   256B|    40B|     4B|
    %  param mem|  n/a|  10KB|     0B|    0B| 100KB|    0B|     0B| 200KB|    0B|     0B|  256KB|     0B|    3KB|     0B|
    % 
    % parameter memory|569KB (1.5e+05 parameters)|
    %      data memory|  313KB (for batch size 1)|

    % 2. Which part of the network has the most parameters and the biggest size?

%% fine-tune cnn

[net, info, expdir] = finetune_cnn();

%% extract features and train svm

% TODO: Replace the name with the name of your fine-tuned model
nets.fine_tuned = load(fullfile(expdir, 'your_new_model.mat')); nets.fine_tuned = nets.fine_tuned.net;
nets.pre_trained = load(fullfile('data', 'pre_trained_model.mat')); nets.pre_trained = nets.pre_trained.net; 
data = load(fullfile(expdir, 'imdb-caltech.mat'));


%%
train_svm(nets, data);
