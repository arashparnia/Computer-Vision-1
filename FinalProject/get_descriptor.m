% Types = 'dense', 'keypoints', 'RGBsift', 'rgbsift', 'Oppsift'

% function d = get_descriptor(image)
% %% extracting features from R G B dimentions using vl_sift  with 5k vs vl_dsift 14 million
%     d = [];
%     if size(image,3)==3 % if rgb
%          image_1D = single(rgb2gray(image));
% %          [f_temp, ~] = vl_dsift(image_1D, 'size', 3) ;
%       [f_temp, ~] = vl_sift(image_1D);
% %         [f_temp, ~] = vl_phow(image_1D) ;
%         size(f_temp);
%      for j = 1:3 %for each rbg dimentions
%         [~,d_temp] = vl_sift(single(image(:,:,j)),'frames',f_temp);
%         d = cat(2,d,d_temp);
%      end
%     else %if not rgb
%      image_1D = single(image);
%      [~, d] = vl_sift(image_1D);
%     end 
% end

function [ f , d ] = get_descriptor(image, type, step_size)
     
    
    %% Dense SIFT
    if strcmp(type,'dense')
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
        
        [f, d] = vl_sift(image, 'frames', f);
    end
    
    %% Point SIFT
%     if strcmp(type,'keypoints')
%         
%         % Convert to grayscale
%         if size(image,3) >1
%             image = rgb2gray(image);
%         end
% 
%         [f, d] = vl_sift(image);
%     end
% 
%     % RGB SIFT
%     if strcmp(type,'RGBSIFT')
%         [f,d] = vl_phow(image,'color','rgb','step', step_size);
%     end
%     
%     % rgb SIFT
%     if strcmp(type,'rgbSIFT')
%         if size(image,3) == 1
%             r = image(:,:);
%             g = image(:,:);
%             b = image(:,:);
%         else
%             r = image(:,:,1);
%             g = image(:,:,2);
%             b = image(:,:,3);
%         end
%         
%         [a1,b1] = size(r);
%         
%         sumrgb = r + g + b;
%         r = double(r) ./ double(sumrgb);
%         g = double(g) ./ double(sumrgb);
%         b = double(b) ./ double(sumrgb);
%         
%         normImage = zeros(a1, b1, 3 );
% 
%         normImage(:,:,1) = r ;
%         normImage(:,:,2) = g ;
%         normImage(:,:,3) = b ;
%         
%         normImage = im2single(normImage);
%         
%         [~ , d1] = vl_sift(normImage(:,:,1));
%         [~ , d2] = vl_sift(normImage(:,:,2));
%         [~ , d3] = vl_sift(normImage(:,:,3));
%         d = [d1';d2';d3'];
%         d = d';
%         f = 0;
%     end
% 
%     % Opponent SIFT
%     if strcmp(type,'opponent')
%         [f,d] = vl_phow(image,'color','opponent', 'step', step_size);
%     end

    

end