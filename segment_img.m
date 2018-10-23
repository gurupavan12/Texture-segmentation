function output = segment_img(original,processed)
    output=original;
    edged_img = edge(processed,'Canny');
    [rows,col] = size(original);
    for i=1:rows
        for j=1:col
            if edged_img(i,j) == 1
                output(i,j) = 255;
            end
        end
    end
end