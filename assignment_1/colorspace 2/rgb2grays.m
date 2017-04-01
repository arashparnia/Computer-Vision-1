function [output_image] = rgb2grays(input_image)
% converts an RGB into grayscale by using 4 different methods

%get the red, green and blue channels
[R,G,B] = getColorChannels(input_image);

% lightness method: most prominent and least colors (max(R,G,B)+min(R,G,B))/2
G1 = (max(input_image,[],3) + min(input_image,[],3))/2 ;

% average method: average of the values: (R+G+B)/3
total = R+G+B;
G2 = (total)/3; 
 
% luminosity method: average sensitivy 0.21R+0.72G+0.07B
G3 = 0.21*R + 0.72*G + 0.07*B;

% built-in MATLAB function 
G4 = rgb2gray(input_image);

%create 4 images for visualization
output_image(:,:,1)=G1;
output_image(:,:,2)=G2;
output_image(:,:,3)=G3;
output_image(:,:,4)=G4;

end
