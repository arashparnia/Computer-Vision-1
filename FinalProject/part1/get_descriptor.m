
function d = get_descriptor(image, descriptor_type, step_size)
     % Types = 'keypoints','dense','RGB_sift', 'rgb_sift', 'Oppsift'
    %% keypoint SIFT
    if strcmp(descriptor_type,'keypoints')
        image = single(image);
        if size(image,3) ==3 
            image = rgb2gray(image);
        end
        [f, ~] = vl_sift(image);
        if size(image,3) > 1
            [~ , d_1] = vl_sift(image(:,:,1), 'frames', f);
            [~ , d_2] = vl_sift(image(:,:,1), 'frames', f);
            [~ , d_3] = vl_sift(image(:,:,1), 'frames', f);
            d = horzcat( d_1,d_2,d_3);
        else
            [~ , d] = vl_sift(image(), 'frames', f);
        end
       
    end
    %% RGB SIFT
    if strcmp(descriptor_type,'RGB_sift')
        d= vl_phow(single(image),'step', step_size , 'color','rgb');
    end
 
    %% rgb SIFT
    if strcmp(descriptor_type,'norm_rgb_sift')
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

    %% Opponent SIFT
    if strcmp(descriptor_type,'opponent')
        d = vl_phow(single(image),'step', step_size,'color','opponent');
    end
    %% Dense SIFT
    if strcmp(descriptor_type,'dense')
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
            [~ , d_2] = vl_sift(image(:,:,1), 'frames', f);
            [~ , d_3] = vl_sift(image(:,:,1), 'frames', f);
            d = horzcat( d_1,d_2,d_3);
        else
            [~ , d] = vl_sift(image(), 'frames', f);
        end
    end
    

end