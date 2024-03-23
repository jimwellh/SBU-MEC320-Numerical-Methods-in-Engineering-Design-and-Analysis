% A=[1 1 0 0 0 1 0 0 0 0 0;
%     1 1.08 0 0 0 0 1 0 0 0 0; 
%     0 0 0 0 1 0 0 1 0 0 0;
%     0 0 4 1 1 0 0 0 1 0 0;
%     -4 -4.5 10 1 3 0 0 0 0 0 0;
%     1 1 -1 -1 -1 0 0 0 0 0 0];
% b=[19584;20150;31680;48000;0;0];
% C=[0.23;0.24;0.48*2;0.60/2;0.68/2;0;0;0;0;0;0];

A=[1 1 0 0 0 
    1 1.08 0 0 0  
    0 0 0 0 1
    0 0 4 1 1
    -4 -4.5 10 1 3 
    -1 0 0 0 0
    0 -1 0 0 0
    0 0 -1 0 0
    0 0 0 -1 0
    0 0 0 0 -1];
Aeq=[1 1 -1 -1 -1];
beq=0;
b=[19584 20150 31680 48000 0 0 0 0 0 0];
C=[0.23 0.24 -0.96 -0.30 -0.34];
[optimizedXs, optimizedFunVal]=linprog(C,A,b,Aeq,beq);
optimizedXs=abs(optimizedXs)
optimizedFunVal=abs(optimizedFunVal)

% A=[-1 2 
%     3 2 
%     1 -1
%     -1 0
%     0 -1];
% b=[4 14 3 0 0];
% C=[-3 -2];
% [X,val]=linprog(C,A,b)