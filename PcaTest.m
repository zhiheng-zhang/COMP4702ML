
clc;
close all;
clear all;
load('mnist_test.mat');

[numC, numP] = size(test_X);

[evector, evalue, reduced_data, var_percent] = Pca(test_X);
figure(1);
hold on;

% for i = 1 : numC
%     if(i <= 1000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [1, 0, 0]);
%     elseif( i > 1000 && i <= 2000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [1, 1, 0]);
%     elseif( i > 2000 && i <= 3000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0, 1, 0]);
%     elseif( i > 3000 && i <= 4000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0, 0, 1]);
%     elseif( i > 4000 && i <= 5000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0, 1, 1]);        
%     elseif( i > 5000 && i <= 6000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [1, 0, 1]);
%     elseif( i > 6000 && i <= 7000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0, 0, 0]);
%     elseif( i > 7000 && i <= 8000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [1, 0.5, 0.5]);       
%     elseif( i > 8000 && i <= 9000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0.5, 0.5, 1]); 
%     elseif( i > 9000 && i <= 10000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0.5, 1, 0.5]); 
%     end
% end

% Plot the reduced data
% for i = 1 : numC
%     if(i <= 6000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [1, 0, 0]);
%     elseif( i > 6000 && i <= 12000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [1, 1, 0]);
%     elseif( i > 12000 && i <= 18000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0, 1, 0]);
%     elseif( i > 18000 && i <= 24000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0, 0, 1]);
%     elseif( i > 24000 && i <= 30000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0, 1, 1]);        
%     elseif( i > 30000 && i <= 36000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [1, 0, 1]);
%     elseif( i > 36000 && i <= 42000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0, 0, 0]);
%     elseif( i > 42000 && i <= 48000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [1, 0.5, 0.5]);       
%     elseif( i > 48000 && i <= 54000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0.5, 0.5, 1]); 
%     elseif( i > 54000 && i <= 60000)
%         plot(reduced_data(i,1),reduced_data(i,2), '.','Color', [0.5, 1, 0.5]); 
%     end
% end

% 
eigenvalue = zeros(1, numP);
for i = 1 : numP
    eigenvalue(1,i) = evalue(i,i);
end

[eigenvalue, index] = sort(eigenvalue,'descend');
plot(eigenvalue(1,1:50));
title('Scree graph')
xlabel('Factor Number')
ylabel('Eigenvalue')