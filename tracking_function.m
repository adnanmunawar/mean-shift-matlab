function [ModelLocs] = tracking_function(h,y,m,I_size,vid)

ModelLocs(1,:) = y;
index = 2;
y1 = y;
hCurr = h;
preview(vid);
I_1 = ycbcr2rgb(getsnapshot(vid));
I_1 = rgb2gray(I_1);
[q,binNums] = getModel(I_1, h, y, m, I_size);
    fig=figure;
    set(fig,'DoubleBuffer','on');
    mov = avifile('newvideo1','compression','none','fps',16);
for i=1 : 500
I_colored = ycbcr2rgb(getsnapshot(vid));
I_1 = rgb2gray(I_colored);
% I_1_bin = uint8(reshape(binNum(reshape(I_1,1,[]),m),I_size(1),[]));



%     [ eRowCol1 ] = get_ellipse_border(h,y1,I_size);
    
    % find the location of model in current frame using mean shift
    [y1] = meanShift(hCurr, y1,  q, I_1, m, I_size);
    
    [ eRowCol ] = get_ellipse_border(h,y1,I_size);
    imshow(I_colored);
%     hold on;
%     plot (eRowCol1(:,2),eRowCol1(:,1),'r-','LineWidth',1);
    hold on;
    plot (eRowCol(:,2),eRowCol(:,1),'g-','LineWidth',1); plot(y1(2),y1(1),'g.','MarkerSize',5);
    hold off;
    ModelLocs(index,:) = y1;
    index = index + 1;
    
    F = getframe(gca);
    mov = addframe(mov,F);
    
end
mov = close(mov);
end