%绘制图形
s=[9 9 1 1 2 2 3 4 3 3 6 6 7 5];
t=[1 2 3 2 4 5 4 5 7 6 7 8 8 7];
w=[4 8 8 3 1 6 2 6 4 7 14 9 10 2];
G=graph(s,t,w);
figure(1)
plot(G,'EdgeLabel',G.Edges.Weight,'LineWidth',2);
set(gca,'XTick',[],'YTick',[])
%% 利用matlab中自带的函数计算最短路径
[P,d]=shortestpath(G,9,8);
%将路径高亮出来
myplot=plot(G,'EdgeLabel',G.Edges.Weight,'LineWidth',2);
highlight(myplot,P,'Edgecolor','red');
%% 计算两点之间的最短距离矩阵
D=distances(G)
D(9,8)%计算节点9到节点8的最短距离
D(4,8)%计算节点4到节点8的最短距离
%% 寻找特定距离范围内的所有节点
[nodes,distance]=nearest(G,2,10)%寻找距离节点2不超过10的所有节点
