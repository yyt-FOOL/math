function [position_x]=Inter2Max(x,a,b)
    s=size(x,1);
    position_x=zeros(s,1);
    M=max([a-min(x),max(x)-b]);
    for i=1:s
        if x(i)<a
            position_x(i)=1-(a-x(i))/M;
        elseif x(i)>b
            position_x(i)=1-(x(i)-b)/M;
        else
            position_x(i)=1;
        end
    end
end

