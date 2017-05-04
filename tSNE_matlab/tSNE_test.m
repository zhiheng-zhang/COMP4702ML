clc;
clear all; 
close all; 
load('mnist_train.mat');
idx = unidrnd(60000, 6000, 1);
x = train_X(idx, :);
labels = train_labels(idx);
iteration_3D = zeros(2,30,30);
iteration_counter = 1;
for i = 10:10:300
    [data, iteration_matrix] = tsne(x, labels, 2, 30, i);
    iteration_3D(:,:,iteration_counter) = iteration_matrix;
    iteration_counter = iteration_counter + 1;
end