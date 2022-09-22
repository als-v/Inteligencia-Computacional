function [] = partitions_hu(Image, classe, qtdeFragmentosVerticais, qtdeFragmentosHorizontais, fid, name)
    [height, width] = size( Image );
    height = height / qtdeFragmentosVerticais;
    width  = width  / qtdeFragmentosHorizontais;
    
    for idxSubImagemVertical=0:qtdeFragmentosVerticais-1
        yInicial = round( idxSubImagemVertical      * height);
        yFinal   = round((idxSubImagemVertical + 1) * height);

        for idxSubImagemHorizontal=0:qtdeFragmentosHorizontais-1
            xInicial = round( idxSubImagemHorizontal      * width);
            xFinal   = round((idxSubImagemHorizontal + 1) * width);
            subImagem = imcrop(Image, [xInicial yInicial round(xFinal - xInicial) round(yFinal - yInicial)]);
            %imshow(subImagem) ;

            % Escreva ou chame sua função aqui!!!
            vetorFeatures = invmoments(subImagem);
            % Exemplo de como imprimir no arquivo.
            %vetorFeatures = max(subImagem(1,:));
            
            fprintf(fid, '%s ', name );
            fprintf(fid, '%.100f ', vetorFeatures );
            fprintf(fid, '%s\n', classe ); % Lembre-se a classe pode ser o nome da pasta [0 - 9]
        end
    end
end