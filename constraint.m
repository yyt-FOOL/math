function [g,k]=constraint(x)
    g=[sum(x(:,1:6),2)-20
        sum(x(:,7:12),2)-20];
    k=[x(1)+x(7)-3
        x(2)+x(8)-5
        x(3)+x(9)-4
        x(4)+x(10)-7
        x(5)+x(11)-6
        x(6)+x(12)-11];
end