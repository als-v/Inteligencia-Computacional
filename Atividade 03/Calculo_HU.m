diretorioPrincipal = uigetdir();

labelFolder = '\teste\';
diretorio = append(diretorioPrincipal, labelFolder);

folders = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

fragmentosVerticais = 15;
fragmentosHorizontais = 15;

% para cada classe
for class = 1:length(folders)

    fid = fopen(append("result", labelFolder, "result_HU_", folders(class), '.txt'), 'w');
    folderClass = append(diretorio, folders(class));
    fileListFolder = dir(fullfile(folderClass, '\*.bmp'));
    folderClass = append(folderClass, '\');

    for file = 1:length(fileListFolder)
        %disp(append(folderClass, fileListFolder(file).name))
        im = imread(append(folderClass, fileListFolder(file).name));
        disp(invmoments(im))
        partitions_hu(im, folders(class), fragmentosVerticais, fragmentosHorizontais, fid, fileListFolder(file).name)
        %fprintf(fid, '%s, %d, %d, %d, %d, %d, %d, %d, %s\n', fileListFolder(file).name, invmoments(im), folders(class));
    end

    fclose(fid)
end

labelFolder = '\treino\';
diretorio = append(diretorioPrincipal, labelFolder);

for class = 1:length(folders)

    fid = fopen(append("result", labelFolder, "result_HU_", folders(class), '.txt'), 'w');
    folderClass = append(diretorio, folders(class));
    fileListFolder = dir(fullfile(folderClass, '\*.bmp'));
    folderClass = append(folderClass, '\');

    for file = 1:length(fileListFolder)
        %disp(append(folderClass, fileListFolder(file).name))
        im = imread(append(folderClass, fileListFolder(file).name));
        disp(invmoments(im))
        partitions_hu(im, folders(class), fragmentosVerticais, fragmentosHorizontais, fid, fileListFolder(file).name)
        %fprintf(fid, '%s, %d, %d, %d, %d, %d, %d, %d, %s\n', fileListFolder(file).name, invmoments(im), folders(class));
    end

    fclose(fid)
end
