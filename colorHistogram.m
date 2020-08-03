function feat_vec = colorHistogram(x)
%read in the image 
[image,map] = imread(x);

%makes into rgb
Image = ind2rgb(image,map);

%create histogram
rHist = hist(reshape(double(Image(:,:,1)), [128*128 1]));
gHist = hist(reshape(double(Image(:,:,2)), [128*128 1]));
bHist = hist(reshape(double(Image(:,:,3)), [128*128 1]));

%concatenate histogram
feat_vec = [rHist, gHist, bHist];
end