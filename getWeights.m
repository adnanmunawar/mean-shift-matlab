function [w] = getWeights(q, p_y0, binNums)
count = 0;
p_y0
for i = 1:numel(binNums)
    if (p_y0(binNums(i)+1) == 0)
        disp('Warning Divide by zero detected because p_y0 = 0');
    end
    
    % calculate weight
    w(i,1) = sqrt(q(binNums(i)+1)/(p_y0(binNums(i)+1)+eps));
end