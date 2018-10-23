function [gx,gy] = circSymGauss(sigma,range)
    r = sigma*range;
    x = -r:r;
    y = -r:r;
    den = (sqrt(2*pi))*sigma;
    for i=1:length(x)
        gx(i) = (exp(-((x(i)).^2)/(2*(sigma^2))))/den;
    end
    for i=1:length(y)
        gy(i) = (exp(-((y(i)).^2)/(2*(sigma^2))))/den;
    end
end
    