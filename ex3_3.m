clear ; close all; clc
fprintf('Loading and Visualizing Data ...\n');
load('ex3data1.mat');
[rowX, colX] = size(X)
[rowy,coly] = size(y)
%indx = find(any(X)==0);
find(any(X)==0)
%X(:,indx)=[];
X(~any(X,2),:) = []; %deleting rows
X(:,~any(X,1))=[];%deleting cols 
[rowX, colX] = size(X)
% indx = find(any(X)==0)
% indx = find(any(X')==0)

[Xsub,idx] = licols(X);
%linearly independent cols
X = Xsub;

NX = 5000;
%for NX = 400:10:5000
%fprintf('%d',NX);

% ===========random permutation of rows================= 
c = randperm(rowX,NX);
BatchX = X(c,:);
[rowBatchX,colBatchX]=size(BatchX)


%%%%%%%%%%%%%%%%%%%%%%%
% finding linearly independent cols
% tol_X = 1e-6
% [BatchX,indexX] = licols(X,tol_X);
% [BatchX,indexX] = licols(BatchX',tol_X);
% BatchX = BatchX';
% 
% size(BatchX)
%%%%%%%%%%%%%%%%%%%%%%%%%%

Batchy = zeros(NX,1);
for i = 1 : NX
    Batchy(i) = y(c(i));

end

%Batchy = y(c);

%BatchX = X;
%Batchy = y;

[rowBatchY,colBatchY]=size(Batchy)
%keyboard;
%Checking if BatchX has rows with all zeros columns 
indx = find(any(BatchX)==0);
find(any(BatchX')==0);
BatchX(~any(BatchX,2),:) = []; %deleting rows
BatchX(:,~any(BatchX,1))=[];%deleting cols 
[rowBatchX,colBatchX]=size(BatchX)
find(any(BatchX)==0)
find(any(BatchX')==0)


%==================Dividing data for Train and Test in ratio 4:1 =============
row_X_Train = ceil(rowBatchX/5)*4
row_X_Test = rowBatchX - row_X_Train

row_y_Train = ceil(rowBatchY/5)*4
row_y_Test = rowBatchY - row_y_Train

X_Train = zeros(row_X_Train,colBatchX);
X_Test = zeros(row_X_Test , colBatchX);

y_Train = zeros(row_y_Train,1);
y_Test = zeros(row_y_Test,1);

for i = 1:row_X_Train
    X_Train(i,:) = BatchX(i,:);
    y_Train(i,:) = Batchy(i,:);
end

for i = 1:row_X_Test
    X_Test(i,:) = BatchX(row_X_Train+i,:);
    y_Test(i,:) = Batchy(row_y_Train+i,:);
end



%keyboard;


%===================One-vs-All Training==========================
num_labels = 10;
lambda = 0;
%[all_theta,idx] = oneVsAll_2(BatchX, Batchy, num_labels, lambda);
[all_theta,idx] = oneVsAll_2(X_Train,y_Train, num_labels, lambda);
size(all_theta)
%fprintf('**END**\n')
%end

%=================== Predict for One-Vs-All for Training Data==========================

%pred = predictOneVsAll_2(all_theta, X);

%fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
%keyboard;
%pred = predictOneVsAll_2(all_theta, BatchX,idx);
pred_Train = predictOneVsAll_2(all_theta, X_Train,idx);
%fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == Batchy)) * 100);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred_Train == y_Train)) * 100);

%======================Predict for One-Vs-All for Test Data===========================

pred_Test = predictOneVsAll_2(all_theta, X_Test,idx);
fprintf('\nTest Set Accuracy: %f\n', mean(double(pred_Test == y_Test)) * 100);



