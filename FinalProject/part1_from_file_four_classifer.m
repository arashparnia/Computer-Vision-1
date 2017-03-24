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
[~,s] = size(training_motorbikes) ;
training_label_vector_airplanes = cat(2,training_label_vector_airplanes , zeros(1,s) ) ;
[~,s] = size(training_faces) ;
training_label_vector_airplanes = cat(2,training_label_vector_airplanes , zeros(1,s) ) ;
[~,s] = size(training_cars) ;
training_label_vector_airplanes = cat(2,training_label_vector_airplanes , zeros(1,s) ) ; 

[~,s] = size(training_airplanes); 
training_label_vector_motorbikes = zeros(1,s);
[~,s] = size(training_motorbikes) ;
training_label_vector_motorbikes = cat(2,training_label_vector_motorbikes , ones(1,s) ) ;
[~,s] = size(training_faces) ;
training_label_vector_motorbikes = cat(2,training_label_vector_motorbikes , zeros(1,s) ) ;
[~,s] = size(training_cars) ;
training_label_vector_motorbikes = cat(2,training_label_vector_motorbikes , zeros(1,s) ) ; 

[~,s] = size(training_airplanes); 
training_label_vector_faces = zeros(1,s);
[~,s] = size(training_motorbikes) ;
training_label_vector_faces = cat(2,training_label_vector_faces , zeros(1,s) ) ;
[~,s] = size(training_faces) ;
training_label_vector_faces = cat(2,training_label_vector_faces , ones(1,s) ) ;
[~,s] = size(training_cars) ;
training_label_vector_faces = cat(2,training_label_vector_faces , zeros(1,s) ) ; 

[~,s] = size(training_airplanes); 
training_label_vector_cars = zeros(1,s);
[~,s] = size(training_motorbikes) ;
training_label_vector_cars = cat(2,training_label_vector_cars , zeros(1,s) ) ;
[~,s] = size(training_faces) ;
training_label_vector_cars = cat(2,training_label_vector_cars , zeros(1,s) ) ;
[~,s] = size(training_cars) ;
training_label_vector_cars = cat(2,training_label_vector_cars , ones(1,s) ) ; 


training_instance_matrix = training_airplanes;
training_instance_matrix = cat(2,training_instance_matrix,training_motorbikes);
training_instance_matrix = cat(2,training_instance_matrix,training_faces);
training_instance_matrix = cat(2,training_instance_matrix,training_cars);

training_instance_matrix = training_instance_matrix';
training_label_vector_motorbikes  =training_label_vector_motorbikes';
training_label_vector_airplanes =training_label_vector_airplanes';
training_label_vector_faces = training_label_vector_faces';
training_label_vector_cars = training_label_vector_cars';

% best_motorbikes = train(training_label_vector_motorbikes, sparse(training_instance_matrix), '-C -s 0');
% model_motorbikes = train(training_label_vector_motorbikes, sparse(training_instance_matrix), sprintf('-c %f -s 0', best_motorbikes(1))); % use the same solver: -s 0 
% best_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix), '-C -s 0');
% model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix), sprintf('-c %f -s 0', best_airplanes(1))); % use the same solver: -s 0 
% best_faces = train(training_label_vector_faces, sparse(training_instance_matrix), '-C -s 0');
% model_faces = train(training_label_vector_faces, sparse(training_instance_matrix), sprintf('-c %f -s 0', best_faces(1))); % use the same solver: -s 0 
% best_cars = train(training_label_vector_cars, sparse(training_instance_matrix), '-C -s 0');
% model_cars = train(training_label_vector_cars, sparse(training_instance_matrix), sprintf('-c %f -s 0', best_cars(1))); % use the same solver: -s 0 




% model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix),'-s 6');
% model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix),'-s 6');
% model_faces = train(training_label_vector_faces, sparse(training_instance_matrix),'-s 6');
% model_cars = train(training_label_vector_cars, sparse(training_instance_matrix),'-s 6');

% 5 -- L1-regularized L2-loss support vector classification\n"
% model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix),'-s 5');
% model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix),'-s 5');
% model_faces = train(training_label_vector_faces, sparse(training_instance_matrix),'-s 5');
% model_cars = train(training_label_vector_cars, sparse(training_instance_matrix),'-s 5');

model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix));
model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix));
model_faces = train(training_label_vector_faces, sparse(training_instance_matrix));
model_cars = train(training_label_vector_cars, sparse(training_instance_matrix));


% % save('model','model');
% 
% load('model')
% model

load('H_test');


test_mat = cell2mat(H_test);

[~,s] = size(test_mat); 
test_label_vector = ones(1,s) ;
% test_label_vector(1,50:100) = test_label_vector(1,50:100);
% test_label_vector(1,100:150) = test_label_vector(1,100:150);
% test_label_vector(1,150:200) = test_label_vector(1,150:200);


test_instance_matrix = test_mat;
test_label_vector = test_label_vector';
test_instance_matrix = test_instance_matrix';


[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_motorbikes);
[sortvals, sortidx] = sort(prob_estimates,'ascend');
motorbikes = sortidx(1:10);

[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_airplanes);
[sortvals, sortidx] = sort(prob_estimates,'ascend');
airplanes = sortidx(1:10);

[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_faces);
[sortvals, sortidx] = sort(prob_estimates,'ascend');
faces = sortidx(1:10);

[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_cars);
[sortvals, sortidx] = sort(prob_estimates,'ascend');
cars = sortidx(1:10);

publish_to_html(motorbikes,airplanes,cars,faces);



end

