function [k] = kernalProfile(x)

if (numel(find(x < 0)) > 0)
    disp('Warning input to kernalProfile must be non negative!');
    
end

k = zeros(size(x));
k(find(x<1)) = (3/4).*(1 - x(find(x<1)));
end