clc;
clearvars;
% clear all;
% run('vlfeat-0.9.20/toolbox/vl_setup');
% s = RandStream('mt19937ar','Seed',1);
% RandStream.setGlobalStream(s);


% part1(400);


%% loading H 


% load('H_motorbikes');
% for i = 1:1:25
%     subplot(5,5,i);
%     X = H_motorbikes{i};
%     histogram(X, 'Normalization', 'count') %// plot normalized histogram
%     
% end
% 
load('H_airplanes');
load('H_motorbikes');
load('H_faces');
load('H_cars');

training_airplanes = cell2mat(H_airplanes);
training_motorbikes = cell2mat(H_motorbikes);
training_faces = cell2mat(H_faces);
training_cars = cell2mat(H_cars);

[~,s] = size(training_airplanes); 
training_label_vector = ones(1,s);

[~,s] = size(training_motorbikes) ;
training_label_vector = cat(2,training_label_vector , ones(1,s)*2 ) ;

[~,s] = size(training_faces) ;
training_label_vector = cat(2,training_label_vector , ones(1,s)*3 ) ;

[~,s] = size(training_cars) ;
training_label_vector = cat(2,training_label_vector , ones(1,s)*4 ) ;

training_instance_matrix = training_airplanes;
training_instance_matrix = cat(2,training_instance_matrix,training_motorbikes);
training_instance_matrix = cat(2,training_instance_matrix,training_faces);
training_instance_matrix = cat(2,training_instance_matrix,training_cars);

training_label_vector = training_label_vector';

training_instance_matrix = training_instance_matrix';


% 5 -- L1-regularized L2-loss support vector classification\n"
model = train(training_label_vector, sparse(training_instance_matrix),'-s 5');



% % save('model','model');
% 
% load('model')
% model

load('H_test');


test_mat = cell2mat(H_test);

[~,s] = size(test_mat); 
test_label_vector = ones(1,s);
test_label_vector(1,50:100) = test_label_vector(1,50:100)* 4;
test_label_vector(1,100:150) = test_label_vector(1,100:150)* 3;
test_label_vector(1,150:200) = test_label_vector(1,150:200)* 2;


test_instance_matrix = test_mat;

test_label_vector = test_label_vector';

test_instance_matrix = test_instance_matrix';


[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model);

accuracy


