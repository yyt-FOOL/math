function [position_x]=positivization(x,type,i)
    if type==1
        disp(['第' num2str(i) '列的指标化类型为极小型，正在正向化']);
        position_x=Min2Max(x);
        disp(['第' num2str(i) '列极小型正向化处理完成']);
        disp('--------------------------分界线------------------------------');
    elseif type==2
        best=input('请输入最佳值：')
        disp(['第' num2str(i) '列的指标化类型为中间型，正在正向化']);
        position_x=Mid2Max(x,best);
        disp(['第' num2str(i) '列中间型正向化处理完成']);
        disp('--------------------------分界线------------------------------');
    elseif type==3
        a=input('请输入区间的下界：');
        b=input('请输入区间的上界：');
        disp(['第' num2str(i) '列的指标化类型为区间型，正在正向化']);
        position_x=Inter2Max(x,a,b);
        disp(['第' num2str(i) '列区间型正在正向化处理']);
    else
        disp('没有这种类型的指标，请检查Type向量中是否有除了1、2、3之外的其他值');
    end
end