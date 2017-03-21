function [im_magnitude ,im_direction] = compute_gradient(image)
%img=image;

imgd=double(image);
[r,c] = size(image);
gxx =double(image);
gyy =double(image);
imgd_magnitude = zeros(r,c );
imgd_direction = zeros(r,c );

for i=1:size(imgd,1)-2
    for j=1:size(imgd,2)-2
        %Sobel mask for x-direction:
        Gx=((2*imgd(i+2,j+1)+imgd(i+2,j)+imgd(i+2,j+2))-(2*imgd(i,j+1)+imgd(i,j)+imgd(i,j+2)));
        
        %Sobel mask for y-direction:
        Gy=((2*imgd(i+1,j+2)+imgd(i,j+2)+imgd(i+2,j+2))-(2*imgd(i+1,j)+imgd(i,j)+imgd(i+2,j)));
        
        gxx(i,j) = Gx;
        gyy(i,j) = Gy;
        %The gradient of the image
        imgd_magnitude(i,j) = sqrt(Gx.^2+Gy.^2);
        imgd_direction(i,j) = atan(Gy/Gx);
    end
end
%figure,imshow(img); title('Sobel gradient');
 im_magnitude = imgd_magnitude ;
 im_direction =imgd_direction; 
 
 figure;
 subplot(1,2,1),imshow(uint8(gxx));
 title ('x direction');
 subplot(1,2,2),imshow(uint8(gyy));
 title ('y direction');
end