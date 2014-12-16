function [q,binNums] = getModel(I, h, y, m,I_size)

[q_RowCol, q_loc] = getPointsInEllipse(h, y, I_size);
[q,binNums] = probProfile(h, y, q_RowCol, I(q_loc), m);
end