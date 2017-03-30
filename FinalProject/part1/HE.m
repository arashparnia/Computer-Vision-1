function H = HE(D,centers,size)
    D = single(D');
    centers = single(centers);
    H = ones(1,size);
    for i = 1: length(D)
        [~,k] = min(pdist2(D(i,:),centers,'euclidean'));
        H(k)  = H(k) + 1;
    end
    H = H / norm(H);
end
