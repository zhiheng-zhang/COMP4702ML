% The XOR Example - Batch-Mode Training
%
% Author: Marcelo Augusto Costa Fernandes
% DCA - CT - UFRN
% mfernandes@dca.ufrn.br

clc;
close all;
clear all;

% p = 2;
% H = 2;
% m = 1;
% 
% mu = .75;
% alpha = 0.001;
% 
% epoch = 4000;
% MSEmin = 1e-20;
% 
% X = [0 0 1 1;0 1 0 1];
% D = [0 1 1 0];


% ******************************


p = 2;
H = 4;
m = 1;

% mu = .75;s
mu = 10;
alpha = 0.001;

epoch = 700;
MSEmin = 0.0477;


load('mnist_reduced.mat');
load('test_labels.mat');
X = transpose(reduced_data);
D = zeros(1,60000);

% X = [2,3,4,2,3,4,-2,-3,-4,-2,-3,-4;2,3,4,-2,-3,-4,2,3,4,-2,-3,-4];
% D = [0,0,0,1,1,1,0.3,0.3,0.3,0.7,0.7,0.7];
for i = 1:60000
%     if(i <= 3000)
%         D(1,i) = 0;
%     elseif(i > 3000 && i <= 7000)
%         D(1,i) = 0.5;
%     elseif(i>7000)
%         D(1,i) = 1;
%     end
    if(i <= 6000)
        D(1,i) = 0.1;
    elseif( i > 6000 && i <= 12000)
        D(1,i) = 0.2;
    elseif( i > 12000 && i <= 18000)
        D(1,i) = 0.3;
    elseif( i > 18000 && i <= 24000)
        D(1,i) = 0.4;
    elseif( i > 24000 && i <= 30000)
        D(1,i) = 0.5;
    elseif( i > 30000 && i <= 36000)
        D(1,i) = 0.6;
    elseif( i > 36000 && i <= 42000)
        D(1,i) = 0.7;
    elseif( i > 42000 && i <= 48000)
        D(1,i) = 0.8;
    elseif( i > 48000 && i <= 54000)
        D(1,i) = 0.9;
    elseif( i > 54000 && i <= 60000)
        D(1,i) = 1;
    end
end


[Wx,Wy,MSE]=trainMLP(p,H,m,mu,alpha,X,D,epoch,MSEmin);



% semilogy(MSE);

disp(['D = [' num2str(D) ']']);

Y = runMLP(X,Wx,Wy);

disp(['Y = [' num2str(Y) ']']);
X = transpose(X);
figure(1);
hold on;
for i = 1:60000
%     if(i <= 3000)
%         D(1,i) = 0;
%     elseif(i > 3000 && i <= 7000)
%         D(1,i) = 0.5;
%     elseif(i>7000)
%         D(1,i) = 1;
%     end
    if(Y(1,i) < 0.15)
        plot(X(i,1),X(i,2), '.','Color', [1, 0, 0]);
    elseif( Y(1,i) < 0.25)
        plot(X(i,1),X(i,2), '.','Color', [1, 1, 0]);
    elseif( Y(1,i) < 0.35)
        plot(X(i,1),X(i,2), '.','Color', [0, 1, 0]);
    elseif( Y(1,i) < 0.45)
        plot(X(i,1),X(i,2), '.','Color', [0, 0, 1]);
    elseif( Y(1,i) < 0.55)
        plot(X(i,1),X(i,2), '.','Color', [0, 1, 1]);
    elseif( Y(1,i) < 0.65)
        plot(X(i,1),X(i,2), '.','Color', [1, 0, 1]);
    elseif( Y(1,i) < 0.75)
        plot(X(i,1),X(i,2), '.','Color', [0, 0, 0]);
    elseif( Y(1,i) < 0.85)
        plot(X(i,1),X(i,2), '.','Color', [1, 0.5, 0.5]);
    elseif( Y(1,i) < 0.95)
        plot(X(i,1),X(i,2), '.','Color', [0.5, 0.5, 1]);
    elseif(  Y(1,i) <= 1)
        plot(X(i,1),X(i,2), '.','Color', [0.5, 1, 0.5]);
    end
end

