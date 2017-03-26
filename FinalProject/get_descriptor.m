function d = get_descriptor(image)
%% extracting features from R G B dimentions using vl_sift  with 5k vs vl_dsift 14 million
    d = [];
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
     [~, d] = vl_sift(image_1D);
    end 
end