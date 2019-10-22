close all
clear, clc

s = 'Perceptron Model ( Basit Algýlayýcý Model )';
p = [ 1  1   2   2   -1  -2  -1   -2;
      1  2  -1   0    2   1  -1   -2]
t = [ 0  0   0   0    1   1   1    1;
      0  0   1   1    0   0   1    1]

lamda = 0.01;
w = randn(2,2);
b = rand(2,1);

disp(w)
disp(b)

n = 0;
N = size(t,2);
IteN = 10000;
for Ite = 1 : IteN
    n = 1 + mod(n,N);
%     fprintf('Ite = %g ( %g.Veri )\n',Ite,n)
    net = w*p(:,n) + b;
%     f = double( net >= 0 );
a=double ( net >= 0 ); 
%     fprintf('Net = %g, f = %g, y = %g\n',net,a,t(n))
%     if a == t(n)
%         fprintf('Agirliklar Deðiþmez\n')
%     else
        de = lamda*(t(:,n)-a);
        dw = de*p(:,n)';
        w = w + dw;
        b = b + de;
        
        disp('dw = ')
        disp(dw)
        disp('db = ')
        disp(de)
        disp('w = ')
        disp(w)
        
%         fprintf('dw1 = %g, dw2 = %g, db = %g\n',dw(1),dw(2),de)
%     end
%     fprintf('w1 = %g, w2 = %g, b = %g\n\n',w(1),w(2),b)
end
x1 = [-3 3];
x2 = - ( b(1) + w(1,1)*x1 ) / w(1,2);
x3 = - ( b(2) + w(2,1)*x1 ) / w(2,2)


%%%Çizdi.r 
hold on 
plot ([-3 3],[0 0], 'b:')
plot ([0 0],[-3 3], 'b:')
gec=t(1,:)==0 & t(2,:)==0;
plot (p(1,gec),p(2,gec),'r*')
gec=t(1,:)==0 & t(2,:)==1;
plot (p(1,gec),p(2,gec),'g*')
gec=t(1,:)==1 & t(2,:)==0;
plot (p(1,gec),p(2,gec),'b*')
gec=t(1,:)==1 & t(2,:)==1;
plot (p(1,gec),p(2,gec),'k*')
plot(x1,x2,'k')
plot(x1,x3,'k')

axis([-3 3 -3 3])



