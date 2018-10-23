function [hx,hy] = GEF(F,sigma,theta,range)
    r = sigma*range;
    x = -r:r;
    y = -r:r;
    
    U = F*cosd(theta);
    V = F*sind(theta);
    
    [gx,gy] = circSymGauss(sigma,range);
    hx = zeros(size(gx));
    hy = zeros(size(gy));
    
    for i=1:length(x)
        hx(i) = gx(i)*exp(1i*2*pi*U*x(i));
    end
    
    for i=1:length(y)
        hy(i) = gy(i)*exp(1i*2*pi*V*y(i));
    end
    
end