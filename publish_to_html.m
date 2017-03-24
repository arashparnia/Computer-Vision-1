function publish_to_html(motorbikes,airplanes,cars,faces)
fileID = fopen('Caltech4/ImageSets/test.txt','r');
A = textscan(fileID,'%s');
A = A{1};
for i = 1 :40
    i1 = motorbikes(i);
    i2 = airplanes(i);
    i3 = cars(i);
    i4 = faces(i);
    image1  = imread(strcat('Caltech4/ImageData/',strcat(A{i1},'.jpg')));
    image2  = imread(strcat('Caltech4/ImageData/',strcat(A{i2},'.jpg')));
    image3  = imread(strcat('Caltech4/ImageData/',strcat(A{i3},'.jpg')));
    image4  = imread(strcat('Caltech4/ImageData/',strcat(A{i4},'.jpg')));
    
    subplot(4,10,i),imshow(image1);
    subplot(4,10,i),imshow(image2);
    subplot(4,10,i),imshow(image3);
    subplot(4,10,i),imshow(image4);
end
fclose(fileID);

end
