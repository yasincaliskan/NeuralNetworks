clc;
clear;
clear all;

...3x3 matris oluþturma
m1 = [1,2,3;4,5,6;7,8,9];
...for döngüsü ile oluþturma
a=1;
for i=1:3
    for j=1:3
        m2(i,j) = a;
        a=a+1;
    end
end
m1
m2
... print komutu ve uzunluk        
disp('m1 uzunluk:')
length(m1)
disp('m2 boyut:')
length(m2)

...grafik çizdirme fonksiyonu
x=1:10;
y=x;
plot(x,y) ...stem(x,y)
xlabel('maaslar')
ylabel('satislar')
title('grafik')