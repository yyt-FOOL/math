%对输入的指标矩阵进行正向化
clc;clear
A=input('请输入指标矩阵：');
[m,n]=size(A);
disp(['一共有',num2str(m),'个评价对象和',num2str(n),'个评价指标。']);
judge=input(['这' num2str(n) '个指标是否需要正向指标化，需要请输入1，不需要请输入0：']);
if judge==1
    position=input("请输入需要正向化的指标所在的列，如第2、3、6列需要正向指标化，请输入[2,3,6]：");
    disp("请输入需要处理的这些列的指标类型（1：极小型；2：中间型；3：区间型）：");
    type=input("例如第2列是极小型，第3列是区间型，第6列是中间型，就输入[1,3,2]：");
    for i=1:size(position,2)
        A(:,position(i))=positivization(A(:,position(i)),type(i),position(i));
    end
    disp("正向化的矩阵为A=")
    disp(A)
end
%% 对矩阵进行标准化
Mean=mean(A);
Z=A./repmat(Mean,size(A,1),1);
%% 构造子序列和母序列
YS=max(Z,[],2);
XS=Z;
%% 计算极小值a和极大值b
C=abs(XS-repmat(YS,1,size(Z,2)));
a=min(min(C));
b=max(max(C));
%% 计算灰色关联度以获得权重
r=0.5;
kesi=(a+r*b)./(C+r*b);
disp('各指标的权重为：')
weight=sum(kesi)./sum(sum(kesi))
%% 计算每个候选人的得分
score=Z.*repmat(weight,size(Z,1),1);
final_score=sum(score,2)/sum(sum(score,2));
disp('最终得分为：')
[sort_score,index]=sort(final_score,'descend')









