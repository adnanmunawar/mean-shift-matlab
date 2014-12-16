function q = start(x)
clear all;
close all;
clc;
%vid = videoinput('winvideo',1 ,'YUY2_320x240' );
vid = videoinput('macvideo',1 ,'YCbCr422_1280x720' );
preview(vid);
%x and y axis distance of the ellipse kernel
h = [60 60];
%location of the centroid of the kernel
y= [360 640];
%number of bins
m = 20;

I = getsnapshot(vid);
I = ycbcr2rgb(I);
I = rgb2gray(I);
I_size = size(I);

I_bin = uint8(reshape(binNum(reshape(I,1,[]),m),I_size(1),[]));

[ eRowCol ] = get_ellipse_border(h,y,I_size);
figure;
imshow(I_bin,[]);
hold on;

plot (eRowCol(:,2),eRowCol(:,1),'-','LineWidth',1); plot(y(2),y(1),'.','MarkerSize',5);

[model_location] = tracking_function(h,y,m,I_size,vid);
close(vid);
end