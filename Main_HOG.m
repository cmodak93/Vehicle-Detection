%Vehicle detection using HOG and SVM
%All the images from the datasets are taken. Test features and test labels
%are extracted from the images. Feature size and cell size is specified.
%Confusion matrix is displayed according to the predicted labels.
% Project done by Chaitanya Modak and Krushal Kyada

clc;
clear all;
close all;

load HOGfeatures.mat

imgCat1 = read(imgSets(1), 1);
imgCat2 = read(imgSets(2), 1);
imgCat3 = read(imgSets(3), 1);

figure;
subplot(1,3,1);imshow(imgCat1);
subplot(1,3,2);imshow(imgCat2);
subplot(1,3,3);imshow(imgCat3);

[testFeatures, testLabels] = Testing_HOG_feature(testingSets, hogFeatureSize, cellSize);

predictedLabels = predict(classifier, testFeatures);
% Tabulate the results using a confusion matrix.
confMat = confusionmat(testLabels, predictedLabels);

DisplayConfusionMatrix(confMat)