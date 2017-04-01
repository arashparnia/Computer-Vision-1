function H= image_path_to_hist(image_txt,centers,vocabulary_size,descriptor_type,step_size)

%% histogram for each training image using HE fucntion
fileID = fopen(image_txt,'r');
A = textscan(fileID,'%s');
A = A{1};
length_of_images = length(A);
images = {length_of_images};
D = cell(1,length_of_images);
for i = 1 : length_of_images
     images{i}  = imread(strcat('Caltech4/ImageData/',strcat(A{i},'.jpg')));
     image = images{i};
     D{i} = get_descriptor(image,descriptor_type,step_size);
end
fclose(fileID);

    H = cell(1,length_of_images);
for i = 1 : length(A)
    H{i} = HE(D{i},centers,vocabulary_size) ;
end

end
