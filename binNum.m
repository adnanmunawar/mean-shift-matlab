function [b] = binNum(I,m)    

I = double(I);
b = round((I/255)*(m-1));