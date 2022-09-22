function [] = partitions_pixels(Image, classe, qtdeFragmentosVerticais, qtdeFragmentosHorizontais, fid, name)
    [height, width] = size(Image);
    height = height / qtdeFragmentosVerticais;
    width  = width  / qtdeFragmentosHorizontais;

    valorQuadrante = [];

    for idxSubImagemVertical=0:qtdeFragmentosVerticais-1
        yInicial = round( idxSubImagemVertical      * height);
        yFinal   = round((idxSubImagemVertical + 1) * height);

        for idxSubImagemHorizontal=0:qtdeFragmentosHorizontais-1
            xInicial = round( idxSubImagemHorizontal      * width);
            xFinal   = round((idxSubImagemHorizontal + 1) * width);

            subImagem = imcrop(Image, [xInicial yInicial round(xFinal - xInicial) round(yFinal - yInicial)]);
            %imshow(subImagem);

            % Escreva ou chame sua função aqui!!!           
            valorQuadrante = [valorQuadrante, sum(sum(subImagem))/255];
        end

    end

    % Exemplo de como imprimir no arquivo.
    fprintf(fid, '%s ', name );
    fprintf(fid, '%f ', valorQuadrante );
    fprintf(fid, '%s\n', classe ); % Lembre-se a classe pode ser o nome da pasta [0 - 9]
end