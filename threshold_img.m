function output = threshold_img(input,val)
    [rows, col] = size(input);
    output = zeros(rows,col);
    for i=1:rows
        for j=1:col
            if input(i,j)>val
                output(i,j) = 255;
            end
        end
    end
end
