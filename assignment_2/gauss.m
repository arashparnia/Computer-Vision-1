function G = gauss(sigma,kernel_size)
X = kernel_size;
G = (sigma * sqrt(2*pi)) /  exp(-(X^2) / (2*sigma*sigma));
end

