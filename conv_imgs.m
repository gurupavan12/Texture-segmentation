function [f2] = conv_imgs(f1,h,sigma,range,dir)
    ind = sigma*range;
    ind1 =ind+1;
    [rows, col] = size(f1);
    f2=f1;
    
    if strcmp(dir,'row')==1
        for i=ind1:rows-ind
            for j=1:col
                temp=0;
                for k=-ind:ind
                    c1 = f1(i+k,j)*h(ind1-k);
                    temp=temp+c1;
                end
                f2(i,j) = temp;
            end
        end
    end
    

    if strcmp(dir,'col') == 1
        for i=1:rows
            for j=ind1:col-ind
                    temp=0;
                for k = -ind:ind
                    c1 = f1(i,j+k)*h((ind1)-k);
                    temp = temp+c1;
                end
                    f2(i,j) = temp;
            end
        end
    end
    
    if strcmp(dir,'abs') ==1
        f2 = abs(f1);
    end
    
end

