function [output] = adjust_img(input,sigma2,range)
    [rows,col] =size(input);
    ind = sigma2*range;
    ind1 = ind+1;
    output = zeros(rows,col);
    for i=ind1:rows-ind
        for j=ind1:col-ind
            output(i,j) = input(i,j);
        end
    end
    
end