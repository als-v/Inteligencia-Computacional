    
teste = load('arquivo.txt'); % Lembre que neste exemplo a última coluna é a classe ;
treino = load('arquivo.txt'); % Lembre que neste exemplo a última coluna é a classe ;

testdata = teste(:, 1: end-1) ;
traindata = treino(:, 1: end-1) ;
testlabel = teste(:, end) ;
trainlabel = treino(:,end) ;

Mdl = fitcknn(traindata, trainlabel,'Distance','euclidean','NumNeighbors',1,'Standardize',1,'BreakTies','nearest');
pred = predict(Mdl, testdata) ;
matConf = confusionmat(testlabel,pred) ; 
acurracy = sum(diag(matConf))/sum(matConf(:)) ;

disp(acurracy) ;

