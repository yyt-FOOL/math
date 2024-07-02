%选址问题(线性模型)
clear;clc
a=[1.25 8.75 0.5 5.75 3 7.25];
b=[1.25 0.75 4.75 5 6.5 7.25];
d=[3 5 4 7 6 11];
x=[5 2];
y=[1 7];
for i=1:6
    for j=1:2
        l(i,j)=sqrt((a(i)-x(j))^2+(b(i)-y(j))^2);
    end
end
f=[l(:,1);l(:,2)];%目标函数的系数向量
A=[1 1 1 1 1 1 0 0 0 0 0 0;
    0 0 0 0 0 0 1 1 1 1 1 1];
%不等式约束矩阵
b=[20;20];%不等式约束的常系数矩阵
Aeq=[eye(6),eye(6)];%等式约束矩阵
beq=[];
for i=1:6
    beq=[beq;d(i)];
end
%获得等式约束的常系数矩阵
lb=[0 0 0 0 0 0 0 0 0 0 0 0];
[x,fval]=linprog(f,A,b,Aeq,beq,lb);
disp("线性规划得到的最优值为")
disp(fval)
disp('对应的变量取值为：')
disp(x)
%% 选址问题（非线性模型）
clear;clc
x0=[3 5 0 7 0 1 0 0 4 0 6 10 5 1 2 7];
A=[1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 0];
b=[20;20];
Aeq=[eye(6),eye(6),zeros(6,4)];
beq=[3 5 4 7 6 11]';
lb=[zeros(12,1);-inf;-inf;-inf;-inf];
[x,fval]=fmincon(@fun11,x0,A,b,Aeq,beq,lb);
disp(x)
disp(fval)
%% 利用蒙特卡罗模型寻找接近最值的初始值
fmin=+inf;n=100000000;
for i=1:n
    x_r=[randi(4)-1 randi(6)-1 randi(5)-1 randi(8)-1 randi(7)-1 randi(12)-1 ...
        randi(4)-1 randi(6)-1 randi(5)-1 randi(8)-1 randi(7)-1 randi(12)-1 ...
        9*rand(1,4)];
    [g,k]=constraint(x_r);
    if all(g<0)
        if all(abs(k)<1)
            ff=fun11(x_r);
            if ff<fmin
                fmin=ff;x_0=x_r;
            end
        end
    end
end
A=[1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 1 1 1 1 1 1 0 0 0 0];
b=[20;20];
Aeq=[eye(6),eye(6),zeros(6,4)];
beq=[3 5 4 7 6 11]';
lb=[zeros(12,1);-inf;-inf;-inf;-inf];
[x,fval]=fmincon(@fun11,x_0,A,b,Aeq,beq,lb);
disp('本问题的最小值为：')
disp(fval)
disp('对应的变量取值为：')
disp(x)


