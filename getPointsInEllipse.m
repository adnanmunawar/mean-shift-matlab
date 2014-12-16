function [RowCol, loc] = getPointsInEllipse(h, y, I_size)


[C R] = meshgrid(-floor((h(2)-1)/2):ceil((h(2)-1)/2), -floor((h(1)-1)/2):ceil((h(1)-1)/2));
C = reshape(C,1,[]);
R = reshape(R,1,[]);

ONE = (R).^2/(h(1)/2)^2 + (C).^2/(h(2)/2)^2;

RowCol2(:,1) = R(find(ONE<=1))+y(1);
RowCol2(:,2) = C(find(ONE<=1))+y(2);

index = 1;
for i = 1:size(RowCol2,1)
    if (RowCol2(i,2) > 0 & RowCol2(i,2) <= I_size(2) & RowCol2(i,1) > 0 & RowCol2(i,1) <= I_size(1))
        RowCol(index,:) = RowCol2(i,:);
        index = index + 1;
    end
end
loc = RowCol(:,1) + (RowCol(:,2)-1)*I_size(1);
end