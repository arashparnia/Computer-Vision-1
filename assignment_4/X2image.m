 function imOut = X2image(im1,X)

[R,C] = size(im1);
RIX = floor(R * 1.2);
CIX = floor(C * 1.2);
IX = zeros(RIX,CIX,1);
for r = 1:RIX
    for c = 1:CIX
        b = [r;c];
        m = [X(1),X(2);X(3),X(4)];
        xy = pinv(m) * b ;
        x = ceil(xy(1))-10;
        y = ceil(xy(2))-150;
        if (x >0 && y >0 && x < R && y < C )
            IX(r,c) = im1(x,y) ;
        end
        
    end
end


imOut = IX;

end
