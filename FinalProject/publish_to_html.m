function publish_to_html(motorbikes,airplanes,cars,faces)
fileID = fopen('Caltech4/ImageSets/test.txt','r');
A = textscan(fileID,'%s');
A = A{1};
s=1;
for i = 1 :10
    image1_file = strcat('Caltech4/ImageData/',strcat(A{motorbikes(i)},'.jpg'));
    image1  = imread(image1_file);
    image2_file = strcat('Caltech4/ImageData/',strcat(A{airplanes(i)},'.jpg'));
    image2  = imread(image2_file);
    image3_file = strcat('Caltech4/ImageData/',strcat(A{cars(i)},'.jpg'));
    image3  = imread(image3_file);
    image4_file = strcat('Caltech4/ImageData/',strcat(A{faces(i)},'.jpg'));
    image4  = imread(image4_file);
    
    subplot(10,4,s),imshow(image1);s=s+1;title(image1_file);
    subplot(10,4,s),imshow(image2);s=s+1;title(image2_file);
    subplot(10,4,s),imshow(image3);s=s+1;title(image3_file);
    subplot(10,4,s),imshow(image4);s=s+1;title(image4_file);
end
fclose(fileID);

end
