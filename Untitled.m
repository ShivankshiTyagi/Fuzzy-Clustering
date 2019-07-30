clc;
fid=fopen('images.txt','rt');
C=textscan(fid,'%s%*s%s%*[^\n]', 'Delimiter', ' ');
fclose(fid);
check={'CIRC','SPIC','MISC'};
idx=~cellfun(@isempty,regexp(C{2},strjoin(check,'|')));
A=C{1}(idx);
for i=1:size(A,1)
    str=strcat(A(i,1),'.pgm');
    str=strcat('C:\Users\Shivankshi Tyagi\Desktop\Image processing\FRFCM\Images\',str);
    f_ori=imread(cell2mat(str));
    figure,imshow(t);
end