function show_all_images(indexes)
fileID = fopen('Caltech4/ImageSets/test.txt','r');
A = textscan(fileID,'%s');
A = A{1};
s=1;
figure;
for i = 1 :length(indexes)
    if indexes(i) == 1
        image_file = strcat('Caltech4/ImageData/',strcat(A{(i)},'.jpg'));
        image  = imread(image_file);
        subplot(10,10,s),imshow(image);s=s+1;
    end
end
fclose(fileID);


end
