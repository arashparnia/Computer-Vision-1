function main 
clear; 
clc;
%image_dir = 'Images';


%img = imread(fullfile(image_dir, 'refrence.png'));

kernal_size = 3;
image = imread('image2.jpeg');

[image_rows , image_columns,~] = size(image);
img =  uint8( zeros(image_rows + kernal_size * 2 , image_columns + kernal_size * 2 ,3));

[img_rows , img_columns,~] = size(img);
img(1+ kernal_size : img_rows - kernal_size , 1+kernal_size : img_columns - kernal_size,:) = image(1:image_rows , 1:image_columns,:);


%figure, imshow(image);
%figure, imshow(img);


array =  uint8(zeros(1,kernal_size * kernal_size,3))

denoised_image = img;
k=0;
for c = 1+kernal_size : img_rows-kernal_size
    for r = 1+kernal_size : img_columns-kernal_size
        
        for i = c - kernal_size/2: c + kernal_size/2 
            for j = r - kernal_size/2: r + kernal_size/2 
                k=k+1;
                array(k,:) = img(c,r,:);
            end
        end
        denoised_image(c, r) = mean(array);
    end
end

figure, imshow(img);
figure, imshow(denoised_image);
%figure, imshow(uint8(B));

end



