  I = imread('2_test.tiff');
    figure;
    imshow(I);
I=imnoise(I,'salt & pepper',0.01);
figure;
imshow(I);
mm=3; 
J=ones(mm,mm);
I=double(I);
II=I; 
[m n]=size(I);
m3=2*floor(mm/2)+m;
n3=2*floor(mm/2)+n;
X = zeros(m3,n3);
for i=1:m
    for j=1:n
    X(i+1,j+1)= I(i,j);
    end
end

for i=1:m
    for j=1:n
        K=J.*X(i:i+mm-1,j:j+mm-1);
    nn=1; 
        for ii=1:mm
           for jj=1:mm
               L(nn)=K(ii,jj);
               nn=nn+1;
           end
        end
        for ii=1:nn-2
           for jj=1:nn-ii-1
              if L(jj)>L(jj+1) 
                 TL=L(jj);
                 L(jj)=L(jj+1);
                 L(jj+1)=TL;
              end
           end
       end
II(i,j)=L(fix((nn-1)/2));
   end
end
figure;
imshow(mat2gray(II));
