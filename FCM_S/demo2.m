clear,clc,close all;
image=imread('C:\Users\Shivankshi Tyagi\Desktop\Image processing\Image Processing using type 2 fuzzy theory\New folder\fcm\Fuzzy-Clustering\Images\t1.jpg');
data=double(rgb2gray(image));
cluster_n = 3;
[ center,U ] = fcms( data, cluster_n );
figure;
imshow(data,[]);
figure;

for i=1:cluster_n
    subplot(2,2,i);
    
    imshow(U(:,:,i),[]);
end
