function [evector, evalue, reduced_data, var_percent] = Pca(dataSet)
    % Extract the number of C and P of this dataset
    [numC, numP] = size(dataSet);
    % Finding covariance matrix
    covariancematrix=cov(dataSet);
    % Finding eigenvector and eigenvalue 
    [evector,evalue] = eig(covariancematrix);
    % Initialising max and second max eigenvector and eigenvalue
    maxEvalue = 0;
    maxIndex = 0;
    nextEvalue = 0;
    sumEigenValue = 0;
    maxEvector = zeros(numP,2);

    % Finding first maximum eigenvalue and store eigenvector
    for i = 1:numP
        if maxEvalue < evalue(i,i)
            maxEvalue = evalue(i,i);
            maxIndex = i;
        end
    end
    for j = 1:numP
        maxEvector(j,1) = evector(j,maxIndex);
    end

    % Finding second maximum eigenvalue and store eigenvector
    for i = 1:numP
        if nextEvalue < evalue(i,i) && evalue(i,i) ~= maxEvalue
            nextEvalue = evalue(i,i);
            maxIndex = i;
        end
        sumEigenValue = sumEigenValue + evalue(i,i);
    end
    for j = 1:numP
        maxEvector(j,2) = evector(j,maxIndex);
    end
    
    % Outputing the reduced dataset
    reduced_data = dataSet * maxEvector;
    
    % Generating the proportion of variance
    sumMaxEvalue = maxEvalue + nextEvalue;
    var_percent = sumMaxEvalue/sumEigenValue;
    
end
