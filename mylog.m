function [lnP]=mylog(v)
    n=length(v);
    lnP=zeros(n,1);
    for i=1:n
        if v(i)==0
            lnP(i)=0;
        else
            lnP(i)=log(v(i));
        end
    end
end



