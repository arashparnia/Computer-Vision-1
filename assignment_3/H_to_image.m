function imOut = H_to_image(H,im)

 [numOfRows, numOfColumns] = size(im);
    for x=1:numOfRows
       for y=1:numOfColumns
            if H(x,y) > 0
                im(x,y,1)= 255;
                im(x,y,2)= 255;
                im(x,y,3)= 255;
            
            else
%                 img(x,y,1)= 0;
%                 img(x,y,2)= 0;
%                 img(x,y,3)= 0;
            end
                
       end
    end
    imOut = im;
end
