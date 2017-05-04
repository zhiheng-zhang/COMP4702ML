clc;
clear all;
close all;

load('iteration3D.mat');
% 
% t = 0:pi/50:10*pi;
% st = sin(t);
% ct = cos(t);
% 
% figure
% plot3(st,ct,t)
% 
% 
figure(1);
hold on;

iteration = zeros(1,900);
perplexity = zeros(1,900);
error = zeros(1,900);

counter = 1;

for i = 10:10:300
    for j = 10:10:300
        iteration(counter) = i;
        perplexity(counter) = j;
        error(counter) = iteration_3D(2,j/10,i/10);
        counter = counter + 1;
    end
end

% plot3(iteration, perplexity, error, '+');
% title('3D t-SNE plot by MNIST_train')
% xlabel('Iteration')
% ylabel('Perplexity')
% zlabel('Cost')

subiteration = zeros(1,30);
suberror = zeros(1,30);
subcounter = 1;
for i = 1:900
    if(perplexity(i) == 50)
        subiteration(counter) = iteration(1,i);
        suberror(counter) = error(1,i);
        counter = counter + 1;
    end
end

plot(subiteration(1,:), suberror(1,:), '-');

title('2D t-SNE plot by MNIST_train when perplexity = 50')
xlabel('Iteration')
ylabel('Cost')

