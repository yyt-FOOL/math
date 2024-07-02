%游泳接力问题
f=[66.8 75.6 87 58.6 57.2 66 66.4 53 78 67.8 84.6 59.4 70 74.2 69.6 57.2 ...
  67.4 71 83.8 62.4];%系数矩阵
intcon=1:20;
A=[ones(1,4) zeros(1,16)
    zeros(1,4) ones(1,4) zeros(1,12)
    zeros(1,8) ones(1,4) zeros(1,8)
    zeros(1,12) ones(1,4) zeros(1,4)
    zeros(1,16) ones(1,4)];
b=ones(5,1);
Aeq=repmat(eye(4),1,5);
beq=ones(4,1);
lb=zeros(20,1);
up=ones(20,1);%规定变量只能取0或1
[x,fval]=intlinprog(f,intcon,A,b,Aeq,beq,lb,ub);
disp('接力游泳用时最少为：')
disp(fval)
disp('对应的游泳选手和采用的泳姿分别为：')
disp(reshape(x,4,5)')