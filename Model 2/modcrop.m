% 本方法将图片大小变为modulo的倍数，比如原大小为11x11，若modulo为5则会变为10x10
function imgs = modcrop(imgs, modulo)
if size(imgs,3)==1
	% 若图像的C通道为1维，即灰度图。直接忽略C通道取模相减，截取。
    sz = size(imgs);
    sz = sz - mod(sz, modulo);
    imgs = imgs(1:sz(1), 1:sz(2));
else
	% 若图像的C通道为3维，即RGB图
    tmpsz = size(imgs);
    % [H, W, C]
    sz = tmpsz(1:2);
    % [H, W]
    sz = sz - mod(sz, modulo);
    % mod(sz, modulo)即使用[H, W]对modulo取模，得出比倍数结果多多少，然后再减掉
    % 如上述例子中，sz为[11, 11]，mod(sz, modulo)为[1, 1]，减完sz为[10, 10]
    imgs = imgs(1:sz(1), 1:sz(2),:);
    % 然后imgs就截取，取原图像[1:10, 1:10, :]，和python完全一致这里
end

