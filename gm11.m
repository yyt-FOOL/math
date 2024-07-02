function [result,x0_hat,relative_residuals,eta]=gm11(x0,predict_num)
    %x0:要预测的原始数据
    %perdict_num:向后预测的期数
    %result：预测值
    %x0_hat：对原始数据的拟合值
    %relative_residuals：对模型进行评价时计算得到的相对残差
    %eta：对模型进行评价时计算得到的级比偏差

    n=length(x0);
    x1=cumsum(x0);
    z1=(x1(1:end-1)+x1(2:end))/2;%计算紧邻值生成数列（长度为n-1）
    %将从第二项开始的x0当成y,z1当成x,来进行一元回归 y=kx+b
    y=x0(2:end);x=z1;
    k=((n-1)*sum(x.*y)-sum(x)*sum(y))/((n-1)*sum(x.*x)-sum(x)*sum(x));
    b=(sum(x.*x)*sum(y)-sum(x)*sum(x.*y))/((n-1)*sum(x.*x)-sum(x)*sum(x));
    a=-k;%-a就是发展系数，b就是灰作用量
    disp('现在进行GM(1,1)预测的原始数据是:')
    disp(mat2str(x0'))
    disp(strcat('最小二乘法拟合得到的发展系数为',num2str(-a),'灰作用量是',num2str(b)))
    disp('****************分割线****************')
    x0_hat=zeros(n,1);%初始化预测值
    x0_hat(1)=x0(1);
    for m=1:n-1
        x0_hat(m+1)=(1-exp(a))*(x0(1)-b/a)*exp(-a*m);
    end
    result=zeros(predict_num,1)%初始化测试集的值
    for i=1:predict_num
        result(i)=(1-exp(a))*(x0(1)-b/a)*exp(-a*(n+i-1));
    end

    %计算绝对残差和相对残差
    absolute_residuals=x0(2:end)-x0_hat(2:end);%从第二项开始计算绝对残差，因为第一项是相同的
    relative_residuals=abs(absolute_residuals)./x0(2:end);
    %计算极差和级比偏差
    class_ratio=x0(2:end)./x0(1:end-1);%计算级比sigma(k)=x0(k)/x0(k-1)
    eta=abs(1-(1-0.5*a)/(1+0.5*a)*(1./class_ratio));%计算级比偏差
end


     
     

