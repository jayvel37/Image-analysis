
%section for 2.2
imgFolder = '../Code/Data/Database';
files = dir(fullfile(imgFolder, '*png'));

label = [];
feat_one=[];
feat_two=[];
feat_three=[];
feat_four=[];
for file = files'
    %fill label with the name of the files
    label = [label, file.name];
    image_path=strcat(imgFolder, '/', file.name);
    
    %fill feat_one with Average pixel color feature vectors
    feat_vec = averagePixelColor(image_path);
    feat_one = [feat_one, feat_vec'];
    
    %fill feat_one with spatial grid of average pixel colors feature vectors
    feat_vec = spacialGrid(strcat(imgFolder, '/', file.name));
    feat_two = [feat_two, feat_vec];
    
    %fill feat_one with Color Histograms feature vectors
    feat_vec = colorHistogram(strcat(imgFolder, '/', file.name));
    feat_three = [feat_three, feat_vec'];
    
    %fill feat_one with edge energy feature vectors
    feat_vec = edgeExtraction(strcat(imgFolder, '/', file.name));
    feat_four = [feat_four, feat_vec];
end

save('feat_one.mat','feat_one');
save('feat_two.mat','feat_two');
save('feat_three.mat','feat_three');
save('feat_four.mat','feat_four');
save('files.mat','files');