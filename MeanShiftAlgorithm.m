function [clustCent,data2cluster, cluster2dataCell] = sampleMeanShiftAlgorithm(dataPts, bandWidth)

%**** Initialize stuff ***
[numDim,numPts] = size(dataPts);
numClust = 0;  %number of output cluster
radius = bandWidth; %radius for flat kernel function
bandSq  = radius^2;
initPtInds  = 1:numPts;
stopThresh = 1e-3*radius; %when sampleMean has converged
clustCent = []; %center of clust
%track if a points been seen already
beenVisitedFlag = zeros(1,numPts,'uint8');
%number of points to posibaly use as initilization points
numInitPts = numPts;                 
%used to resolve conflicts on cluster membership
clusterVotes    = zeros(1,numPts,'uint16');             

while numInitPts
    
    % pick a random seed point
    tempInd = ceil( (numInitPts-1e-6)*rand);       
    % use this point as start of sampleMean
    stInd = initPtInds(tempInd);  
    % intilize sampleMean to this points location
    sampleMean = dataPts(:,stInd);   
    % points that will get added to this cluster
    myMembers  = [];               
    % used to resolve conflicts on cluster membership
    thisClusterVotes = zeros(1,numPts,'uint16');         
    
    while 1     %loop untill convergence
        %dist squared from sampleMean to all points still active
        sqDistToAll = sum((repmat(sampleMean,1,numPts) - dataPts).^2);    
        inInds = find(sqDistToAll < bandSq); %points within radius
        %add a vote for all the in points belonging to this cluster
        thisClusterVotes(inInds) = thisClusterVotes(inInds)+1; 
        presampleMean   = sampleMean; %save the old sampleMean
        sampleMean      = mean(dataPts(:,inInds),2);  %compute the new sampleMean
        % add any point within radius to the cluster
        myMembers   = [myMembers inInds]; 
        % mark that these points have been visited
        beenVisitedFlag(myMembers) = 1; 
        % if sampleMean doesn't move much stop this cluster 
        if norm(sampleMean-presampleMean) < stopThresh
            %check for merge posibilities
            mergeWith = 0;
            for cN = 1:numClust
                %distance from posible new clust max to old clust max
                distToOther = norm(sampleMean-clustCent(:,cN));  
                %if its within radius/2 merge new and old
                if distToOther < radius/2
                    mergeWith = cN;
                    break;
                end
            end
            if mergeWith > 0    % something to merge
                % Record the max as the sampleMean of the two merged 
                clustCent(:,mergeWith) = 0.5*(sampleMean+clustCent(:,mergeWith));  
                % Add these votes to the merged cluster
                clusterVotes(mergeWith,:) = clusterVotes(mergeWith,:)
                + thisClusterVotes; 
            else    %its a new cluster
                numClust = numClust+1; %increment clusters
                clustCent(:,numClust)  = sampleMean; %record the sampleMean
                % Add these votes to the merged cluster
                clusterVotes(numClust,:)    = thisClusterVotes;
            end
            break;
        end    
    end
    
    % initialize with any of the points not yet visited
    initPtInds = find(beenVisitedFlag == 0);           
    numInitPts = length(initPtInds); %number of active points in set
    
end

% A point belongs to the cluster with the most votes
[~,data2cluster] = max(clusterVotes,[],1);                

% Calculate cluster2data cell
if nargout > 2
    cluster2dataCell = cell(numClust,1);
    for cN = 1:numClust
        myMembers = find(data2cluster == cN);
        cluster2dataCell{cN} = myMembers;
    end
end
