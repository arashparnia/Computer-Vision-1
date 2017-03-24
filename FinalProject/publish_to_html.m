function publish_to_html(motorbikes,airplanes,cars,faces)
fileID = fopen('Caltech4/ImageSets/test.txt','r');
A = textscan(fileID,'%s');
A = A{1};
s=1;
for i = 1 :10
  
    image1  = imread(strcat('Caltech4/ImageData/',strcat(A{motorbikes(i)},'.jpg')));
    image2  = imread(strcat('Caltech4/ImageData/',strcat(A{airplanes(i)},'.jpg')));
    image3  = imread(strcat('Caltech4/ImageData/',strcat(A{cars(i)},'.jpg')));
    image4  = imread(strcat('Caltech4/ImageData/',strcat(A{faces(i)},'.jpg')));
    
    subplot(10,4,s),imshow(image1);s=s+1;
    subplot(10,4,s),imshow(image2);s=s+1;
    subplot(10,4,s),imshow(image3);s=s+1;
    subplot(10,4,s),imshow(image4);s=s+1;
end
fclose(fileID);

end
