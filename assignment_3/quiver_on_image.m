function  quiver_on_image(img,u,v)
   

    imshow(img);

    hold on;

    %fixing the image size and u,v vector size differences
   
   
    
    xgrid = 1:5:size(img,2);
    ygrid = 1:5:size(img,1);
    [xi,yi]=meshgrid(xgrid, ygrid);
    Vxi = interp2(u, xi, yi);
    Vyi = interp2(v, xi, yi); 

    
%     scale_factor = 5;
%     quiver(xgrid,ygrid,Vxi*scale_factor,-Vyi*scale_factor,'AutoScale','off');


    quiver(xgrid, ygrid, Vxi, -Vyi, 2, 'y');

        
    hold off;
    
   
    
end
    