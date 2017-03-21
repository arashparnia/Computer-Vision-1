function imOut = stitch(im1,im2)
%% image preprocessing
im1 = rgb2gray(im1);
im2 = rgb2gray(im2);
%% getting feature points
img1 = single(double(im1)) ;
[f1, d1] = vl_sift(img1) ;

img2 = single(double(im2)) ;
[f2, d2] = vl_sift(img2) ;
%% matching the feature points
[matches, scores] = vl_ubcmatch(d1, d2,100) ;
%% making transformation matrix
X = rsac(matches,f1,f2);
%% transforimg image 2 using the affine transformation matrix
im3 = zeros(size(im1));
[x2,y2] = size(im2);
[R,C] = size(im3);
for r = 1:R
    for c = 1:C
        b = [r;c];
        m = [X(1),X(2);X(3),X(4)];
        xy = pinv(m) * b ;
        x = ceil(xy(1)) - 30;
        y = ceil(xy(2)) + 92;
        if (x >0 && y >0 && x < x2 && y < y2)
            im3(r,c) = im2(x,y) ;
        end
        
    end
end

%% visualizing
figure,imshow(im1);
figure,imshow(im2);
imOut =cat(2,im1,im3); 
%% extra junk
% blender = vision.AlphaBlender('Operation', 'Binary mask', ...
%     'MaskSource', 'Input port');
% 
% % Create a 2-D spatial reference object defining the size of the panorama.
% xLimits = [xMin xMax];
% yLimits = [yMin yMax];
% panoramaView = imref2d([height width], xLimits, yLimits);
% 
% % Create the panorama.
% for i = 1:numImages
% 
%     I = im1;
% 
%     % Transform I into the panorama.
%     warpedImage = imwarp(I, tforms(i), 'OutputView', panoramaView);
% 
%     % Generate a binary mask.
%     mask = imwarp(true(size(I,1),size(I,2)), tforms(i), 'OutputView', panoramaView);
% 
%     % Overlay the warpedImage onto the panorama.
%     panorama = step(blender, panorama, warpedImage, mask);
% end
% 
% figure
% imshow(panorama)

%% extra 
% H = [ X(1), X(2), 0; X(3), X(4), 0; X(5),X(6), 1 ];
% tform = affine2d(H);
% im3 = imwarp(im2,tform,'nearest');
% 
% 
% 
% T=maketform('affine' , H);
% T.tdata.T
% [im2t,xdataim2t,ydataim2t]=imtransform(im2,T);
% 
% % now xdataim2t and ydataim2t store the bounds of the transformed im2
% xdataout=[min(1,xdataim2t(1)) max(size(im1,2),xdataim2t(2))];
% ydataout=[min(1,ydataim2t(1)) max(size(im1,1),ydataim2t(2))];
% % let's transform both images with the computed xdata and ydata
% im2t=imtransform(im2,T,'XData',xdataout,'YData',ydataout);
% im1t=imtransform(im1,maketform('affine',eye(3)),'XData',xdataout,'YData',ydataout);
% 
% ims=im1t+ im2t;
% figure, imshow(ims);

% imd=uint8(abs(double(im1t)-double(im2t)));
% % the casts necessary due to the images' data types
% imshow(imd);

% figure,imshow(im1);
% figure,imshow(im2);



% for x = 1:x1
%     for y = 1:y1
%         imOut(x,y) = im1(x,y);
%     end
% end
% for x = 1:x2
%     for y = 1:y2
%         imOut(x+x1,y+y1) = im2(x,y);
%     end
% end


end
