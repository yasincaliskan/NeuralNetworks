close all
clear, clc

s = 'Perceptron Model ( Basit Algýlayýcý Model )';
p = [ 2   2   2   1   6  -3  -1   2  -2  -4;
      1  -2  -3  -4  -6   3  -4   4  -4  -6 ]
t = [ 1   1   1   1   1   0   0   0   0   0 ]

lamda = 0.1;
w = [0 0]; %rand(1,2);
b = 0; % rand;
fprintf('%s\nLamda = %g\n',s,lamda)
fprintf('w1 = %g, w2 = %g, b = %g\n\n',w(1),w(2),b)

n = 0;
N = size(t,2);
IteN = 10000;
for Ite = 1 : IteN
    n = 1 + mod(n,N);
%     fprintf('Ite = %g ( %g.Veri )\n',Ite,n)
    net = w*p(:,n) + b;
%     f = double( net >= 0 );
a=hardlim(net);
%     fprintf('Net = %g, f = %g, y = %g\n',net,a,t(n))
%     if a == t(n)
%         fprintf('Agirliklar Deðiþmez\n')
%     else
        de = lamda*(t(n)-a);
        dw = de*p(:,n)';
        w = w + dw;
        b = b + de;
%         fprintf('dw1 = %g, dw2 = %g, db = %g\n',dw(1),dw(2),de)
%     end
%     fprintf('w1 = %g, w2 = %g, b = %g\n\n',w(1),w(2),b)
end
x1 = [-7 7];
x2 = - ( b + w(1)*x1 ) / w(2);


hold on
plot([-7 7],[0 0],'b:')
plot([0 0],[-7 7],'b:')


plot(p(1,t==0),p(2,t==0),'ro')
plot(p(1,t==1),p(2,t==1),'g*')
axis([-7 7 -7 7])
plot(x1,x2)




