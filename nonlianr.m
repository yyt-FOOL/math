%非线性规划模型[x,fval]=fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,option)
%fun目标函数
%x0初始值
%A线性不等式约束矩阵
%b线性不等式常系数矩阵
%Aeq线性等式约束矩阵
%beq线性等式常系数矩阵
%lb变量约束的下界矩阵
%ub变量约束的上界矩阵
%nonlcon非线性的约束条件
%option非线性规划的算法
clear;clc
format long g%默认保留四位小数或用科学计数法表示

%% 默认算法为内点法（interior-point）
x0=[0,0];%给定初始值
A=[-2,3];b=6;
[x,fval]=fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1);%调用非线性规划模型
disp('本问题的最小值为：')
disp(fval)
disp('对应的取值为：')
disp(x)
%% 运用其他算法如序列二次规划法(SQP)进行求极值
option=optimoptions('fmincon','Algorithm','sqp');
x0=[0,0];%给定初始值
A=[-2,3];b=6;
[x,fval]=fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1,option);%调用非线性规划模型
disp('本问题的最小值为：')
disp(fval)
disp('对应的取值为：')
disp(x)
%% 运用蒙特卡罗方法寻找初始值
n=10000000;
x1=unifrnd(-100,100,n,1);
x2=unifrnd(-100,100,n,1);
fmin=+inf;
for i=1:n
    x=[x1(i),x2(i)];
    if ((x(1)-1)^2-x(2)<=0) && (-2*x(1)+3*x(2)-6<=0)
        result=x(1)^2+x(2)^2-x(1)*x(2)-2*x(1)-5*x(2);
        if result<fmin
            fmin=result;
            x0=x;
        end
    end
end
disp('蒙特卡罗方法找出的初始值为');disp(x0)
A=[-2,3];b=6;
[x,fval]=fmincon(@fun1,x0,A,b,[],[],[],[],@nonlfun1);%调用非线性规划模型
disp('本问题的最小值为：')
disp(fval)
disp('对应的取值为：')
disp(x)
