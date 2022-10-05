function [] = converteSVM(input_file)

dados = load(input_file);
[l, c] = size(dados);
%sort
%dados = sortrows(dados,c);

nome = strcat(input_file,'.svm');
fid = fopen(nome,'w');
labels = dados(:, end);

for i = 1 : l
    fprintf(fid, '%d ', labels(i,1));
    for j = 1 : c -1
        fprintf(fid, ' %i:%f', j, dados(i,j));
    end
    fprintf(fid,'\n');
end

fclose(fid) ;