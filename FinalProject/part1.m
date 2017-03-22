function part1


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
vocabulary_size = 1200 ; 
[centers] = kmeans(single(d), vocabulary_size); 


%% histogram for each training image using HE fucntion
H_faces = image_path_to_hist('Caltech4/ImageSets/train_faces.txt',centers,vocabulary_size);

  % saving H to file  
save('H_faces','H_faces');




% train(training_label_vector, training_instance_matrix, 'liblinear_options', 'col');


end