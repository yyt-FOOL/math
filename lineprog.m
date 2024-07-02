clc,clear;
f=[-20;-30;-45];
A=[4,8,15;1 1 2];
b=[100;20];
b1=zeros(3,1);
[x,fval]=linprog(f,A,b,[],[],b1);
disp("A、B、C三图分别通关的次数为：")
disp(x)
disp("最终获得的最大经验为：")
disp(-fval)