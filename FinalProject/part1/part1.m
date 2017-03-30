%% part 1
% Types = 'dense', 'keypoints', 'RGBsift', 'rgbsift', 'Oppsift'
% run('vlfeat-0.9.20/toolbox/vl_setup.m')

vocabulary_size = 400;
descriptor_type = 'dense';
sescriptor_step_size = 5;
make_histogram(vocabulary_size,descriptor_type);
histogram_to_classifer(vocabulary_size);

vocabulary_size = 800;
descriptor_type = 'dense';
sescriptor_step_size = 5;
make_histogram(vocabulary_size,descriptor_type);
histogram_to_classifer(vocabulary_size);

vocabulary_size = 400;
descriptor_type = 'rgbsift';
make_histogram(vocabulary_size,descriptor_type);
histogram_to_classifer(vocabulary_size);

vocabulary_size = 800;
descriptor_type = 'rgbsift';
make_histogram(vocabulary_size,descriptor_type);
histogram_to_classifer(vocabulary_size);