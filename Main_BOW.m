%Vehicle detection using Bag of words
%This program is used to calculate the feature vector by encoding the
%features with the dataset. K means clustering is used to create a 500
%visual vocablury. Accuracy is calculated for the different categories and
%then average is taken.
% Project done by Chaitanya Modak and Krushal Kyada

clc;
clear all;
close all;

load features.mat

imgCat1 = read(imgSets(1), 1);
imgCat2 = read(imgSets(2), 1);
imgCat3 = read(imgSets(3), 1);

figure;
subplot(2,3,1);imshow(imgCat1);
subplot(2,3,2);imshow(imgCat2);
subplot(2,3,3);imshow(imgCat3);

featureVector1 = encode(bag, imgCat1);
featureVector2 = encode(bag, imgCat2);
featureVector3 = encode(bag, imgCat3);

featureVector1 = encode(bag, imgCat1);

subplot(2,3,4);bar(featureVector1);
title('Visual word category 1')
xlabel('Visual word index')
ylabel('Frequency of occurrence');

featureVector2 = encode(bag, imgCat2);
subplot(2,3,5);bar(featureVector2)
title('Visual word category 2')
xlabel('Visual word index')
ylabel('Frequency of occurrence');

featureVector3 = encode(bag, imgCat3);
subplot(2,3,6);bar(featureVector3)
title('Visual word category 3')
xlabel('Visual word index')
ylabel('Frequency of occurrence');


confMatrix_training = evaluate(categoryClassifier, trainingSets);

confMatrix_testing = evaluate(categoryClassifier, testingSets);