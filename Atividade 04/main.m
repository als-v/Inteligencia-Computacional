% Exemplo


function [] = main(nomeArquivoSaida, folder, numBlocosV, numBlocosH)

dirListing = dir(folder);

arquivoTesteLBP = strcat(append(nomeArquivoSaida, '_LBP_teste'), '.txt');
fidTesteLBP = fopen(arquivoTesteLBP,'w'); 

arquivoTreinoLBP = strcat(append(nomeArquivoSaida, '_LBP_treino'), '.txt');
fidTreinoLBP = fopen(arquivoTreinoLBP,'w'); 

arquivoTesteGLCM = strcat(append(nomeArquivoSaida, '_GLCM_teste'), '.txt');
fidTesteGLCM = fopen(arquivoTesteGLCM,'w'); 

arquivoTreinoGLCM = strcat(append(nomeArquivoSaida, '_GLCM_treino'), '.txt');
fidTreinoGLCM = fopen(arquivoTreinoGLCM,'w'); 

arquivoTeste = strcat(append(nomeArquivoSaida, '_GLCM_LBP_teste'), '.txt');
fidTeste = fopen(arquivoTeste,'w'); 

arquivoTreino = strcat(append(nomeArquivoSaida, '_GLCM_LBP_treino'), '.txt');
fidTreino = fopen(arquivoTreino,'w'); 

for d = 3:length(dirListing)
   
    if (dirListing(d).isdir == 1)
    
        fileName = fullfile(folder,dirListing(d).name) ; 
        fopen(fileName);
        
        arquivos = dir(fileName); 
        indexTreinoTeste = 0;
        
            for i = 3 : length(arquivos) 
                
                if (arquivos(i).isdir == 0)
                    indexTreinoTeste = indexTreinoTeste + 1;
                    
                    if (indexTreinoTeste <= 18)
                            nomeArquivo = fullfile(fileName,arquivos(i).name)  ;
                            fopen(fileName);
                            
                            %nameClasse = fileName(end-4: end);
                            tamArq = size(arquivos(i).name);

                            if (tamArq(2) == 14)
                                nameClasse = arquivos(i).name(end-9: end-7);
                            else
                                nameClasse = arquivos(i).name(end-8: end-6);
                            end
                            

                            %nomeArquivo 
                            I = imread(nomeArquivo) ;
                            
                            disp('TESTE')
                            geraBlocos(I, nameClasse, numBlocosV,numBlocosH, fidTesteLBP, fidTesteGLCM, fidTeste ) ;
                    else
    
                            nomeArquivo = fullfile(fileName,arquivos(i).name)  ;
                            fopen(fileName);

                            %nameClasse = fileName(end-4: end)    ;
                            tamArq = size(arquivos(i).name);

                            if (tamArq(2) == 14)
                                nameClasse = arquivos(i).name(end-9: end-7);
                            else
                                nameClasse = arquivos(i).name(end-8: end-6);
                            end
                            %nomeArquivo 

                            I = imread(nomeArquivo) ;

                            disp('TREINO')
                            geraBlocos(I, nameClasse, numBlocosV,numBlocosH, fidTreinoLBP, fidTreinoGLCM, fidTreino ) ;
                    end
            
                         
                end
                
            end
    end 
end

fclose ( fidTeste );
fclose ( fidTreino );
