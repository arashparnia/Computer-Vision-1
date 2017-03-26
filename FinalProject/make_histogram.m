function make_histogram()
run('vlfeat-0.9.20/toolbox/vl_setup.m')
vocabulary_size = 400;

%% reading training files
fileID = fopen('Caltech4/ImageSets/train_vocab.txt','r');
A = textscan(fileID,'%s');
A = A{1};
length_of_images = length(A);
images = {length_of_images};
d =[];
for i = 1 : length_of_images
     images{i}  = imread(strcat('Caltech4/ImageData/',strcat(A{i},'.jpg')));
     image = images{i};
     d_temp = get_descriptor(image);
     d = cat(2,d,d_temp);
end
fclose(fileID);

%% k-means clustering with vocabulary_size
size(d)

[centers] = kmeans(single(d), vocabulary_size); 
disp('Kmeans calculated');


%% histogram for each training image using HE fucntion
H_airplanes = image_path_to_hist('Caltech4/ImageSets/train_airplanes.txt',centers,vocabulary_size);
save('H_airplanes','H_airplanesH_airplanes');
disp('H_airplanes calculated');

H_motorbikes = image_path_to_hist('Caltech4/ImageSets/train_motorbikes.txt',centers,vocabulary_size);
save('H_motorbikes','H_motorbikes');
disp('H_motorbikes calculated');


H_faces = image_path_to_hist('Caltech4/ImageSets/train_faces.txt',centers,vocabulary_size);
save('H_faces','H_faces');
disp('H_faces calculated');


H_cars = image_path_to_hist('Caltech4/ImageSets/train_cars.txt',centers,vocabulary_size);
save('H_cars','H_cars');
disp('H_cars calculated');


H_test = image_path_to_hist('Caltech4/ImageSets/test.txt',centers,vocabulary_size);
save('H_test','H_test');
disp('H_test calculated');





histogram_to_classifer();

end
