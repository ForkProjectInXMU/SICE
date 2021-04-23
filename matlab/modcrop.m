function imgs = modcrop(imgs, modulo)
% disp("begin of func");
if size(imgs,3)==1
    sz = size(imgs);
    sz = sz - mod(sz, modulo);
    imgs = imgs(1:sz(1), 1:sz(2));
else
    tmpsz = size(imgs);
    % disp(tmpsz);
    sz = tmpsz(1:2);
    % disp(sz);
    % disp(mod(sz,modulo));
    sz = sz - mod(sz, modulo);
    % disp(sz);
    imgs = imgs(1:sz(1), 1:sz(2),:);
    % disp(size(imgs));
    % disp("end of func");
end

