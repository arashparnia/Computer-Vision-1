
function d = get_descriptor(image, descriptor_type, step_size)
     % sift types = sift_RGB , sift_rgb_norm , sift_opponent
     % dense sift types = dense_RGB , dense_rgb_norm , dense_opponent
    %% sift_RGB
    if strcmp(descriptor_type,'sift_RGB')
        image = single(image);
        if size(image,3) == 3
            [~ , d_1] = vl_sift(image(:,:,1));
            [~ , d_2] = vl_sift(image(:,:,2));
            [~ , d_3] = vl_sift(image(:,:,3));
            d = horzcat( d_1,d_2,d_3);
        else
            [~ , d] = vl_sift(image());
        end
       
    end
 
    %% sift_rgb_norm
    if strcmp(descriptor_type,'sift_rgb_norm')
        if size(image,3) > 1
            r = image(:,:,1);
            g = image(:,:,2);
            b = image(:,:,3);
        else
            r = image(:,:);
            g = image(:,:);
            b = image(:,:);
        end
        [h,w] = size(g);
        sum = r + g + b;
        r = double(r) ./ double(sum);
        g = double(g) ./ double(sum);
        b = double(b) ./ double(sum);
        norm = zeros(h, w, 3 );
        norm(:,:,1) = r;
        norm(:,:,2) = g;
        norm(:,:,3) = b;
        norm = im2single(norm);
       
        [~ , d_1] = vl_sift(norm(:,:,1));
        [~ , d_2] = vl_sift(norm(:,:,2));
        [~ , d_3] = vl_sift(norm(:,:,3));
        d = horzcat( d_1,d_2,d_3);
    end

    %% sift_opponent
    if strcmp(descriptor_type,'sift_opponent')
        if size(image,3) > 1
            R = image(:,:,1);
            G = image(:,:,2);
            B = image(:,:,3);
        else
            R = image(:,:);
            G = image(:,:);
            B = image(:,:);
        end
        O1=(R-G)/sqrt(2);
        O2=(R+G-(2*B))/sqrt(6);
        O3=(R+G+B)/sqrt(3);

        image(:,:,1)=O1;
        image(:,:,2)=O2;
        image(:,:,3)=O3;
        image = single(image);
        [~ , d_1] = vl_sift(image(:,:,1));
        [~ , d_2] = vl_sift(image(:,:,2));
        [~ , d_3] = vl_sift(image(:,:,3));
        d = horzcat( d_1,d_2,d_3);
                
    end
    
    
    
    %% dense_rgb_norm
    if strcmp(descriptor_type,'dense_rgb')
        d= vl_phow(single(image),'step', step_size , 'color','rgb');
    end
    %% dense_RGB
    if strcmp(descriptor_type,'dense_RGB_')
        b = 8 ; %binsize
        m = 3 ;
        if size(image,3) == 3
            image = rgb2gray(image);
        end
        image = im2single(image);
        image_smooth = vl_imsmooth(image, sqrt((b/m)^2 - .25));
        [f, ~] = vl_dsift(image_smooth, 'step', step_size , 'size', b ) ;
        f(3,:) = b/m ;
        f(4,:) = 0 ;
        
        if size(image,3) > 1
            [~ , d_1] = vl_sift(image(:,:,1), 'frames', f);
            [~ , d_2] = vl_sift(image(:,:,2), 'frames', f);
            [~ , d_3] = vl_sift(image(:,:,3), 'frames', f);
            d = horzcat( d_1,d_2,d_3);
        else
            [~ , d] = vl_sift(image(), 'frames', f);
        end
    end
    
    %% dense_opponent
    if strcmp(descriptor_type,'dense_opponent')
        d = vl_phow(single(image),'step', step_size,'color','opponent');
    end
end