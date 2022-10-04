function [] = geraBlocos(I, classe, qtdeFragmentosVerticais, qtdeFragmentosHorizontais, fidLbp, fidGlcm, fid)

[height, width] = size( I );

height = height / qtdeFragmentosVerticais;
width  = width  / qtdeFragmentosHorizontais;

totalValues = [];
lbpValues = [];
glcmValues = [];

disp('Classe:')
disp(classe)

for idxSubImagemVertical=0:qtdeFragmentosVerticais-1
    yInicial = round( idxSubImagemVertical      * height);
    yFinal   = round((idxSubImagemVertical + 1) * height);

    for idxSubImagemHorizontal=0:qtdeFragmentosHorizontais-1
        xInicial = round( idxSubImagemHorizontal      * width);
        xFinal   = round((idxSubImagemHorizontal + 1) * width);

        subImagem = imcrop(I, [xInicial yInicial round(xFinal - xInicial) round(yFinal - yInicial)]);
        
        % LBP
        mapping=getmapping(8,'u2');
        featureVector = lbp(subImagem,2,8,mapping,'nh'); 

        lbpValues = [lbpValues, featureVector];
        totalValues = [totalValues, featureVector];
        
        % GLCM
        [glcm,SI] = graycomatrix(I,'NumLevels',4, 'Offset', [0 1; -1 1;-1 0;-1 -1] , 'Symmetric',true);
        featureVector     = graycoprops(glcm) ;
        
        temp = struct2cell(featureVector);
        featureVectorGLCM = horzcat(temp{:});

        glcmValues = [glcmValues, featureVectorGLCM];
        totalValues = [totalValues, featureVectorGLCM];


     

    end

end

fprintf(fidLbp, '%.1000f ', lbpValues );
fprintf(fidLbp, '%s\n', classe );

fprintf(fidGlcm, '%.1000f ', glcmValues );
fprintf(fidGlcm, '%s\n', classe );

fprintf(fid, '%.1000f ', totalValues );
fprintf(fid, '%s\n', classe ); 
end