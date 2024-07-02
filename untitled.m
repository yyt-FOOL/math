%二次多项式回归
%step one：输入数据
t=1/30:1/30:14/30;
s=[11.86 15.67 20.6 26.69 33.71 41.93 51.13 61.49 72.9 85.44 99.08 113.77 ...
    129.54 146.48];
[p,S]=polyfit(t,s,2);%进行多项式拟合
%预测及作图
Y=polyconf(p,t,S);
figure(1)
plot(t,s,'k+',t,Y,'r')
xlabel('t')
ylabel('s')
title('二次多项式回归')
legend('原始数据','拟合曲线')
%% 化为多元线性回归
T=[ones(14,1) t' t'.^2];
[b,bint,r,rint,stats]=regress(s',T);
%% 直接用多元二项式回归
clc;
x1=[1000 600 1200 500 300 400 1300 1100 1300 300];
x2=[5 7 6 6 8 7 5 4 3 9];
y=[100 75 80 70 50 65 90 100 110 60]';
x=[x1' x2'];
rstool(x,y,'purequadratic')%使用多元二项式回归工具箱进行回归分析
disp("拟合出的纯二项式曲线方程为：")
disp(['y=' num2str(beta(1)) '+' num2str(beta(2)) '*x_1+' num2str(3) '*x_2' ...
    '+' num2str(beta(4)) '*x_1^2' '+' num2str(5) '*x_2^2'])
disp('剩余标准差为：')
disp(rmse)
%% 化为多元线性回归
X=[ones(10,1) x1' x2' (x1.^2)' (x2.^2)'];
[b,bint,r,rint,stats]=regress(y,X);
disp('回归参数值为：')
disp(b)
disp('各种统计量为：')
disp(stats)
%% 例三
%输入数据
x=2:16;
y=[6.42 8.20 9.58 9.5 9.7 10 9.93 9.99 10.49 10.59 10.60 10.80 10.60 10.90 ...
    10.76];
beta0=[8 2]';%设定初始值，根据经验选择
%求回归系数
[beta,r,J]=nlinfit(x',y','volum',beta0);
%使用非线性最小二乘法进行回归拟合，'Volum'为定义曲线函数的函数名
disp('回归系数为：')
disp(beta)
%预测及作图
[YY,delta]=nlpredci('volum',x',beta,r,J);
figure(2)
plot(x,y,'k+',x,YY,'r')

