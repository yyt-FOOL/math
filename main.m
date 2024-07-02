%导入原始数据
load data.mat
[m,n]=size(x);
%% 对导入的数据进行标准化
X=zscore(x);
%% 计算样本协方差矩阵
R=cov(X);
%% 计算R的特征值和特征向量
[V,D]=eig(R); %V:特征向量；D：特征值
%% 计算主成分贡献度和累计贡献度
lambda=diag(D);
lambda=lambda(end:-1:1);
contribution_rate=lambda/sum(lambda);%计算贡献率
cum_contribution_rate=cumsum(lambda)/sum(lambda);%计算累计贡献率
disp("特征值为：")
disp(lambda)
disp("贡献率为：")
disp(contribution_rate)
disp("累计贡献率为：")
disp(cum_contribution_rate)
disp("与特征值相对应的特征向量为：")
V=rot90(V)'



