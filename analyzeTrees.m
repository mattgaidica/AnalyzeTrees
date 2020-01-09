close all

imPath = '/Users/matt/Dropbox/Projects/Cones';
im = imread(imPath);
[BW,maskedRGBImage] = createTreeMask(im);

BW2 = imfill(BW,'holes');

se = strel('disk',3);
BW3 = imerode(BW2,se);

[BW4,properties] = filterTreeRegions(BW3);


figure;
imshow(BW4);
s = regionprops(BW4,'centroid');
hold on;
for ii = 1:numel(s)
    centroid = s(ii).Centroid;
    text(centroid(1),centroid(2),num2str(ii),'color','r');
end

figure;
imshow(im);
s = regionprops(BW4,'centroid');
hold on;
for ii = 1:numel(s)
    centroid = s(ii).Centroid;
    text(centroid(1),centroid(2),num2str(ii),'color','r');
end