function [ scriptV ] = get_source(scale_factor)
%GET_SOURCE compute illumination source property 
%   scale_factor : arbitrary 

if nargin == 0
    scale_factor = 1;
end
scriptV = 0;

% TODO: define arbitrary direction to V

V = [
    0,      0,      1;
    1,      -1,     1;
    -1,     -1,     1;
    1,      1,      1;
    -1,     1,      1;
    
    ];


% TODO: normalize V into scriptV

scriptV = V/norm(V);

% scale up to scale factor before return
scriptV = scale_factor * scriptV;

end

