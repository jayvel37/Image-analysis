function feat_vec = spacialGrid(x)

%read in the image
[I,map] = imread(x);

%resize and reshape the image. 
%in resizing, the function automatically takes the mean of the image
result = imresize(I,[16, 16]);

%reshaping gives a constant output for the avreage feature vector
feat_vec = reshape(result, [256 1]);
end