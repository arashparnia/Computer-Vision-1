function grayvis(input_image)

%create visualization of 4 images in one figure
figure(1)

subplot(2,2,1)
imshow(input_image(:,:,1))
subplot(2,2,2)
imshow(input_image(:,:,2))
subplot(2,2,3)
imshow(input_image(:,:,3))
subplot(2,2,4)
imshow(input_image(:,:,4))

end