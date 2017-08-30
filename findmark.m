function mark=findmark(testsystem,Electricity,temp,table,position)

for i=1:position
    if testsystem(2,i)==0||((testsystem(2,i)==3)&&(testsystem(4,i)<=45))
        tempsystem=testsystem;
        tempsystem(2,i)=1;
        tempsystem(3,i)=-1;
        tempsystem(4,i)=Electricity;
        for j=1:position
            ttt(j)=tempsystem(3,j);
        end
        if temp>calcwas(table,ttt,position)
            temp=calcwas(table,ttt,position);
            mark=i;
            if mark==0
                mark=0;
            end
        end
    end
end