%用Matlab作无向图
%无权重作图（每条边的权重默认为1）
s1=[1,2,3,4];
t1=[2,3,1,1];
G1=graph(s1,t1);
figure(1)
plot(G1);
set(gca,'XTick',[],'YTick',[]);
%% 用字符串元胞数组表示连线
s2={'学校','电影院','酒店','酒店'};
t2={'电影院','酒店','网吧','KTV'};
figure(2)
G2=graph(s2,t2);
plot(G2,'LineWidth',2);
set(gca,'XTick',[],'YTick',[]);
%% 有权重作图
s1=[1,2,3,4];
t1=[2,3,1,1];
w1=[3,8,9,2];
G3=graph(s1,t1,w1);
figure(3)
plot(G3,'EdgeLabel',G3.Edges.Weight,'LineWidth',2)
set(gca,'XTick',[],'YTick',[]);
%% 用邻接矩阵绘有权重的图
a=[0 3 9 2
    3 0 8 0
    9 8 0 0
    2 0 0 0];
G4=graph(a);
figure(4)
plot(G4,'EdgeLabel',G4.Edges.Weight,'LineWidth',2)
set(gca,'XTick',[],'YTick',[]);
%% 邻接矩阵也可以用上三角矩阵表示
a=[0 3 9 2
    0 0 8 0
    0 0 0 0
    0 0 0 0];
G5=graph(a,'upper');
figure(5)
plot(G5,'EdgeLabel',G5.Edges.Weight,'LineWidth',2)
set(gca,'XTick',[],'YTick',[])
%% 用matplot作有向图
%无权重
s=[1 2 3 4 1];
t=[2 3 1 1 4];
G6=digraph(s,t);
figure(6)
plot(G6,'LineWidth',2)
set(gca,'XTick',[],'YTick',[])
%% 有权重
s1=[1,2,3,4];
t1=[2,3,1,1];
w1=[3,8,9,2];
G7=digraph(s1,t1,w1);
figure(7)
plot(G7,'EdgeLabel',G7.Edges.Weight,'LineWidth',2)
set(gca,'XTick',[],'YTick',[]);
%% 使用邻接矩阵绘有权重的图
a=[0 3 0 0
    0 0 8 0
    9 0 0 0
    2 0 0 0];
s=cellstr(strcat('顶点',int2str([1:4]')));
G8=digraph(a,s);
figure(8)
plot(G8,'EdgeLabel',G8.Edges.Weight,'LineWidth',2)
set(gca,'XTick',[],'YTick',[]);








