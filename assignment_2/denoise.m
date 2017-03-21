function imOut = denoise(image, kernel_type, kernel_size)
kernel_edge = (kernel_size-1)/2;
[image_rows , image_columns] = size(image);
img =  uint8( zeros(image_rows + kernel_edge * 2 , image_columns + kernel_edge * 2 ));

[img_rows , img_columns,~] = size(img);
img(1+ kernel_edge : img_rows - kernel_edge , 1+kernel_edge : img_columns - kernel_edge) = image(1:image_rows , 1:image_columns);


%figure, imshow(image);
%figure, imshow(img);




denoised_image = img;
array =  zeros(kernel_size * kernel_size);
k=0;
for r = 1+kernel_edge : img_rows-kernel_edge
    for c = 1+kernel_edge : img_columns-kernel_edge
        
        
        for i = r - kernel_edge: r + kernel_edge
            for j = c - kernel_edge: c + kernel_edge 
                k=k+1;
                array(1,k) = img(i,j);
            end
        end
        
        if kernel_type == 2
            denoised_image(r, c) = median(array(1,:));
        end
        if kernel_type == 1
            denoised_image(r, c) = mean(array(1,:));
        end
        
        k=0;
        
    end
end


imOut = denoised_image;

end