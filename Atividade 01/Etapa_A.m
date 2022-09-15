% classes
folders = ['triangle|', 'star|', 'square|', 'circle|'];
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
        
        % para cada classe, pego 10 imagens aleatorias
        for rep = 1:10
            folderClass = append(diretorio, className);
            fileListFolder = dir(fullfile(folderClass, '/*.png'));
            randomIndexFolder = randi(length(fileListFolder), 1, 1);
            im = imread(append(folderClass, fileListFolder(randomIndexFolder).name));

            if strcmp(className, 'triangle\') == 1
                triangleImg{rep} = im;
                triangleName{rep} = fileListFolder(randomIndexFolder).name;
            
            elseif strcmp(className, 'star\') == 1
                starImg{rep} = im;
                starName{rep} = fileListFolder(randomIndexFolder).name;

            elseif strcmp(className, 'square\') == 1
                squareImg{rep} = im;
                squareName{rep} = fileListFolder(randomIndexFolder).name;

            elseif strcmp(className, 'circle\') == 1
                circleImg{rep} = im;
                circleName{rep} = fileListFolder(randomIndexFolder).name;
            
            else
                disp('ERRO: Classe nao indentificada');

            end

        end

        className = '';
    end
end

coeficiente = [];
err = [];

% realizo o calculo com todas as imagens das classes entre si
for imgPos = 1:length(triangleImg)
    
    for prxImgPos = (imgPos+1):length(triangleImg)
        A = triangleImg{imgPos};
        B = triangleImg{prxImgPos};

        C = corrcoef(double(triangleImg{imgPos}), double(triangleImg{prxImgPos}));
        D = immse(double(triangleImg{imgPos}), double(triangleImg{prxImgPos}));
       
        coeficiente = [coeficiente, C(2)];
        err = [err, D];

    end
end

% realizo o calculo com todas as imagens das classes entre si
for imgPos = 1:length(starImg)
    
    for prxImgPos = (imgPos+1):length(starImg)
        A = starImg{imgPos};
        B = starImg{prxImgPos};

        C = corrcoef(double(starImg{imgPos}), double(starImg{prxImgPos}));
        D = immse(double(starImg{imgPos}), double(starImg{prxImgPos}));

        coeficiente = [coeficiente, C(2)];
        err = [err, D];

    end
end

% realizo o calculo com todas as imagens das classes entre si
for imgPos = 1:length(squareImg)
    
    for prxImgPos = (imgPos+1):length(squareImg)
        A = squareImg{imgPos};
        B = squareImg{prxImgPos};
        
        C = corrcoef(double(squareImg{imgPos}), double(squareImg{prxImgPos}));
        D = immse(double(squareImg{imgPos}), double(squareImg{prxImgPos}));

        coeficiente = [coeficiente, C(2)];
        err = [err, D];

    end
end

% realizo o calculo com todas as imagens das classes entre si
for imgPos = 1:length(circleImg)
    
    for prxImgPos = (imgPos+1):length(circleImg)
        A = circleImg{imgPos};
        B = circleImg{prxImgPos};

        C = corrcoef(double(circleImg{imgPos}), double(circleImg{prxImgPos}));
        D = immse(double(circleImg{imgPos}), double(circleImg{prxImgPos}));

        coeficiente = [coeficiente, C(2)];
        err = [err, D];

    end
end

coeficiente2 = [];
err2 = [];

% realizo o calculo de todas as imagens de uma classes com outra
for imgPos = 1:length(triangleImg)
    
    for prxImgPos = 1:length(starImg)

        C = corrcoef(double(triangleImg{imgPos}), double(starImg{prxImgPos}));
        D = immse(double(triangleImg{imgPos}), double(starImg{prxImgPos}));

        coeficiente2 = [coeficiente2, C(2)];
        err2 = [err2, D];

    end
end

% realizo o calculo de todas as imagens de uma classes com outra
for imgPos = 1:length(triangleImg)
    
    for prxImgPos = 1:length(squareImg)

        C = corrcoef(double(triangleImg{imgPos}), double(squareImg{prxImgPos}));
        D = immse(double(triangleImg{imgPos}), double(squareImg{prxImgPos}));

        coeficiente2 = [coeficiente2, C(2)];
        err2 = [err2, D];

    end
end

% realizo o calculo de todas as imagens de uma classes com outra
for imgPos = 1:length(triangleImg)
    
    for prxImgPos = 1:length(circleImg)

        C = corrcoef(double(triangleImg{imgPos}), double(circleImg{prxImgPos}));
        D = immse(double(triangleImg{imgPos}), double(circleImg{prxImgPos}));

        coeficiente2 = [coeficiente2, C(2)];
        err2 = [err2, D];

    end
end

% realizo o calculo de todas as imagens de uma classes com outra
for imgPos = 1:length(starImg)
    
    for prxImgPos = 1:length(squareImg)

        C = corrcoef(double(starImg{imgPos}), double(squareImg{prxImgPos}));
        D = immse(double(starImg{imgPos}), double(squareImg{prxImgPos}));

        coeficiente2 = [coeficiente2, C(2)];
        err2 = [err2, D];

    end
end

% realizo o calculo de todas as imagens de uma classes com outra
for imgPos = 1:length(starImg)
    
    for prxImgPos = 1:length(circleImg)

        C = corrcoef(double(starImg{imgPos}), double(circleImg{prxImgPos}));
        D = immse(double(starImg{imgPos}), double(circleImg{prxImgPos}));

        coeficiente2 = [coeficiente2, C(2)];
        err2 = [err2, D];

    end
end

% realizo o calculo de todas as imagens de uma classes com outra
for imgPos = 1:length(squareImg)
    
    for prxImgPos = 1:length(circleImg)

        C = corrcoef(double(squareImg{imgPos}), double(circleImg{prxImgPos}));
        D = immse(double(squareImg{imgPos}), double(circleImg{prxImgPos}));

        coeficiente2 = [coeficiente2, C(2)];
        err2 = [err2, D];

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
