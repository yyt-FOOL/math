A=input('请输入指标矩阵A：');
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
%% 对正向化后的矩阵进行标准化
Z=A./repmat(sum(A.*A).^0.5,m,1);
disp('标准化矩阵Z=')
disp(Z)
%% 计算最终的得分
%计算Z与最优解的距离
D_B=sum([(Z-repmat(max(Z),m,1)).^2],2).^0.5;
D_W=sum([(Z-repmat(min(Z),m,1)).^2],2).^0.5;
Score=D_W./(D_B+D_W);
Stand_score=100*Score/sum(Score);
disp('最终的得分为：')
[Final_score,index_]=sort(Stand_score,'descend')





