function d = get_descriptor(image)
%% extracting features from R G B dimentions using vl_sift  with 5k vs vl_dsift 14 million
    d = [];
    if size(image,3)==3 % if rgb
     image_1D = single(rgb2gray(image));
     [f_temp, ~] = vl_sift(image_1D);
     for j = 1:3 %for each rbg dimentions
        I_ = vl_imsmooth(im2double(image(:,:,j)), sqrt(f_temp(3)^2 - 0.5^2)) ;
        [Ix, Iy] = vl_grad(I_) ;
        grd = single(shiftdim(cat(3,sqrt(Ix.^2 + Iy.^2) ,atan2(Iy,Ix) ),2));
        d_temp = vl_siftdescriptor(grd, f_temp) ;
        d = cat(2,d,d_temp);
     end
    else %if not rgb
     image_1D = single(image);
     [~, d] = vl_sift(image_1D);
    end 
end