% Project done by Chaitanya Modak and Krushal Kyada
function DisplayConfusionMatrix(confMat)
% Display the confusion matrix in a formatted table.

% Convert confusion matrix into percentage form
confMat = bsxfun(@rdivide,confMat,sum(confMat,2));
fprintf(' --- Accuracy of the classifier training --- ')
Labels = {'cars','airplane','bikes'};
Headings = {'cars','airplane','bikes'};
%format = repmat('%-7s',1,7);
header = sprintf('Category | %s    %s    %s',Headings{:});
fprintf('\n%s\n%s\n',header,repmat('-',size(header)));
for idx = 1:numel(Labels)
    fprintf('%-9s',   [Labels{idx}]);fprintf('|');
    fprintf('%-9.2f', confMat(idx,:));
    fprintf('\n')
end