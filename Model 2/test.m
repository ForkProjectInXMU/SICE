clear;
clc;
close all;
warning off;

img_In = imread('./79.JPG');
tmp = rgb2gray(img_In);
I = double(tmp);
I = I./max(I(:));
imwrite(tmp,'test0.png');
imwrite(I,'test1.png');
lumin = im2single(wlsFilter(I, 2, 2));
detail = im2single(I - lumin);
imwrite(lumin,'test2.png');
imwrite(detail,'test3.png');
