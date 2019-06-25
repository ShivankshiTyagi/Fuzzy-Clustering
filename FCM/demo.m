clear,clc,close all;
image=imread('C:\Users\Shivankshi Tyagi\Desktop\Image processing\Image Processing using type 2 fuzzy theory\Code\t1.jpg');
data=double(rgb2gray(image));
cluster_n = 3;
[ v,Unow ] = fcm( data, cluster_n );
figure;

for i=1:cluster_n
    subplot(2,2,1);
    imshow(data,[]);
    subplot(2,2,i+1);
    
    imshow(Unow(:,:,i),[]);
end