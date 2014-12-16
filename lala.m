function qwe = lala(ewq)
img1 = imread('bed1.jpg');
siz = size(img1);

% R=img1(i,j,1);
% G=img1(i,j,2);
% B=img1(i,j,3);
 
for i = 1 : siz(1)
    for j = 1 : siz(2)
        for k = 1: siz(3)
        R(i,j,1) = img1(i,j,1)*(img1(i,j,1)/(img1(i,j,1)+img1(i,j,2)+img1(i,j,3)));
        R(i,j,2) = img1(i,j,2)*(img1(i,j,2)/(img1(i,j,1)+img1(i,j,2)+img1(i,j,3)));
        R(i,j,3) = img1(i,j,3)*(img1(i,j,3)/(img1(i,j,1)+img1(i,j,2)+img1(i,j,3)));
        
        end
    end
end
imshow(R);