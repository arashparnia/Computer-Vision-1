function imOut = myHistMatching(input, reference)

hist_map = zeros(256,1,'uint8'); 
hist1 = imhist(input); 
hist2 = imhist(reference);



%% using this loop to calculate the cumulative sum 
cumulative_sum_hist1 = zeros(size(hist1));
sums = zeros(1, size(hist1, 2));
for i = 1 : size(hist1, 1)
   sums = sums + hist1(i, :);
   cumulative_sum_hist1(i, :) = sums;
end
%%  dividing cumulitive sum with the number of elements in the array to get the cumulative distribution
cdf1 = cumulative_sum_hist1 / numel(input); 

%% using this loop to calculate the cumulative sum 
cumulative_sum_hist2 = zeros(size(hist2));
sums = zeros(1, size(hist2, 2));
for i = 1 : size(hist2, 1)
   sums = sums + hist2(i, :);
   cumulative_sum_hist2(i, :) = sums;
end

%%  dividing cumulitive sum with the number of elements in the array to get the cumulative distribution

cdf2 = cumulative_sum_hist2 / numel(reference);

%% using this loop to map intensity values of two images histograms
for i = 0 : 255
    % looping from 1 to 255 because of the range of grayscale image values
    [k,ind] = min(abs(cdf1(i+1) - cdf2));
    % calculating the minimum absolute value of the difference of image 1 and image 2 cumulative distribution
    % finding the smallest absolute difference between two image intensity values.
    hist_map(i+1) = ind; 
    % i+1 because the matrix index starts at 1 
end

imOut = hist_map(double(input+1));
% imput+1 to map the indexes with the hist_map index 

%% visualizing
% figure,stem(cdf1);
% figure,stem(hist1)
% figure,stem(cdf2);
% figure,stem(hist2);

figure,
subplot(1,3,1) ; imshow(imread('input.png'));
subplot(1,3,2); stem(hist1);
figure,
subplot(1,3,1) ; imshow(imread('reference.png'));
subplot(1,3,2); stem(hist2);

figure,
subplot(1,2,1) ; imshow(imOut);
subplot(1,2,2); stem(imhist(imOut));

end