function table=calcresi()

for i=1:50
    for j=1:50
        table(i,j)=1/(1/abs(i-j)+1/(50-abs(i-j)));
    end
end