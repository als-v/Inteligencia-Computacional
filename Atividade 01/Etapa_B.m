folders = ['Acer_Opalus|', 'Acer_Mono|', 'Acer_Capillipes|'];
className = '';

% diretorio onde estao localizados os conjuntos
diretorio = uigetdir();
diretorio = append(diretorio, '\');

% para cada classe
for class = 1:length(folders)

    % vou montando o nome da classe
    if folders(class) ~= '|'
        className = append(className, folders(class));

    elseif folders(class) == '|'
        className = append(className, '\');

        % para cada classe, pego 3 imagens aleatorias
        for rep = 1:3
            folderClass = append(diretorio, className);
            fileListFolder = dir(fullfile(folderClass, '/*.jpg'));
               
            randomIndexFolder = randi(length(fileListFolder), 1, 1);
            im=imread(append(folderClass, fileListFolder(randomIndexFolder).name));
            
            if strcmp(className, 'Acer_Opalus\') == 1
                opalusImg{rep} = im;
                opalusName{rep} = fileListFolder(randomIndexFolder).name;

            elseif strcmp(className, 'Acer_Mono\') == 1
                monoImg{rep} = im;
                monoName{rep} = fileListFolder(randomIndexFolder).name;

            elseif strcmp(className, 'Acer_Capillipes\') == 1
                capillipesImg{rep} = im;
                capillipesName{rep} = fileListFolder(randomIndexFolder).name;

            else
                fprintf('ERRO: Classe nao indentificada');
                
            end

        end

        className = '';
    end
end

coeficiente = [];
err = [];

% realizo o calculo com todas as imagens das classes entre si
for imgPos = 1:length(opalusImg)
    
    for prxImgPos = (imgPos+1):length(opalusImg)
        A = opalusImg{imgPos};
        B = opalusImg{prxImgPos};
        
        sizeA = length(A);
        sizeB = length(B);
        
        % necessario tratamento caso o tamanho de uma imagem seja maior que
        % o outro
        if sizeA == sizeB
            C = corrcoef(double(A), double(B));
            D = immse(double(A), double(B));
        
        else

            if sizeA > sizeB
                %newB = zeros(size(A));
                %newB(1:size(B,1),1:size(B,2)) = B;
                
                %newB = [B, zeros(size(B, 1), size(A, 2)-size(B, 2)); zeros(size(A, 1)-size(B, 1), size(A, 2))];

                newB = double(imresize(B,size(A)));
             
                C = corrcoef(double(A), (newB));
                D = immse(double(A), (newB));

            else
                %newA = zeros(size(B));
                %newA(1:size(A,1),1:size(A,2)) = A;
                
                %newA = [A, zeros(size(A, 1), size(B, 2)-size(A, 2)); zeros(size(B, 1)-size(A, 1), size(B, 2))];

                newA = double(imresize(A,size(B)));

                C = corrcoef((newA), double(B));
                D = immse((newA), double(B));

            end

        end
        
        coeficiente = [coeficiente, C(2)];
        err = [err, D];

    end
end

% realizo o calculo com todas as imagens das classes entre si
for imgPos = 1:length(monoImg)
    
    for prxImgPos = (imgPos+1):length(monoImg)
        A = monoImg{imgPos};
        B = monoImg{prxImgPos};

        sizeA = length(A);
        sizeB = length(B);
        
        % necessario tratamento caso o tamanho de uma imagem seja maior que
        % o outro
        if sizeA == sizeB
            C = corrcoef(double(A), double(B));
            D = immse(double(A), double(B));
        
        else

            if sizeA > sizeB
                %newB = zeros(size(A));
                %newB(1:size(B,1),1:size(B,2)) = B;
                
                newB = double(imresize(B,size(A)));

                C = corrcoef(double(A), (newB));
                D = immse(double(A), (newB));

            else
                %newA = zeros(size(B));
                %newA(1:size(A,1),1:size(A,2)) = A;
                
                newA = double(imresize(A,size(B)));

                C = corrcoef((newA), double(B));
                D = immse((newA), double(B));

            end

        end

        coeficiente = [coeficiente, C(2)];
        err = [err, D];
    end
    
end

% realizo o calculo com todas as imagens das classes entre si
for imgPos = 1:length(capillipesImg)
    
    for prxImgPos = (imgPos+1):length(capillipesImg)
        A = capillipesImg{imgPos};
        B = capillipesImg{prxImgPos};

        sizeA = length(A);
        sizeB = length(B);
        
        % necessario tratamento caso o tamanho de uma imagem seja maior que
        % o outro
        if sizeA == sizeB
            C = corrcoef(double(A), double(B));
            D = immse(double(A), double(B));
        
        else

            if sizeA > sizeB
                %newB = zeros(size(A));
                %newB(1:size(B,1),1:size(B,2)) = B;
                
                newB = double(imresize(B,size(A)));

                C = corrcoef(double(A), (newB));
                D = immse(double(A), (newB));

            else
                %newA = zeros(size(B));
                %newA(1:size(A,1),1:size(A,2)) = A;
                
                newA = double(imresize(A,size(B)));

                C = corrcoef((newA), double(B));
                D = immse((newA), double(B));

            end

        end

        coeficiente = [coeficiente, C(2)];
        err = [err, D];
    end
end

coeficiente2 = [];
err2 = [];

% realizo o calculo de todas as imagens de uma classes com outra
for imgPos = 1:length(opalusImg)
    
    for prxImgPos = 1:length(monoImg)
        
        A = opalusImg{imgPos};
        B = monoImg{prxImgPos};

        sizeA = length(A);
        sizeB = length(B);
        
        % necessario tratamento caso o tamanho de uma imagem seja maior que
        % o outro
        if sizeA == sizeB
            C = corrcoef(double(A), double(B));
            D = immse(double(A), double(B));
        
        else

            if sizeA > sizeB
                %newB = zeros(size(A));
                %newB(1:size(B,1),1:size(B,2)) = B;
                
                newB = double(imresize(B,size(A)));

                C = corrcoef(double(A), (newB));
                D = immse(double(A), (newB));

            else
                %newA = zeros(size(B));
                %newA(1:size(A,1),1:size(A,2)) = A;
                
                newA = double(imresize(A,size(B)));

                C = corrcoef((newA), double(B));
                D = immse((newA), double(B));

            end

        end

        coeficiente2 = [coeficiente2, C(2)];
        err2 = [err2, D];
    end
end

% realizo o calculo de todas as imagens de uma classes com outra
for imgPos = 1:length(opalusImg)
    
    for prxImgPos = 1:length(capillipesImg)

        A = opalusImg{imgPos};
        B = capillipesImg{prxImgPos};

        sizeA = length(A);
        sizeB = length(B);
        
        % necessario tratamento caso o tamanho de uma imagem seja maior que
        % o outro
        if sizeA == sizeB
            C = corrcoef(double(A), double(B));
            D = immse(double(A), double(B));
        
        else

            if sizeA > sizeB
                %newB = zeros(size(A));
                %newB(1:size(B,1),1:size(B,2)) = B;
                
                newB = double(imresize(B,size(A)));

                C = corrcoef(double(A), (newB));
                D = immse(double(A), (newB));

            else
                %newA = zeros(size(B));
                %newA(1:size(A,1),1:size(A,2)) = A;
                
                newA = double(imresize(A,size(B)));

                C = corrcoef((newA), double(B));
                D = immse((newA), double(B));

            end

        end

        coeficiente2 = [coeficiente2, C(2)];
        err2 = [err2, D];
    end
end

% realizo o calculo de todas as imagens de uma classes com outra
for imgPos = 1:length(monoImg)
    
    for prxImgPos = 1:length(capillipesImg)
        
        A = monoImg{imgPos};
        B = capillipesImg{prxImgPos};

        sizeA = length(A);
        sizeB = length(B);
        
        % necessario tratamento caso o tamanho de uma imagem seja maior que
        % o outro
        if sizeA == sizeB
            C = corrcoef(double(A), double(B));
            D = immse(double(A), double(B));
        
        else

            if sizeA > sizeB
                %newB = zeros(size(A));
                %newB(1:size(B,1),1:size(B,2)) = B;
                
                newB = double(imresize(B,size(A)));

                C = corrcoef(double(A), (newB));
                D = immse(double(A), (newB));

            else
                %newA = zeros(size(B));
                %newA(1:size(A,1),1:size(A,2)) = A;
                
                newA = double(imresize(A,size(B)));

                C = corrcoef((newA), double(B));
                D = immse((newA), double(B));

            end

        end

        coeficiente2 = [coeficiente2, C(2)];
        err2 = [err2, D]
    end
end

% ao final são mostrados os resultados dos experimentos, em conjunto com o desvio padrão
fprintf(' ============ RESULTADOS ============ \n')
fprintf('Media similaridade de todas as classes entre si:');
disp(mean(coeficiente))
fprintf('Desvio padrao:');
disp(std(coeficiente))
fprintf('Erro Quadratico Medio de todas as classes entre si:');
disp(mean(err))
fprintf('Desvio padrao:');
disp(std(err))

fprintf('\nMedia similaridade de todas as classes entre cada classe:');
disp(mean(coeficiente2))
fprintf('Desvio padrao:');
disp(std(coeficiente2))
fprintf('Erro Quadratico Medio de todas as classes entre si:');
disp(mean(err2))
fprintf('Desvio padrao:');
disp(std(err2))
