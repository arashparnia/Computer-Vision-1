function imOut = harris_corner_to_img(img)
     %% Parameters
    gaussian_sigma = 4;          %gaussian sigma
    gaussian_window =4;
    thresh = 1000;      %used to cut off finding maxima
    window = 4;         %window to be used for finding local maxima
   
    im = double(rgb2gray(img));
    sigma =4;
    im = imgaussfilt(double(im),sigma);
    
    %% Image derivatives
    dx = [-1 0 1; -1 0 1; -1 0 1]; % Derivative masks
    dy = dx';
    Ix = conv2(im, dx, 'full');    
    Iy = conv2(im, dy, 'full');  
    
    %% Smoothed squared image derivatives
    g = fspecial('gaussian',gaussian_window, gaussian_sigma);
    
    A = conv2(Ix.^2, g, 'full'); 
    C = conv2(Iy.^2, g, 'full');
    B = conv2(Ix.*Iy, g, 'full');
    
    %% Harris corner measure
    %for H = (AC ?B2)?0.04(A+C)2
    H = (A.*C - B.^2) - 0.04 * (A + C).^2 ;

	%% Grey-scale dilate.        
	max_window = ordfilt2(H,window^2,ones(window));   % find max in the window
	H = (H==max_window)&(H>thresh);                % make sure maxima is not bigger than threshold
	
    %% Find row,col coords.
% 	[r,c] = find(H);               
	
    

    %% visualization
%     figure, imshow(Ix);
%     figure, imshow(Iy);
    

  
    [numOfRows, numOfColumns] = size(im);
    for x=1:numOfRows
       for y=1:numOfColumns
            if H(x,y) > 0
                
                im(x,y)= 255;
                
                im = insertShape(im,'circle',[y x 1],'LineWidth',2,'color','black');
                
            
            else
                im(x,y)= 0;
            end
                
       end
    end
   
    imOut = rgb2gray(im);

end
