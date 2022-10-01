%Example:
%descriptor('descritor_Base_TipoDocumento_Divisao', 'endereço', 1,1, descritor)
%descritor (1,2,3) - 1 == LBP ; 2 == LPQ ; 3 == SURF ;
% letter = Carta 1 ou carta 2 
% model = quais blocos que serão usados; 
function [] = descriptor(nomeArquivoEntrada, pasta, numBlocosV, numBlocosH, feat)

nomeArquivo = nomeArquivoEntrada;
folder = pasta ;
dirListing = dir(pasta);

arquivo = strcat(nomeArquivo, '.txt');
fid = fopen(arquivo,'w');  

for d = 3:length(dirListing)
   
    if (dirListing(d).isdir == 1)
    
        fileName = fullfile(folder,dirListing(d).name); 
    
        fopen(fileName);
        
        arquivos = dir(fileName);
        nome = dirListing(d).name ; % nomeArquivo(1, end -10 : end) ;
        autor = nome ; %(3:7) ; % Free = 3 até 8
        
           
            for i = 3 : length(arquivos) 
                
                if (arquivos(i).isdir == 0)
                        
                    %[x, t] = size(arquivos(i).name);
                         
                        
                            nomeArquivo = fullfile(fileName,arquivos(i).name) ;
                            fopen(fileName);

                            I = imread(nomeArquivo);
                            %imshow(I);
                         
                            geraBlocos(I, nomeArquivo,numBlocosV,numBlocosH, fid, feat, autor) ;
                           
                         
                end
                
            end
    end 
end

fclose ( fid );
