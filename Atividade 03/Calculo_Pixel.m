diretorioPrincipal = uigetdir();

labelFolder = '\treino\';
diretorio = append(diretorioPrincipal, labelFolder);

folders = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

fragmentosVerticais = 6;
fragmentosHorizontais = 6;

for class = 1:length(folders)

    fid = fopen(append("result", labelFolder, "result_Pixels_", folders(class), '.txt'), 'w');
    folderClass = append(diretorio, folders(class));
    fileListFolder = dir(fullfile(folderClass, '/*.bmp'));
    folderClass = append(folderClass, '\');

    for file = 1:length(fileListFolder)
        %disp(append(folderClass, fileListFolder(file).name))
        im = imread(append(folderClass, fileListFolder(file).name));
        partitions_pixels(im, folders(class), fragmentosVerticais, fragmentosHorizontais, fid, fileListFolder(file).name)
    end

    fclose(fid)
end

labelFolder = '\teste\';
diretorio = append(diretorioPrincipal, labelFolder);

for class = 1:length(folders)

    fid = fopen(append("result", labelFolder, "result_Pixels_", folders(class), '.txt'), 'w');
    folderClass = append(diretorio, folders(class));
    fileListFolder = dir(fullfile(folderClass, '/*.bmp'));
    folderClass = append(folderClass, '\');

    for file = 1:length(fileListFolder)
        %disp(append(folderClass, fileListFolder(file).name))
        im = imread(append(folderClass, fileListFolder(file).name));
        partitions_pixels(im, folders(class), fragmentosVerticais, fragmentosHorizontais, fid, fileListFolder(file).name)
    end

    fclose(fid)
end
