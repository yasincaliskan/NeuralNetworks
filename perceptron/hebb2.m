close all
clear, clc

s = 'Hebb Model';
x = [ 1  1   2  2 -1 -2  -1 -2;
      1  2  -1  0  2  1  -1 -2 ];
y = [ 0  0   0  0  1  1   1  1
      0  0   1  1  0  0   1  1];

% w = [0 0; 0 0];
w = randn(2,2);

fprintf('%s\n',s)
disp('w = ')
disp(w)

n = 0;
N = size(y,2);
IteN = 1000;
for Ite = 1 : IteN
    n = 1 + mod(n,N);
    fprintf('Ite = %g ( %g.Veri )\n',Ite,n)
    net = w*x(:,n);
    f = double( net >= 0 );
    fprintf('Net = %g, f = %g, y = %g\n',net,f,y(n))

    dw = y(:,n)*x(:,n)';
    w = w + dw;

    disp('dw = ')
    disp(dw)
    disp('w = ')
    disp(w)
end
x1 = [-3 3];
x2 = - w(1,1)*x1 / w(1,2);
x3 = - w(2,1)*x1 / w(2,2);


hold on
plot([-3 3],[0 0],'b:')
plot([0 0],[-3 3],'b:')
gec = y(1,:)==0 & y(2,:)==0;
plot(x(1,gec),x(2,gec),'r*')
gec = y(1,:)==0 & y(2,:)==1;
plot(x(1,gec),x(2,gec),'g*')
gec = y(1,:)==1 & y(2,:)==0;
plot(x(1,gec),x(2,gec),'b*')
gec = y(1,:)==1 & y(2,:)==1;
plot(x(1,gec),x(2,gec),'k*')
plot(x1,x2,'k')
plot(x1,x3,'k')
axis([-3 3 -3 3])

