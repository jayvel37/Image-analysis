images = load('../Code/DeepNetFeature/feature_vgg_f.mat');

matrix = zeros(202, 4096);

%get the 202X4096 matrix
for i=1:202
    for j = 1:4096
        matrix(i,j) = images.image_feat(i).feat(j);
    end
end

%pass the 202X4096 matrix into pca
[coeff, score] = pca(matrix);
files = dir(fullfile(imgFolder, '*png'));

reducedDim = score(:,1:2);
scatter(reducedDim(:,1),reducedDim(:,2));
hold on;

%Plot the images on the graph
imgFolder = '../Code/Data/Database';
files = dir(fullfile(imgFolder, '*png'));
image_names = {files.name};


img_Width = 7;
for i = 1:length(image_names)
    image_path = strcat(imgFolder, '/', image_names(i));
    [image, map] = imread(image_path{1});
    [imageRGB] = ind2rgb(image,map);
    imagesc([reducedDim(i,1), reducedDim(i,1)-img_Width],[reducedDim(i,2), reducedDim(i,2)-img_Width], imageRGB);
end
