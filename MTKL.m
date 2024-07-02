%通过蒙特卡罗方法计算圆周率
p=input("请输入随机点数：");
x0=1;y0=1;n=0;
hold on
for i=1:p
    px=rand*2;
    py=rand*2;
    if (px-x0)^2+(py-y0)^2<1
        plot(px,py,".b")
        n=n+1;
    else
        plot(px,py,'.r')
    end
end
axis equal
disp('模拟的圆周率为')
pi0=4*n/p