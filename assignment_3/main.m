clc;
%% section 1
% harris_corner(imread('person_toy/00000001.jpg'));

% harris_corner(imread('pingpong/0000.jpeg'));
% figure,imshow(imread('pingpong/0000.jpeg'));
% im1 =im
% im1 = imread('synth1.pgm');
% im2 = imread('synth2.pgm');
% [u,v] =  lucas_kanade(im1, im2,15);
% 
% quiver_on_image(im1,u,v);

% im1 = imread('sphere1.ppm');
% im2 = imread('sphere2.ppm');
% [u,v] =  lucas_kanade(rgb2gray(im1), rgb2gray(im2),15);
% 
% quiver_on_image(im1,u,v);

%% section 4 - 1


 writerObj = VideoWriter('myVideo.avi');
 writerObj.FrameRate = 5;
 % open the video writer
 open(writerObj);
 
 
srcFiles = dir('person_toy/*.jpg'); 
i=1;
while i < length(srcFiles)
    filename = strcat('person_toy/',srcFiles(i).name);
    img1  = imread(filename);
    imgh1 = harris_corner_to_img(img1);
%     imshow((imgh1));
    filename = strcat('person_toy/',srcFiles(i+1).name);
    img2  = imread(filename);
    imgh2 = harris_corner_to_img(img2);
%     imshow((imgh2));
    
    i = i+1;
  
    [u,v] = lucas_kanade((imgh1), (imgh2));
 
    quiver_on_image(img1,u,v);
%     
    frame = getframe;
     
    writeVideo(writerObj, frame);
    
    disp(i);
end
     
  

 
 % close the writer object
 close(writerObj);
%  
 

%% section 4-2
% writerObj = VideoWriter('myVideo.avi');
% writerObj.FrameRate = 3;
%  % open the video writer
% open(writerObj);
%  
%  
% srcFiles = dir('pingpong/*.jpeg'); 
% i=1;
% while i < length(srcFiles)
%     filename = strcat('pingpong/',srcFiles(i).name);
%     img1  = imread(filename);
%     imgh1 = harris_corner_to_img(img1);
% %     imshow(uint8(imgh1));
%     filename = strcat('pingpong/',srcFiles(i+1).name);
%     img2  = imread(filename);
%     imgh2 = harris_corner_to_img(img2);
% %     imshow(uint8(imgh2));
%     
%     i = i+1;
%     
%     [u,v] = lucas_kanade((imgh1), (imgh2));
%     
%     quiver_on_image(img1,u,v);
%     
%     frame = getframe;
%      
%     writeVideo(writerObj, frame);
%     
%     disp(i);
% end
%  close(writerObj);

%% section 2
% im1 = imread('person_toy/00000001.jpg');
% [hr,hc] = harris_corner(im1)



% im2 = imread('person_toy/00000002.jpg');
% im2 = harris_corner(im2);
 
% [u,v]=  lucas_kanade(rgb2gray(im1), rgb2gray(im2),15);
% quiver_on_image(im1,u,v);


     
     

% figure,
% subplot(1,2,1), imshow(im1);
% subplot(1,2,2), imshow(im2);

% [u,v] =  lucas_kanade(im1, im2,15);
% 
% quiver_on_image(im1,u,v);




% Display the result
% figure;
% axis equal;

% imshow(imread('person_toy/00000002.jpg'));
% hold on
% quiver(u,v);
% % quiver(impyramid(impyramid(medfilt2(flipud(u), [5 5]), 'reduce'), 'reduce'), -impyramid(impyramid(medfilt2(flipud(v), [5 5]), 'reduce'), 'reduce'));
% hold off

% lucas_kanade(im(2), im(3),15);
% 
% lucas_kanade(im(3), im(4),15);



%  Define csv output format
% format = [];
% for i = 1:image_size
%   if (i == image_size)
%     format = [format '%g'];
%   else
%     format = [format '%g,'];
%   end
% end
% format = [format '\n'];

% Write flow vectors to output file
% file = fopen('output.csv', 'w');
% fprintf(file, format, u);
% fprintf(file, format, v);
% fclose(file);
