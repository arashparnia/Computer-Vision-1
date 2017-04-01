function [output_image] = rgb2normedrgb(input_image)
%converts an RGB image into normalized rgb

output_image = zeros(size(input_image));

%get the red, green and blue channels
[R,G,B] = getColorChannels(input_image);

%sum of red, green and blue
total=R+G+B;

r=R./total;
g=G./total;
b=B./total;

%create 3 images for the visualization
output_image(:,:,1)=r;
output_image(:,:,2)=g;
output_image(:,:,3)=b;

end

