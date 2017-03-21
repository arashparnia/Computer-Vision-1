function imOut = unsharp(image , sigma , kernel_size , k)
f = fspecial('gaussian',[kernel_size kernel_size], sigma);
guss_img = imfilter(image,f);
%since its ok to use fspecial we are using it. However, a gaussConv function is 
%implemented as well. 
%guss_img = gaussConv(image,sigma,sigma,kernel_size);
[R,C] = size(image);
highpassed_img = zeros(R,C);
unsharp_image = zeros(R,C);
for r = 1:R
    for c = 1:C
        highpassed_img(r,c) =  image(r,c) - guss_img(r,c) ;
        unsharp_image(r,c) = image(r,c) + k * highpassed_img(r,c);
    end
end



imOut = unsharp_image;


end
