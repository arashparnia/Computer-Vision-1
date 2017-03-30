
function d = get_descriptor(image, descriptor_type, step_size)
     % Types = 'dense','RGBsift', 'rgbsift', 'Oppsift'

    %% RGB SIFT
    if strcmp(descriptor_type,'RGBSIFT')
        d= vl_phow(image,'step', step_size , 'color','rgb');
    end
 
    %% rgb SIFT
    if strcmp(descriptor_type,'rgbSIFT')
        d = [];
        f = [];
        if size(image,3)==3 % if rgb
            image_1D = single(rgb2gray(image));
            %          [f_temp, ~] = vl_dsift(image_1D, 'size', 3) ;
            [f_temp, ~] = vl_sift(image_1D);
            %         [f_temp, ~] = vl_phow(image_1D) ;
            size(f_temp);
            for j = 1:3 %for each rbg dimentions
                [~,d_temp] = vl_sift(single(image(:,:,j)),'frames',f_temp);
                d = cat(2,d,d_temp);
            end
        else %if not rgb
            image_1D = single(image);
            d = vl_sift(image_1D);
        end 
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
        
        d = vl_sift(image, 'frames', f);
    end

end