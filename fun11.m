function ff=fun11(x)
a=[1.25 8.75 0.5 5.75 3 7.25];
b=[1.25 0.75 4.75 5 6.5 7.25];
f1=0;f2=0;
for i=1:6
    f1=f1+x(i)*sqrt((x(13)-a(i))^2+(x(14)-b(i))^2);
end
for i=7:12
    f2=f2+x(i)*sqrt((x(15)-a(i-6))^2+(x(16)-b(i-6))^2);
end
ff=f1+f2;
end
