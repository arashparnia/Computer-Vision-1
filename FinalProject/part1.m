%% part 1
clear all;
clc;
disp('part 1');
% Types = 'dense', 'RGBsift', 'rgbsift', 'Oppsift'
% run('vlfeat-0.9.20/toolbox/vl_setup.m')

% vocabulary_size = 400;
% descriptor_type = 'dense';
% descriptor_step_size = 50;
%
% vocabulary_size = 800;
% descriptor_type = 'dense';
% sescriptor_step_size = 50;
% 
%
% vocabulary_size = 400;
% descriptor_type = 'rgbsift';
% descriptor_step_size = 50;
% 
% vocabulary_size = 800;
% descriptor_type = 'rgbsift';
% descriptor_step_size = 50;
%
%
vocabulary_size = 400;
descriptor_type = 'RGBsift';
descriptor_step_size = 50;
% 
% vocabulary_size = 800;
% descriptor_type = 'RGBsift';
% descriptor_step_size = 50;
%
%
% vocabulary_size = 400;
% descriptor_type = 'opponent';
% descriptor_step_size = 50;
% 
% vocabulary_size = 800;
% descriptor_type = 'opponent';
% descriptor_step_size = 50;

make_histogram(vocabulary_size,descriptor_type,descriptor_step_size);
histogram_to_classifer(vocabulary_size,descriptor_type);


