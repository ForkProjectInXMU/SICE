function r = is_diff(img1, img2)
tmp = img1-img2;
r = sum((tmp(:)));
end

