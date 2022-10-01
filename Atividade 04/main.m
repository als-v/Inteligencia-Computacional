% Exemplo


function [] = main(nomeArquivoSaida, folder, numBlocosV, numBlocosH)

dirListing = dir(folder);

arquivoTeste = strcat(append(nomeArquivoSaida, '_teste'), '.txt');
fidTeste = fopen(arquivoTeste,'w'); 

arquivoTreino = strcat(append(nomeArquivoSaida, '_treino'), '.txt');
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

                            nameClasse = fileName(end-4: end)    ;
                            %nomeArquivo 
                            I = imread(nomeArquivo) ;
                            
                            disp('TESTE')
                            geraBlocos(I, nameClasse, numBlocosV,numBlocosH, fidTeste ) ;
                    else
    
                            nomeArquivo = fullfile(fileName,arquivos(i).name)  ;
                            fopen(fileName);

                            nameClasse = fileName(end-4: end)    ;
                            %nomeArquivo 

                            I = imread(nomeArquivo) ;

                            disp('TREINO')
                            geraBlocos(I, nameClasse, numBlocosV,numBlocosH, fidTreino ) ;
                    end
            
                         
                end
                
            end
    end 
end

fclose ( fidTeste );
fclose ( fidTreino );
