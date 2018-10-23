clc;
clear all;
close all;
% You can run section by section as well
%% Part-1 : texture2.gif
% Input image
I = imread('texture2.gif');

f1 = double(I);
h=figure;
imshow(f1);
title('Original Image'); 
saveas(h,'texture2_orig.png');
% Gabor Filter
sigma = 8;
range = 2;
F = 0.059;
theta = 135;

[hx,hy] = GEF(F,sigma,theta,range);
[i1] = conv_imgs(f1,hx,sigma,range,'row');
[i2] = conv_imgs(i1,hy,sigma,range,'col');
[m] = conv_imgs(i2,hx,sigma,range,'abs');
filterDisplay = uint8(m*1000); %Rescaling for the sake of display
[rows col] = size(filterDisplay);
h=figure; imshow(filterDisplay(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range));
saveas(h,'texture2_gabor.png');
[rows col] = size(m);
h=figure; 
mesh(m(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range)*255); 
colormap(jet); 
saveas(h,'texture2_gabor_3d.png');

% Smoothing filter
sigma2 =24; 
[gx,gy] = circSymGauss(sigma2,range);
[m1] = conv_imgs(m,gx,sigma2,range,'row');
[m2] = conv_imgs(m1,gy,sigma2,range,'col');
[m3] = adjust_img(m2,sigma2,range);
filtDisplay = uint8(m3*1000);
[rows col] =size(filtDisplay);
h=figure;imshow(filtDisplay(sigma2*range+1:rows-sigma2*range,sigma2*range+1:col-sigma2*range));
saveas(h,'texture2_smooth.png');
h=figure; 
mesh(m3); 
colormap(jet); 
saveas(h,'texture2_smooth_3d.png');

% Thresholding image
threshold_val = 0.045;
[m4] = threshold_img(m2,threshold_val);
[rows col] =size(m4);
h=figure;imshow(m4(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range));
saveas(h,'texture2_threshold.png');

seg_img = segment_img(f1,m4);


%repositioning it
[rows col] = size(seg_img);
final_segImg = seg_img(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range);

h=figure; imshow(final_segImg);
saveas(h,'texture2_segment.png');


%% Part 2: texture1.gif
close all;
clear all;
I = imread('texture1.gif');

f1 = double(I);
h=figure;
imshow(f1);
title('Original Image'); 
saveas(h,'texture1_orig.png');
% Gabor Filter
sigma = 24;
range = 2;
F = 0.042;
theta = 0;

[hx,hy] = GEF(F,sigma,theta,range);
[i1] = conv_imgs(f1,hx,sigma,range,'row');
[i2] = conv_imgs(i1,hy,sigma,range,'col');
[m] = conv_imgs(i2,hx,sigma,range,'abs');
filterDisplay = uint8(m*2000); %Rescaling for the sake of display
[rows col] = size(filterDisplay);
h=figure; imshow(filterDisplay(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range));
saveas(h,'texture1_gabor.png');
[rows col] = size(m);
h=figure; 
meshz(m(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range)*255); 
% colormap(jet); 
% saveas(h,'texture1_gabor_3d.png');

% Smoothing filter
sigma2 =24; 
[gx,gy] = circSymGauss(sigma2,range);
[m1] = conv_imgs(m,gx,sigma2,range,'row');
[m2] = conv_imgs(m1,gy,sigma2,range,'col');
[m3] = adjust_img(m2,sigma2,range);
filtDisplay = uint8(m3*1000);
[rows col] =size(filtDisplay);
h=figure;imshow(filtDisplay(sigma2*range+1:rows-sigma2*range,sigma2*range+1:col-sigma2*range));
saveas(h,'texture1_smooth.png');
h=figure; 
meshz(m3); 
% colormap(jet); 
% saveas(h,'texture1_smooth_3d.png');

% Thresholding image
threshold_val = 0.045;
[m4] = threshold_img(m2,threshold_val);
[rows col] =size(m4);
h=figure;imshow(m4(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range));
saveas(h,'texture1_threshold.png');

seg_img = segment_img(f1,m4);
%repositioning it
[rows col] = size(seg_img);
final_segImg = seg_img(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range);

h=figure; imshow(final_segImg);
saveas(h,'texture1_segment.png');

%% Part 3: d9d77.gif
close all;
clear all;
% Input image
I = imread('d9d77.gif');

 I(:,513)=[];
h=figure;
imshow(I);
title('Original Image before thresholding'); 
saveas(h,'d9d77_orig_bf_thresh.png');
I=I>150;
f1=double(I);


h=figure;
imshow(f1);
title('Original Image after thresholding'); 
saveas(h,'d9d77_orig_af_thresh.png');

% Gabor Filter
sigma = 38;
range = 2;
F = 0.062;
theta = 63;

[hx,hy] = GEF(F,sigma,theta,range);
[i1] = conv_imgs(f1,hx,sigma,range,'row');
[i2] = conv_imgs(i1,hy,sigma,range,'col');
[m] = conv_imgs(i2,hx,sigma,range,'abs');
filterDisplay = uint8(m*2000); %Rescaling for the sake of display
[rows col] = size(filterDisplay);
h=figure; imshow(filterDisplay(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range));
saveas(h,'d9d77_gabor.png');
[rows col] = size(m);
h=figure; 
meshz(m(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range)*255); 
colormap(jet); 
saveas(h,'d9d77_gabor_3d.png');


% Thresholding image
threshold_val = 0.021;
[m4] = threshold_img(m,threshold_val);
[rows col] =size(m4);
h=figure;imshow(m4(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range));
saveas(h,'d9d77_threshold.png');
seg_img = segment_img(f1,m4);

%repositioning it
[rows col] = size(seg_img);
final_segImg = seg_img(sigma*range+1:rows-sigma*range,sigma*range+1:col-sigma*range);

h=figure; imshow(final_segImg);
saveas(h,'d9d77_segment.png');