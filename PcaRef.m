% function [ evectors, evalues, reduced_data, pov ] = PCA( raw_data, n )

clc;
close all;
clear all;

load('mnist_test.mat');
raw_data = test_X;
n = 2;
%input is raw_data and the number of desired dimension

[temp, colum_number] = size(raw_data);

cov_matrix = cov(raw_data);

[evectors, evalues] = eig(cov_matrix);

values = zeros(1, colum_number);

for i = 1:colum_number

values(1,i) = evalues(i,i);

end

[values,index] = sort(values,'descend');

vectors = zeros(colum_number,n);

sum_val = sum(values);

sum_pv = 0;

for i = 1:n

vectors(:,i) = evectors(:,index(i));

sum_pv = sum_pv+values(1,i);

end

reduced_data = raw_data*vectors;

pov = (sum_pv/sum_val);

% end