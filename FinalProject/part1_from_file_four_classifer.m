function part1_from_file_four_classifer


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
training_label_vector_airplanes = ones(1,s);
training_label_vector_airplanes = training_label_vector_airplanes';

[~,s] = size(training_motorbikes) ;
training_label_vector_motorbikes = ones(1,s)*2 ;
training_label_vector_motorbikes =training_label_vector_motorbikes';

[~,s] = size(training_faces) ;
training_label_vector_faces =  ones(1,s)*3  ;
training_label_vector_faces=training_label_vector_faces';

[~,s] = size(training_cars) ;
training_label_vector_cars = ones(1,s)*4  ;
training_label_vector_cars=training_label_vector_cars';

training_instance_matrix_airplanes = training_airplanes';
training_instance_matrix_motorbikes = training_motorbikes';
training_instance_matrix_faces = training_faces';
training_instance_matrix_cars = training_cars';




% 5 -- L1-regularized L2-loss support vector classification\n"
model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes),'-s 5');
model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes),'-s 5');
model_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces),'-s 5');
model_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars),'-s 5');


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


[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_motorbikes)
[sortvals, sortidx] = sort(prob_estimates,'descend');
sortidx(1:10)
% [predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_airplanes)
% 
% [predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_faces)
% 
% [predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_cars)





end
