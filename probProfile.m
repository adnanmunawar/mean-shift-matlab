function [P,binNums] = probProfile(h, y, locXi, X, m)
scaledDistSquared = ((y(1) - locXi(:,1))/(h(1)/2)).^2 + ((y(2) - locXi(:,2))/(h(2)/2)).^2;

kLocXi = kernalProfile(scaledDistSquared);
Ch = 1/sum(kLocXi);

binNums = binNum(X,m);

for i = 0:m-1
    P(i+1) = sum(kLocXi(find(binNums==i)))*Ch;
end
end