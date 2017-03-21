function X_out = rsac(matches,f1,f2)


N = 100;n =N;
P = 3;
r = 5;
[~ , m_size] = size(matches);
max_matched = 0;
best_x = 0;


while N > 0
    N = N -1;
    %% calculating transformation from random P points
    A = [];
    b = [];
    p = P;
    while p > 0
        p = p -1;
        r = randi([1 m_size],1,1);
        m = [matches(1,r) , matches(2,r)];
        x = f1(1,m(1));
        y = f1(2,m(1));
        xp = f2(1,m(2));
        yp = f2(2,m(2));
        A = cat(1, A , [x,y,0,0,1,0 ; 0,0,x,y,0,1]);
        b = cat(1,b ,[xp;yp]);
    end
    X = pinv(A)*b;
    
%         X = pinv(A.' * A) * (A.' * b)  
%      (AT A)?1AT b
    
    %% testing transformation
    matched = 0;
    for i = 1:length(matches)
        mt = [ matches(1,i,1,1) , matches(2,i,1,1) ];
        xt = f1(1,mt(1));
        yt = f1(2,mt(1));
        xpt = f2(1,mt(2));
        ypt = f2(2,mt(2));
        At = [xt,yt,0,0,1,0 ; 0,0,xt,yt,0,1];
        bt = [xpt;ypt];
        t = (At * X);
        
        %             in = inpolygon(t(1),t(2),xp+100,yp+100);
        if (t(1) > bt(1)-r && t(1) < bt(1)+r) && (t(2) > bt(2)-r && t(2) < bt(2)+r)
            matched = matched+1;
        end
    end
    if matched > max_matched
        max_matched = matched;
        best_x = X;
        disp(['iteration ',num2str(n-N) , ' matched ' , num2str(matched) , ' out of ' , num2str(length(f1))]);
        
    end
    
end
X_out = best_x


end
