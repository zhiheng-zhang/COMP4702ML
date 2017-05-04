
load('iteration_matrix.mat');
figure(1);
% plot(iteration_matrix);
hold on;
for i = 1:30
    plot(iteration_matrix(1,i), iteration_matrix(2,i), '*'); 
end

hold on

for i = 2:30
    plot([iteration_matrix(1, i), iteration_matrix(1, i - 1)], [iteration_matrix(2, i), iteration_matrix(2, i - 1)], 'r'); 
end

title('Error Plot')
xlabel('Iteration Number')
ylabel('Error')
