clear
profile on
a = randn(200,2);
b = a + 4;
c = a;
c(:,1) = 3*c(:,1);
c = c - 4;
d = [a; b];
e = [a; b; c];
figure(1);

d = transpose(d);
e = transpose(e);
subplot(2,1,1);
plot(e(1,:),e(2,:),'o');
title('DataSet E')
bandWidth = 5

tic
[clustCent,data2pointer,clustMembsCell] = MeanShiftAlgorithm(e, bandWidth);
toc

numClust = length(clustMembsCell);
subplot(2,1,2);
hold on
cVec = 'bgrcmykbgrcmykbgrcmykbgrcmyk';%, cVec = [cVec cVec];
for k = 1:min(numClust,length(cVec))
    myMembers = clustMembsCell{k};
    myClustCen = clustCent(:,k);
    plot(e(1,myMembers),e(2,myMembers),[cVec(k) '.'])
    plot(myClustCen(1),myClustCen(2),'o','MarkerEdgeColor','k','MarkerFaceColor',cVec(k), 'MarkerSize',10)
end
title('Bandwidth = 5')
