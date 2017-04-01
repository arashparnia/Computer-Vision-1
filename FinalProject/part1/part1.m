%% part 1
clear all;
clc;
warning off;
disp('part 1');
  % Types = 'dense','RGB_sift', 'rgb_sift', 'Oppsift' ,'keypoints'
run('../vlfeat-0.9.20/toolbox/vl_setup.m')


vocabulary_size = 400;
descriptor_type = 'dense';
descriptor_step_size = 5;
make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
histogram_to_classifer(vocabulary_size,descriptor_type);

vocabulary_size = 800;
descriptor_type = 'dense';
descriptor_step_size = 5;
make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
histogram_to_classifer(vocabulary_size,descriptor_type);


vocabulary_size = 400;
descriptor_type = 'norm_rgb_sift';
descriptor_step_size = 5;
make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
histogram_to_classifer(vocabulary_size,descriptor_type);

vocabulary_size = 800;
descriptor_type = 'norm_rgb_sift';
descriptor_step_size = 5;
make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
histogram_to_classifer(vocabulary_size,descriptor_type);


% vocabulary_size = 800;
% descriptor_type = 'RGB_sift';
% descriptor_step_size = 5;
% make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
% 
% 
% vocabulary_size = 800;
% descriptor_type = 'opponent';
% descriptor_step_size = 5;
% % make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% histogram_to_classifer(vocabulary_size,descriptor_type);
% 
% 
% % vocabulary_size = 800;
% % descriptor_type = 'keypoints';
% % descriptor_step_size = 5;
% % make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
% % histogram_to_classifer(vocabulary_size,descriptor_type);
% 


