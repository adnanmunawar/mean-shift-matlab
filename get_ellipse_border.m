function [RowCol] = get_ellipse_border(h,y,I_size)

r = -floor((h(1)-1)/2):ceil((h(1)-1)/2);

h = h/2;

c = sqrt(h(2)^2*h(1)^2 - h(2)^2*(r).^2)/h(1);

RowCol(:,1) = [r'; seqreverse(r)'] + y(1);
RowCol(:,2) = [c'; -seqreverse(c)'] + y(2);

RowCol(end+1,:) = RowCol(1,:);

% loc = round(RowCol(:,1)) + (round(RowCol(:,2))-1)*I_size(1);
end
