clear;
clc;
close all;
warning off;

img_In = imread('./79.JPG'); 
%disp(img_In);
%disp("final shape:");
%disp(size(img_In));
img_In = imresize(img_In, 3/5, 'bicubic');
%disp(img_In);
%disp("final shape:");
%disp(size(img_In));
img_In = modcrop(img_In, 4);
%disp(img_In);
disp("final shape:");
disp(size(img_In));

I = double(rgb2gray(img_In));
disp(size(I));
I = I./max(I(:));
disp(size(I));
lumin = im2single(wlsFilter(I, 2, 2));
disp(size(lumin));
detail = im2single(I - lumin);
disp(size(detail));

img_In = im2single(img_In);
disp(size(img_In));
DL = cat(3, img_In, lumin);
disp(size(DL));
DD = cat(3, img_In, detail);
disp(size(DD));

[H, W, C] = size(img_In);

if (H>1200 && W>1200)
    dataL = DL(H/2-600:H/2+599, W/2-600:W/2+599, :);
    dataD = DD(H/2-600:H/2+599, W/2-600:W/2+599, :);
    data = img_In(H/2-600:H/2+599, W/2-600:W/2+599, :);
end
disp(size(dataL));
disp(size(dataD));
disp(size(data));