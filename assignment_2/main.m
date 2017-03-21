function main 
clear; 
clc;

% image = imread('image2.jpeg');
% image = rgb2gray(image);
% 
% figure;
% subplot(1,5,1) , imshow(image);
% title('original image');
% subplot(1,5,2) , imshow(denoise(image,1,3));
% title('3x3 kernel image');
% subplot(1,5,3) , imshow(denoise(image,1,5));
% title('5x5 kernel image');
% subplot(1,5,4) , imshow(denoise(image,1,7));
% title('7x7 kernel image');
% subplot(1,5,5) , imshow(denoise(image,1,9));
% title('9x9 kernel image');
% 
% figure;
% subplot(1,4,1) , imshow(image);
% title('original image');
% subplot(1,4,2) , imshow(denoise(image,2,3));
% title('3x3 kernel image');
% subplot(1,4,3) , imshow(denoise(image,2,5));
% title('5x5 kernel image');
% subplot(1,4,4) , imshow(denoise(image,2,7));
% title('7x7 kernel image');
% 
% 
% image = imread('image3.jpeg');
% % image = rgb2gray(image);
% [im_magnitude ,im_direction]= compute_gradient(image);
% figure;
% subplot(1,3,1) , imshow(image);
% title('original image');
% subplot(1,3,2) ,imshow(uint8(im_magnitude));
% title('maginitude image');
% subplot(1,3,3) ,imshow((im_direction));
% title('direction image');
% 
% 
% 
% 
% image = imread('image4.jpeg');
% figure;
% subplot(1,2,1)
% imshow(image)
% title('Original Image');
% subplot(1,2,2)
% imshow(uint8(unsharp(image,1.76,9,3)));
% title('unsharpened image')


img = myHistMatching(imread('input.png'), imread('reference.png'));


[X, map] = imread('Images/image1.jpeg');
if ~isempty(map)
    image = ind2gray(X,map);
end
% 
% figure;
% subplot(1,4,1) , imshow(image);
% title('Original Image');
% subplot(1,4,2) , imshow(compute_LoG(image, 1));
% title('first method ');
% subplot(1,4,3),imshow(compute_LoG(image, 2));
% title('second method ');
% subplot(1,4,4),imshow(compute_LoG(image, 3));
% title('third method');
end



