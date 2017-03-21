function [u, v] = lucas_kanade(img1,img2)
  
    %% image preprocess
    im1 = img1;
    im2= img2;
    if size(img1,3)==3
        im1 =double(rgb2gray(im1));
        
    end
    if size(img2,3)==3
        im2 = double(rgb2gray(im2));
    end
%     sigma =2;
%     im1 = imgaussfilt(double(im1),sigma);
%     im2 = imgaussfilt(double(im2),sigma);
    im1 = double(im1);
    im2 = double(im2);
    %% local variables
    window = 2;
    u = zeros(size(im1));
    v = zeros(size(im2));

    
    
    %% convolution for x and y and t
    dx = [-1 0 1; -1 0 1; -1 0 1]; % Derivative masks
    dy = dx';
    partial_x = conv2(im1, dx, 'valid');
%     partial_x = conv2(im1,[-1 1; -1 1],'valid');
    partial_y = conv2(im1, dy, 'valid');
%     partial_y = conv2(im1,[-1 -1; 1 1],'valid'); 
    partial_im1 = conv2(im1,ones(2),'valid');
    partial_im2 = conv2(im2, -ones(2), 'valid');
    partial_t = partial_im1 +  partial_im2; 
    
    %% moving the window
    for i = window+1:size(partial_x,1)-window
       for j = window+1:size(partial_x,2)-window
            % moving the window
            Ix = partial_x(i-window:i+window, j-window:j+window);
            Iy = partial_y(i-window:i+window, j-window:j+window);
            It = partial_t(i-window:i+window, j-window:j+window);
            % copying the values from the window
            Ix = Ix(:);
            Iy = Iy(:);
            b = -It(:); 
            
            % calculating the vector U
            % U  = (AT A)?1AT b.
            % U = pinv(A' * A) * A' * -IT(:);
            
            A = [Ix Iy];
%             U = pinv(A)*b; 
          
    
            U = pinv(A'*A)*A'*b;
      
            % finding non zero vectors
            if norm(U) > 0.9
                   u(i, j) = U(1) ;
                   v(i, j) = U(2) ;
            end
%             u(i, j) = U(1) ;
%             v(i, j) = U(2) ;
       end
    end
end
