function make_histogram(vocabulary_size,descriptor_type,step_size)


%% reading training files
fileID = fopen('Caltech4/ImageSets/train_vocab.txt','r');
A = textscan(fileID,'%s');
A = A{1};
length_of_images = length(A);
images = {length_of_images};
D =[];
for i = 1 : length_of_images
     images{i}  = imread(strcat('Caltech4/ImageData/',strcat(A{i},'.jpg')));
     image = images{i};
     d_temp = get_descriptor(image,descriptor_type,step_size);
     D = cat(2,D,d_temp);
end
fclose(fileID);
disp('vocabulary calculated');

%% k-means clustering with vocabulary_size
[centers] = kmeans(single(D), vocabulary_size); 
centers = centers';
disp('Kmeans centers calculated');

% file_name = strcat('part1/saved/centers_',vocabulary_size);
% save(file_name,'centers');
% 
% load(file_name,'centers');


%% histogram for each training image using HE fucntion
H_airplanes = image_path_to_hist('Caltech4/ImageSets/train_airplanes.txt',centers,vocabulary_size,descriptor_type,step_size);
file_name = strcat('part1/saved/H_airplanes_',strcat( descriptor_type,vocabulary_size));
save(file_name,'H_airplanes');
disp('H_airplanes calculated');

H_motorbikes = image_path_to_hist('Caltech4/ImageSets/train_motorbikes.txt',centers,vocabulary_size,descriptor_type,step_size);
file_name = strcat('part1/saved/H_motorbikes_',strcat( descriptor_type,vocabulary_size));
save(file_name,'H_motorbikes');
disp('H_motorbikes calculated');


H_faces = image_path_to_hist('Caltech4/ImageSets/train_faces.txt',centers,vocabulary_size,descriptor_type,step_size);
file_name = strcat('part1/saved/H_faces_',strcat( descriptor_type,vocabulary_size));
save(file_name,'H_faces');
disp('H_faces calculated');


H_cars = image_path_to_hist('Caltech4/ImageSets/train_cars.txt',centers,vocabulary_size,descriptor_type,step_size);
file_name = strcat('part1/saved/H_cars_',strcat( descriptor_type,vocabulary_size));
save(file_name,'H_cars');
disp('H_cars calculated');


H_test = image_path_to_hist('Caltech4/ImageSets/test.txt',centers,vocabulary_size,descriptor_type,step_size);
file_name = strcat('part1/saved/H_test_',strcat( descriptor_type,vocabulary_size));
save(file_name,'H_test');
disp('H_test calculated');


end
