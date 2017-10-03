%All the imagesets are partitioned randomly into training and testing
%sets.HOG features are extracted. Training features and labels are
%classified.
% Project done by Chaitanya Modak and Krushal Kyada
clc;
clear all;
Cars='C:\Users\cmoda\Desktop\CV_final_projet\Cars';
Airplanes='C:\Users\cmoda\Desktop\CV_final_projet\Airp';
Motorbikes='C:\Users\cmoda\Desktop\CV_final_projet\bike';

imgSets=[imageSet(Cars),imageSet(Airplanes),imageSet(Motorbikes)];
[imgSets.Count] ;
[minSetCount]= min([imgSets.Count]); 
imgSets = partition(imgSets, minSetCount, 'randomize'); % balancing  the number of images in the training set.
[trainingSets, testingSets] = partition(imgSets, 0.76, 'randomize'); % randomly partitioning  datasets in training and testing set.


img = read(trainingSets(3), 4);
img = imresize(img,[240 360]);
[hog_4x4, vis4x4] = extractHOGFeatures(img,'CellSize',[4 4]);

cellSize = [4 4];
hogFeatureSize = length(hog_4x4);
trainingFeatures = [];trainingLabels   = [];

for set = 1:numel(trainingSets)
           
    numImages = trainingSets(set).Count;           
    features  = zeros(numImages, hogFeatureSize, 'single');
    
    for i = 1:numImages
        
        img = (read(trainingSets(set), i)); 
        img = imresize(img,[240 360]);
        features(i, :) = extractHOGFeatures(img, 'CellSize', cellSize);
    end
    
    labels = repmat(trainingSets(set).Description, numImages, 1);
        
    trainingFeatures = [trainingFeatures; features];   
    trainingLabels   = [trainingLabels;   labels  ];   
        
end
% fitcecoc uses SVM learners and a 'One-vs-One' encoding scheme.
classifier = fitcecoc(trainingFeatures, trainingLabels);
save HOGfeatures.mat;