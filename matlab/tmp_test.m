clear;
clc;
close all;
warning off;

% test1，经过验证发现im2single是把数值除以255，得到小数，让人不禁怀疑归一化
% 是否就是把数据/255就好了，逆过程就是乘以255
% I = reshape(uint8(linspace(1,230,25)),[5 5]);
% disp(I);
% I2 = im2single(I);
% disp(I2)

% test2，经过验证发现如果数据本身就是浮点数据，im2single啥也不变
% I = reshape(double(linspace(0,0.5,4)),[2 2]);
% disp(I);
% I2 = im2single(I);
% disp(I2);

% test2.5，经过验证发现如果数据本身就是浮点数据，im2single啥也不变
% I = reshape(double(linspace(0,1.2,4)),[2 2]);
% disp(I);
% I2 = im2single(I);
% disp(I2);

% test3，经过验证发现直接除255能和原图一样，但除最大值就会产生和原图不一样的结果
% 所以或许应该除255
% I = reshape(uint8(linspace(50,50,1024)),[32 32]);
% imwrite(I, 'tmp1.png');
% I1 = im2single(I);
% disp(I1)
% imwrite(I1, 'tmp2.png');
% I2 = double(I);
% I2 = I2./max(I2(:));
% imwrite(I2, 'tmp3.png');

% test4，经过验证惊人地发现除以255归一化的结果与除以最大值归一化的结果竟是
% 一样的，离谱离奇，但是也说明这个过程没问题，确实可以放心使用。
%I1 = imread('./color1.png');
%I2 = imread('./result1.png');
%disp(is_diff(I1,I2));
I1 = imread('./result2.png');
I2 = imread('./result22.png');
disp(is_diff(I1,I2));
% disp(I1(2560:2580, 2560:2580, 3));
% disp(I2(2560:2580, 2560:2580, 3));
% sub = I1 - I2;
% disp(sum(sub(:)));