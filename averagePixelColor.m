function feat_vec=averagePixelColor(x)

%read in the file
[image,map] = imread(x);

%convert image to rgb
Image = ind2rgb(image,map);

%get mean of means of the image
colors = mean(Image);
y=mean(colors);

%return rgb values
feat_vec=[y(:,:,1),y(:,:,2),y(:,:,3)];
end
