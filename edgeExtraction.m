function feat_vec = edgeExtraction(x)
Image = imread(x);

%extract edges with canny method
BW = edge(Image, 'canny');

%convert the edges to an 8x8 cell array that contins a 16x16 block in each
%cell
C = mat2cell(BW, [16,16,16,16,16,16,16,16],[16,16,16,16,16,16,16,16]);

%initialize empty matrix where we will store the final normalized output
Matrix = zeros(8,8);

%loop through and store the index of the cell at Matrix 
i = 1;
while(i <8)
    j = 1;
    while(j < 8)
        %normalize the index in the cell array
        index = norm(single(C{i,j}));
        
        %store in the matrix index
        Matrix(i,j)= index;
        j = j+1;
    end
    i = i+1;
end

%reshape the matrix for the output
Matrix = reshape(Matrix,64,1);

%store output in feat_vec
feat_vec = Matrix;

 end