function visualize(input_image)

%create visualization of 3 images in one figure
figure(1)

subplot(3,1,1)
imshow(input_image(:,:,1)) 
subplot(3,1,2)
imshow(input_image(:,:,2))
subplot(3,1,3)
imshow(input_image(:,:,3))
end

