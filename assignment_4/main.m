clc;
run('vlfeat-0.9.20/toolbox/vl_setup');
s = RandStream('mt19937ar','Seed',1);
RandStream.setGlobalStream(s);

%% image 1
im1 = imread('boat1.pgm');
% figure, imshow(im1);
img1 = single(im1) ;



[f1, d1] = vl_sift(img1) ;

% perm = randperm(size(f1,2)) ;
% sel = perm(1:50) ;
% h1 = vl_plotframe(f1(:,sel)) ;
% h2 = vl_plotframe(f1(:,sel)) ;
% set(h1,'color','k','linewidth',3) ;
% set(h2,'color','y','linewidth',2) ;


%% image 2
im2 = imread('boat2.pgm');
% figure,imshow(im2);
img2 = single(img2) ;


[f2, d2] = vl_sift(img2) ;

% perm = randperm(size(f2,2)) ;
% sel = perm(1:50) ;
% h1 = vl_plotframe(f2(:,sel)) ;
% h2 = vl_plotframe(f2(:,sel)) ;
% set(h1,'color','k','linewidth',3) ;
% set(h2,'color','y','linewidth',2) ;


%% image 1 and 2 matching
[matches, scores] = vl_ubcmatch(d1, d2) ;

%% calculating the transformstion matrix X
X = rsac(matches,f1,f2);

%% translating the image

figure,imshow(uint8(X2image(im2,X)));
% X=  [0.8650;0.2265;-0.1123;1.0662;0.0107;0.1821];


% [R,C] = size(im1);
% IX = zeros(size(im1)*2);
% 
% for r = -R:R
%     for c = -C:C
%         b = [r;c];
%         m = [X(1),X(3);X(2),X(4)];
%         A = pinv(m)* b ;
% %         A = [x,y,0,0,1,0 ; 0,0,x,y,0,1];
% %         b = A * X;
% %         IX(ceil(b(1)),ceil(b(2))) = im1(x,y);
% 
%         if (A(1) < R && A(1) > 1) && ( A(2) < C && A(2) > 1) 
%             x = round(A(1));
%             y  = round(A(2));
%             IX(R/2-50+r,C/2-50+c) = im1(x,y) ;
%         end
%     end
% end
% 
% figure,imshow(uint8(IX));

% H = [ X(1), X(3), 0; X(2), X(4), 0; 0, 0, 1 ];
% tform = affine2d(H);
% J = imwarp(im1,tform);
% figure, imshow(J);



%% transforimg image 2 to image 1 
% [matches2, scores2] = vl_ubcmatch(d2, d1) ;
% X2 = rsac(matches2,f2,f1);
% H2 = [ X2(1) ,X2(3), 0; X2(2), X2(4) ,0; 0, 0, 1 ];
% tform2 = affine2d(H2);
% J2 = imwarp(im2,tform2);
% figure, imshow(J2);


%% drawing lines


% figure(), imshow(cat(2, im1, im2)) ;
% 
% x1 = f1(1,matches(1,:)) ;
% x2 = f2(1,matches(2,:)) + size(im1,2) ;
% y1 = f1(2,matches(1,:)) ;
% y2 = f2(2,matches(2,:)) ;
% hold on ;
% l = line([x1 ; x2], [y1 ; y2]) ;
% set(l,'linewidth', 1, 'color', 'b') ;
% vl_plotframe(fa(:,matches(1,:))) ;
% f2(1,:) = f2(1,:) + size(im1,2) ;
% vl_plotframe(f2(:,matches(2,:))) ;
% hold off




%% Stiching
% im1 = imread('left.jpg');
% im2 = imread('right.jpg');
% ims = stitch(im1,im2) ; 
% figure,imshow(uint8(ims));
