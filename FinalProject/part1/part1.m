%% part 1
clear all;
clc;
warning off;
disp('part 1');
  
run('../vlfeat-0.9.20/toolbox/vl_setup.m')

%% sift ========================================================================================================================
% vocabulary_size = 400;
% descriptor_type = 'sift_RGB';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
% disp('-------------------------------------------------------------------------------------------');

% vocabulary_size = 800;
% descriptor_type = 'sift_RGB';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
% disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 1200;
% descriptor_type = 'sift_RGB';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
% disp('-------------------------------------------------------------------------------------------');

% 
% 
% vocabulary_size = 400;
% descriptor_type = 'sift_rgb_norm';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
% disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 800;
% descriptor_type = 'sift_rgb_norm';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
% disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 1200;
% descriptor_type = 'sift_rgb_norm';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
% disp('-------------------------------------------------------------------------------------------');
% 

vocabulary_size = 400;
descriptor_type = 'sift_opponent';
descriptor_step_size = 5;
make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');

vocabulary_size = 800;
descriptor_type = 'sift_opponent';
descriptor_step_size = 5;
make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');

vocabulary_size = 1200;
descriptor_type = 'sift_opponent';
descriptor_step_size = 5;
make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 
%% dense ========================================================================================================================
% ===============================================================================================================================
% ===============================================================================================================================

% vocabulary_size = 400;
% descriptor_type = 'dense_rgb';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 800;
% descriptor_type = 'dense_rgb';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 1200;
% descriptor_type = 'dense_rgb';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 400;
% descriptor_type = 'dense_rgb_norm';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 800;
% descriptor_type = 'dense_rgb_norm';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 1200;
% descriptor_type = 'dense_rgb_norm';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 400;
% descriptor_type = 'dense_opponent';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 800;
% descriptor_type = 'dense_opponent';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 
% vocabulary_size = 1200;
% descriptor_type = 'dense_opponent';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
disp('-------------------------------------------------------------------------------------------');
% 