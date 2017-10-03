%Three datsets are taken. All the datasets are randomly partitioned into
%training and testing sets to avoid biasing. Bag of features is calculated
%for the training sets. Images are classified according to the categories. 
% Project done by Chaitanya Modak and Krushal Kyada


clc;
clear all;
Cars='C:\Users\cmoda\Desktop\CV_final_projet\Cars';
Airplanes='C:\Users\cmoda\Desktop\CV_final_projet\Airp';
Motorbikes='C:\Users\cmoda\Desktop\CV_final_projet\bike';


imgSets=[imageSet(Cars),imageSet(Airplanes),imageSet(Motorbikes)];

[minSetCount]= min([imgSets.Count]); 
imgSets = partition(imgSets, minSetCount, 'randomize'); % balancing  the number of images in the training set.
[trainingSets, testingSets] = partition(imgSets, 0.76, 'randomize'); % randomly partitioning  datasets in training and testing set.

bag = bagOfFeatures(trainingSets); % Extracts SURF features from all images in all image categories

categoryClassifier = trainImageCategoryClassifier(trainingSets, bag); %  classifier training process 

save features.mat;