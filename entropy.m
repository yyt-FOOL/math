A=input('请输入指标矩阵：');
[m,n]=size(A);
%对输入的矩阵进行标准化
S=A./repmat(sum(A.*A,1).^0.5,m,1);
disp('标准归一化的矩阵为：')
disp(S)
%% 计算权重
D=zeros(1,n);
P=S./repmat(sum(S,1),m,1);
disp('归一化的矩阵为：')
disp(P)
for i=1:n
    e=-sum(P(:,i).*mylog(P(:,i)))/log(m);
    D(i)=1-e;
end
disp('熵权为：')
W=D./sum(D)