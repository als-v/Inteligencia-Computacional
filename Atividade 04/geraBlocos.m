function [] = geraBlocos(I, classe, qtdeFragmentosVerticais, qtdeFragmentosHorizontais, fid)

[height, width] = size( I );

height = height / qtdeFragmentosVerticais;
width  = width  / qtdeFragmentosHorizontais;


for idxSubImagemVertical=0:qtdeFragmentosVerticais-1
    yInicial = round( idxSubImagemVertical      * height);
    yFinal   = round((idxSubImagemVertical + 1) * height);

    for idxSubImagemHorizontal=0:qtdeFragmentosHorizontais-1
        xInicial = round( idxSubImagemHorizontal      * width);
        xFinal   = round((idxSubImagemHorizontal + 1) * width);

        subImagem = imcrop(I, [xInicial yInicial round(xFinal - xInicial) round(yFinal - yInicial)]);

        % Descomentar no caso de usar o LBP

        % LBP
        mapping=getmapping(8,'u2');
        featureVector = lbp(subImagem,2,8,mapping,'nh'); 
        fprintf(fid, '%f ', featureVector );
        fprintf(fid, '%s \n', classe ); % A classe geralmente tem relação com o nome da pasta 
        % Descomentar no caso de usar o GLCM
        
        %GLCM
        % 4 Níveis de Cinza e todos os ângulos.
        %[glcm,SI] = graycomatrix(I,'NumLevels',4, 'Offset', [0 1; -1 1;-1 0;-1 -1] , 'Symmetric',true);
        %featureVector     = graycoprops(glcm,{'Contrast','Homogeneity', 'Correlation', 'Energy'}) ;
        
        %featureVectorGLCM = struct2array(featureVector) ;
        %temp = struct2cell(featureVector);
        %featureVectorGLCM = horzcat(temp{:});

        %fprintf(fid, '%f ', featureVectorGLCM );
        %fprintf(fid, '%s \n', classe ); % A classe geralmente tem relação com o nome da pasta 

        disp('Classe:')
        disp(classe)
      

    end

end
end