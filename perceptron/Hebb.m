close all
clear, clc
P = [  1  1 -1; 
      -1  1 -1;
       1 -1 -1;
       1  1  1 ]
T = [ -1 -1  1;
      -1  1 -1 ]
[m, n] = size(P);
if m == n
    Pa = inv(P);
else
    Pa = (P'*P)\P';
end
W = T*Pa
D = [ 1; -1; 1; -1]
Y = hardlims(W*D)
