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


% best_motorbikes = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes), '-C -s 0');
% model_motorbikes = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes), sprintf('-c %f -s 0', best_motorbikes(1))); % use the same solver: -s 0 
% best_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes), '-C -s 0');
% model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes), sprintf('-c %f -s 0', best_airplanes(1))); % use the same solver: -s 0 
% best_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces), '-C -s 0');
% model_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces), sprintf('-c %f -s 0', best_faces(1))); % use the same solver: -s 0 
% best_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars), '-C -s 0');
% model_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars), sprintf('-c %f -s 0', best_cars(1))); % use the same solver: -s 0 




% model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes),'-s 6');
% model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes),'-s 6');
% model_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces),'-s 6');
% model_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars),'-s 6');

% 5 -- L1-regularized L2-loss support vector classification\n"
% model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes),'-s 5');
% model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes),'-s 5');
% model_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces),'-s 5');
% model_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars),'-s 5');

model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes));
model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes));
model_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces));
model_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars));


% % save('model','model');
% 
% load('model')
% model

load('H_test');


test_mat = cell2mat(H_test);

[~,s] = size(test_mat); 
test_label_vector = ones(1,s) * 0;
test_label_vector(1,50:100) = test_label_vector(1,50:100)* 4 * 0;
test_label_vector(1,100:150) = test_label_vector(1,100:150)* 3 * 0;
test_label_vector(1,150:200) = test_label_vector(1,150:200)* 2 * 0;


test_instance_matrix = test_mat;

test_label_vector = test_label_vector';

test_instance_matrix = test_instance_matrix';


[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_motorbikes);
[sortvals, sortidx] = sort(prob_estimates,'descend');
motorbikes = sortidx(1:10);

[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_airplanes);
[sortvals, sortidx] = sort(prob_estimates,'descend');
airplanes = sortidx(1:10);

[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_faces);
[sortvals, sortidx] = sort(prob_estimates,'descend');
faces = sortidx(1:10);

[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_cars);
[sortvals, sortidx] = sort(prob_estimates,'descend');
cars = sortidx(1:10);

publish_to_html(motorbikes,airplanes,cars,faces);



end

