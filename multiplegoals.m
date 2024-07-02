%多目标规划模型
W1=0.4;W2=0.6;%设定每个目标函数的权重
C=[2*W1/30+0.4*W2/2
    5*W2/30+0.3*W2/2];%系数矩阵
A=[-1 -1];b=-7;
lb=[0;0];
ub=[5;6];
[x,fval]=linprog(C,A,b,[],[],lb,ub);
f1=2*x(1)+5*x(2);
f2=0.4*x(1)+0.3*x(2);
disp('A产品应该生产的吨数为：')
disp(x(1))
disp('B产品应该生产的吨数为：')
disp(x(2))
disp('总的生产费用为：')
disp(f1)
disp('总的污染吨数为：')
disp(f2)
%% 敏感性分析
W1=0.1:0.01:0.5;W2=1-W1;
n=length(W1);
X1=zeros(n,1);X2=zeros(n,1);F1=zeros(n,1);F2=zeros(n,1);FVAL=zeros(n,1);
for i=1:n
    C=[2*W1(i)/30+0.4*W2(i)/2
    5*W1(i)/30+0.3*W2(i)/2];
    A=[-1 -1];b=-7;
    lb=[0;0];
    ub=[5;6];
    [x,fval]=linprog(C,A,b,[],[],lb,ub);
    X1(i)=x(1);X2(i)=x(2);
    F1(i)=2*x(1)+5*x(2);
    F2(i)=0.4*x(1)+0.3*x(2);
    FVAL(i)=fval;
end
figure(1)
plot(W1,F1,W1,F2)
xlabel('f_{1}的权重')
ylabel('f_{1}和f_{2}的取值')
legend('f_{1}','f_{2}')

figure(2)
plot(W1,X1,W1,X2)
xlabel('f_{1}的权重')
ylabel('x_{1}和x_{2}的取值')
legend('x_{1}','x_{2}')

figure(3)
plot(W1,FVAL)
xlabel('f_{1}的权重')
ylabel('综合指标值')
legend('Fval')
