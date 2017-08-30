function j=search(i,flow)
t=100;
m=0;
for j=1:50
    if flow(j)*flow(i)<0
        if t>abs(i-j)
            t=abs(i-j);
            m=j;
        end
    end
end
j=m;