function [y1] = meanShift( hCurr , y0 , q ,I_1 , m, I_size)


continueWithMeanShift = true;
numItt = 0;
while (continueWithMeanShift == true & numItt < 20)

   
    [y0_RowCol, y0_loc] = getPointsInEllipse(hCurr,y0,I_size);
      
    [p_y0, binNums] = probProfile(hCurr, y0, y0_RowCol, I_1(y0_loc), m);
   
    [w] = getWeights(q, p_y0, binNums);
    sum_w = sum(w);

    y1 = [sum(y0_RowCol(:,1).*w)/sum_w sum(y0_RowCol(:,2).*w) / sum_w]
    
    [y1_RowCol, y1_loc] = getPointsInEllipse( hCurr,round(y1), I_size);
    [p_y1, binNums] = probProfile(hCurr, round(y1), y1_RowCol, I_1(y1_loc), m);

    % if the Bhattacharyya coefficient goes down stop itteration
    if (sum(sqrt(p_y1.*q)) > sum(sqrt(p_y0.*q)))
        
        if (max(abs(y0-y1)) > 0.5)
            y0 = round(y1);
            continueWithMeanShift = true;
        else
            y1 = round(y1);
            continueWithMeanShift = false;
        end
    else
        % if the Bhattacharyya coefficient is smaller for y1 than y0 keep
        % y0 as the tracked location
        y1 = y0;
        % stop mean shift itteration
        continueWithMeanShift = false;
    end

    numItt = numItt + 1;
end
y1 = round(y1);
