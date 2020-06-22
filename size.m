D = 'D:\18bce1047\images';
S = dir(fullfile(D,'*.jpg')); 
q=imread('D:\18bce1047\images\2.jpg')
g=rgb2gray(q);
[m,n]=size(g);
%table for storing info of the image
info_table=cell2table(cell(0,4),'VariableNames',{'name','rows','columns','ed'})
for k = 1:numel(S)
    clear file1; clear im1;
    file1 = fullfile(D,S(k).name);
    im1 = imread(file1);
    [m1,n1]=size(im1);
    ed=sqrt((m-m1)^2+(n-n1)^2)
    new_row={S(k).name,m1,n1,ed}
    info_table=[info_table;new_row];
end
% to sort the rows
info_table=sortrows(fillmissing(info_table,'previous'),'ed');
writetable(info_table,'size-DB.csv');
% displaying first 5 nearest image
subplot(3,3,2)
imshow(q);
title('query image');
file_names=info_table(:,'name').name;
% extracting filename of the images
for i=1:6
    F=fullfile(D,char(file_names(i)))
    I=imread(F);
    subplot(3,3,i+3);
    imshow(I)
end
