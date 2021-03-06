function H = HE(D,centers,vocabulary_size)
    H = ones(1,vocabulary_size);
    [~,s] = size(D);
    for i = 1: s
        [~,k] = min(pdist2(single(D(:,i)'),single(centers),'euclidean'));
%         [~,k] = min(vl_alldist(D(i,:),centers));
        H(k)  = H(k) + 1;
    end
    H = H / norm(H);
end
