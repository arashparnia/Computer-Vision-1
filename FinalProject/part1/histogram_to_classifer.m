function histogram_to_classifer(vocabulary_size,descriptor_type)

s = 100;

%% loading H 


% load('H_motorbikes');
% for i = 1:1:25
%     subplot(5,5,i);
%     X = H_motorbikes{i};
%     histogram(X, 'Normalization', 'count') %// plot normalized histogram
%     
% end
% 
file_name = strcat('saved/H_airplanes_',strcat( descriptor_type,int2str(vocabulary_size)));
load(file_name,'H_airplanes');
file_name = strcat('saved/H_motorbikes_',strcat( descriptor_type,int2str(vocabulary_size)));
load(file_name,'H_motorbikes');
file_name = strcat('saved/H_faces_',strcat( descriptor_type,int2str(vocabulary_size)));
load(file_name,'H_faces');
file_name = strcat('saved/H_cars_',strcat( descriptor_type,int2str(vocabulary_size)));
load(file_name,'H_cars');

training_airplanes = zeros(s,vocabulary_size);
for i = 1 : s
    training_airplanes(i,:) = H_airplanes{i};
end

training_motorbikes = zeros(s,vocabulary_size);
for i = 1 : s
    training_motorbikes(i,:) = H_motorbikes{i};
end

training_faces = zeros(s,vocabulary_size);
for i = 1 : s
    training_faces(i,:) = H_faces{i};
end

training_cars = zeros(s,vocabulary_size);
for i = 1 : s
    training_cars(i,:) = H_cars{i};
end




%% training airplanes
training_label_vector_airplanes = ones(s,1);
training_label_vector_airplanes = cat(1,training_label_vector_airplanes , zeros(s,1) ) ;
training_label_vector_airplanes = cat(1,training_label_vector_airplanes , zeros(s,1) ) ;
training_label_vector_airplanes = cat(1,training_label_vector_airplanes , zeros(s,1) ) ; 

training_instance_matrix_airplanes = training_airplanes;
training_instance_matrix_airplanes = cat(1,training_instance_matrix_airplanes,training_motorbikes);
training_instance_matrix_airplanes = cat(1,training_instance_matrix_airplanes,training_faces);
training_instance_matrix_airplanes = cat(1,training_instance_matrix_airplanes,training_cars);

%% training motorbikes
training_label_vector_motorbikes = ones(s,1);
training_label_vector_motorbikes = cat(1,training_label_vector_motorbikes , zeros(s,1) ) ;
training_label_vector_motorbikes = cat(1,training_label_vector_motorbikes , zeros(s,1) ) ;
training_label_vector_motorbikes = cat(1,training_label_vector_motorbikes , zeros(s,1) ) ; 

training_instance_matrix_motorbikes = training_motorbikes;
training_instance_matrix_motorbikes = cat(1,training_instance_matrix_motorbikes,training_airplanes);
training_instance_matrix_motorbikes = cat(1,training_instance_matrix_motorbikes,training_faces);
training_instance_matrix_motorbikes = cat(1,training_instance_matrix_motorbikes,training_cars);

%% training cars
training_label_vector_faces = ones(s,1);
training_label_vector_faces = cat(1,training_label_vector_faces , zeros(s,1) ) ;
training_label_vector_faces = cat(1,training_label_vector_faces , zeros(s,1) ) ;
training_label_vector_faces = cat(1,training_label_vector_faces , zeros(s,1) ) ; 

training_instance_matrix_faces = training_faces ;
training_instance_matrix_faces = cat(1,training_instance_matrix_faces,training_motorbikes);
training_instance_matrix_faces = cat(1,training_instance_matrix_faces,training_airplanes);
training_instance_matrix_faces = cat(1,training_instance_matrix_faces,training_cars);

%% training faces

training_label_vector_cars = ones(s,1);
training_label_vector_cars = cat(1,training_label_vector_cars , zeros(s,1) ) ;
training_label_vector_cars = cat(1,training_label_vector_cars , zeros(s,1) ) ;
training_label_vector_cars = cat(1,training_label_vector_cars , zeros(s,1) ) ; 


training_instance_matrix_cars = training_cars ;
training_instance_matrix_cars = cat(1,training_instance_matrix_cars,training_motorbikes);
training_instance_matrix_cars = cat(1,training_instance_matrix_cars,training_faces);
training_instance_matrix_cars = cat(1,training_instance_matrix_cars,training_airplanes);

%% make model 
best_motorbikes = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes), '-C -s 0');
model_motorbikes = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes), sprintf('-c %f -s 0', best_motorbikes(1))); % use the same solver: -s 0 
best_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes), '-C -s 0');
model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes), sprintf('-c %f -s 0', best_airplanes(1))); % use the same solver: -s 0 
best_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces), '-C -s 0');
model_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces), sprintf('-c %f -s 0', best_faces(1))); % use the same solver: -s 0 
best_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars), '-C -s 0');
model_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars), sprintf('-c %f -s 0', best_cars(1))); % use the same solver: -s 0 


% model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes),'-s 6' , '-t 0');
% model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes),'-s 6' , '-t 0');
% model_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces),'-s 6' , '-t 0');
% model_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars),'-s 6' , '-t 0');

% 5 -- L1-regularized L2-loss support vector classification\n"
% model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix),'-s 5');
% model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix),'-s 5');
% model_faces = train(training_label_vector_faces, sparse(training_instance_matrix),'-s 5');
% model_cars = train(training_label_vector_cars, sparse(training_instance_matrix),'-s 5');
% 
% model_motorbikes  = train(training_label_vector_motorbikes, sparse(training_instance_matrix_motorbikes));
% model_airplanes = train(training_label_vector_airplanes, sparse(training_instance_matrix_airplanes));
% model_faces = train(training_label_vector_faces, sparse(training_instance_matrix_faces));
% model_cars = train(training_label_vector_cars, sparse(training_instance_matrix_cars));


% model_motorbikes  = fitcsvm(training_instance_matrix_motorbikes,training_label_vector_motorbikes);
% model_airplanes  = fitcsvm(training_instance_matrix_airplanes,training_label_vector_airplanes);
% model_faces  = fitcsvm(training_instance_matrix_faces,training_label_vector_faces);
% model_cars  = fitcsvm(training_instance_matrix_cars,training_label_vector_cars);




% % save('model','model');
% 
% load('model')
% model
%% make predict
file_name = strcat('saved/H_test_',strcat( descriptor_type,int2str(vocabulary_size)));
load(file_name,'H_test');

test_instance_matrix = zeros(200,vocabulary_size);

for i = 1 : 200
    test_instance_matrix(i,:) = H_test{i};
end


% test_label_vector = cat(1,ones(50,1) ,zeros(150,1) ) ;
test_label_vector = zeros(200,1);
% test_label_vector(151:200) = 1;


% prob_estimates = prob_estimates(:,1);
[predict_label, accuracy, prob_estimates] = predict( test_label_vector , sparse(test_instance_matrix) , model_motorbikes  ,'-b 1');
% % show_all_images(predict_label);
[~, sortidx] = sort(prob_estimates(:,1),'descend');
motorbikes = sortidx;
AP = 0;
for i = 1: length(sortidx)
    AP = AP + predict_label(i) / i;
end
model_motorbikes_AP = AP / sum(predict_label)

% % 
% % 
[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_airplanes,'-b 1');
% % show_all_images(predict_label);
[~, sortidx] = sort(prob_estimates(:,1),'descend');
airplanes = sortidx;
AP = 0;
for i = 1: length(sortidx)
    AP = AP + predict_label(i) / i;
end
model_airplanes_AP = AP / sum(predict_label)


% % 
[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_faces,'-b 1');
% % show_all_images(predict_label);
[~, sortidx] = sort(prob_estimates(:,1),'descend');
faces = sortidx;
AP = 0;
for i = 1: length(sortidx)
    AP = AP + predict_label(i) / i;
end
model_faces_AP = AP / sum(predict_label)



% % 
[predict_label, accuracy, prob_estimates] = predict(test_label_vector, sparse(test_instance_matrix), model_cars,'-b 1');
% % show_all_images(predict_label);
[~, sortidx] = sort(prob_estimates(:,1),'descend');
cars = sortidx;
AP = 0;
for i = 1: length(sortidx)
    AP = AP + predict_label(i) / i;
end
model_cars_AP = AP / sum(predict_label)
% % 
% %% visualize
publish_to_html(motorbikes,model_motorbikes_AP,airplanes,model_airplanes_AP,cars,model_cars_AP,faces,model_faces_AP,vocabulary_size,descriptor_type);


end


