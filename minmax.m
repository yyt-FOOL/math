%选址问题
lb=[3;4];ub=[8;10];
x0=[6;6];
[x,fval]=fminimax(@fun,x0,[],[],[],[],lb,ub);
disp('最远距离的最小值为：')
disp(fval)
disp('对应的选址坐标为：')
disp(x)