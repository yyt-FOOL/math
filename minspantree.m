%最小生成树例题
%利用邻接矩阵画图
a=zeros(6);
a(1,[2,3])=[14 18];
a(2,3:5)=[13 18 16];
a(3,[4 5])=[12 16];
a(4,[5 6])=[14 19];
a(5,6)=10;
figure(1)
city=cellstr(strcat('城市',int2str([1:6]')));
G=graph(a,city,'upper');
figure(1)
p=plot(G,'EdgeLabel',G.Edges.Weight,'LineWidth',2);
%% 利用matlab自带的最小生成树模型计算
T=minspantree(G);%默认为Prim算法
T=minspantree(G,"Method","dense");%采用Kruskal算法
disp('最小生成树的权重和为：')
L=sum(T.Edges.Weight)
highlight(p,T,'EdgeColor','red','LineWidth',2.5)
