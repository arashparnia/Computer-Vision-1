function imOut = compute_LoG(image, LOG_type) 
    image = double(image);
   
    kernel_size = 5 ;
    sigma = 0.5;
    alpha = 0.5;
    
    if LOG_type == 1 
        hg = fspecial('gaussian', [kernel_size kernel_size], sigma) ; 
        imguess = imfilter(image , hg);

        hl = fspecial('laplacian', alpha);
        imlap = imfilter(imguess ,hl);

        imOut = uint8(imlap);
    end
    
    if LOG_type == 2
    
        hlog = fspecial('log', [kernel_size kernel_size], sigma);
        imOut = uint8(imfilter(image ,hlog));
    end
    
    if LOG_type == 3
        sigma1 = 1.2;
        sigma2 = 0.75;
        [R,C] = size(image);
        imgOut = zeros(R,C);
        hg1 = fspecial('gaussian', [kernel_size kernel_size], sigma1) ; 
        imguess1 = imfilter(image , hg1);
        hg2 = fspecial('gaussian', [kernel_size kernel_size], sigma2) ; 
        imguess2 = imfilter(image , hg2);

        for r = 1:R
            for c = 1:C
                imgOut(r,c) =   imguess1(r,c)- imguess2(r,c)  ;
            end
        end
    
        imOut = imgOut;
     end
     


end

