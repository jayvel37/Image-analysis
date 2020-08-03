imgFolder = '../Code/Data/Database';
Q1 = 'Enter The file name: (including .png extension)';
label = input(Q1,'s');

%initial prompt
Q2 = '\nSelect method of extraction: \nEnter 1 for average pixel color. \nEnter 2 for spatial grid of pixel color. \nEnter 3 for color Histogram. \nEnter 4 for edge extraction. ';
x1 = input(Q2,'s');

%check for valid input
while(x1 ~= '1' && x1 ~= '2'&& x1 ~= '3'&& x1 ~= '4')
   Q2 = '\nSelect method of extraction: \nEnter 1 for average pixel color. \nEnter 2 for spatial grid of pixel color. \nEnter 3 for color Histogram. \nEnter 4 for edge extraction.\n ';
x1 = input(Q2,'s'); 
end

%let user know we are calculating knn with Angle between vectors
Q3 = 'Calculating knn with Angle between vectors.';
disp(Q3);

%load in the feature vector
if(x1 == '1')
    feat = load('feat_one');
end

if(x1 == '2')
    feat = load('feat_two');
end

if(x1 == '3')
    feat = load('feat_three');
end

if(x1 == '4')
    feat = load('feat_four');
end

load('files');
index = 1;
%loop to return the index of the file searching for
for file = files'
    if(strcmp(label, file.name))
        break;
    end
    index = index+1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ssd = [];

    
%create a zero matrix of the same size as test_feat%Angle Between Vectors
 %PUT YOUR CODE HERE
   if(x1 == '1')
    for i=1:202
        CosTheta = dot(feat.feat_one(:,i),feat.feat_one(:,index))/(norm(feat.feat_one(:,i))*norm(feat.feat_one(:,index)));
        ssd(i) = acosd(CosTheta);
    end
   end
   if(x1 == '2')
    for i=1:202
        CosTheta = dot(double(feat.feat_two(:,i)),double(feat.feat_two(:,index)))/(norm(double(feat.feat_two(:,i)))*norm(double(feat.feat_two(:,index))));
        ssd(i) = acosd(CosTheta);
    end
   end
   if(x1 == '3')
    for i=1:202
        CosTheta = dot(feat.feat_three(:,i),feat.feat_three(:,index))/(norm(feat.feat_three(:,i))*norm(feat.feat_three(:,index)));
        ssd(i) = acosd(CosTheta);
    end
   end
   if(x1 == '4')
    for i=1:202
        CosTheta = dot(feat.feat_four(:,i),feat.feat_four(:,index))/(norm(feat.feat_four(:,i))*norm(feat.feat_four(:,index)));
        ssd(i) = acosd(CosTheta);
    end
   end
       

%Find the top k nearest neighbors, and do the voting. 
closest_images = {};
[B,I] = sort(ssd);

for ii = 2:11
    closest_images = [closest_images, files(I(ii)).name];
end

for i=1:10
%display the closest images
image_path=strcat(imgFolder, '/', closest_images{i});
[image,map] = imread(image_path);
subplot(1,10,i), imshow(image,map)
end