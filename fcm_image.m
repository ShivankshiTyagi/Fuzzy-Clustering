% This function is only suitabe for gray image
function gx=fcm_image(f,U,center)
[m,n]=size(f);
[~,idx_f]=max(U);
imput_f=reshape(idx_f,[m n]); 
imput_ff=zeros(m,n); %input_ff denotes the classification result based on the cluster center
ff=zeros(m,n);
ff1=0;
for k=1:length(center(:,1))
    t=(imput_f==k).*center(k);
    m1 =max(max(t));
    if m1>ff1
        ff=t;
        ff1=m1;
    end
    %figure,imshow(uint8(t));
    imput_ff=imput_ff+t; 
end
ff=uint8(ff);
imwrite(ff,'image1.jpg');
gx=uint8(imput_ff);

