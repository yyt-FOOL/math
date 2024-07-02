%一元线性回归代码
%输入样本数据
x=[143 145 146 147 149 150 153 154 155 156 157 158 159 160 162 164]';
Y=[88 85 88 91 92 93 93 95 96 98 97 96 98 99 100 102]';
X=[ones(16,1) x];
%调用线性回归模型
[b,bint,r,rint,states]=regress(Y,X);
disp(['参数值分别为：斜率:' num2str(b(2)) ';截距：' num2str(b(1))])
disp(['斜率的置信区间为：' num2str(bint(1,:))])
disp(['截距的置信区间为：' num2str(bint(2,:))])
disp('残差分别为：' )
r
disp('残差的置信区间为：' )
rint
disp(['R^2:' num2str(states(1))])
%绘制残差图
figure(1)
rcoplot(r,rint)
%绘制回归曲线图
y=b(1)+b(2)*x;
figure(2)
plot(x,Y,'k*',x,y,'r')