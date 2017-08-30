function was=calcwas(table,current,position)

was=0;
tempcurrent=current;
i=1;
%pair(1)<0;pair(2)>0
while i==1
    if check(tempcurrent,position)==1||check(tempcurrent,position)==2
        %bbbb=check(tempcurrent)
        break;
    end
    pair=findpair(tempcurrent,position);
    if abs(tempcurrent(pair(1)))>tempcurrent(pair(2))
        was=was+(tempcurrent(pair(2)))^2*table(pair(1),pair(2));
        
        tempcurrent(pair(1))=tempcurrent(pair(1))+tempcurrent(pair(2));
        tempcurrent(pair(2))=0;
    else
        was=was+(tempcurrent(pair(1)))^2*table(pair(1),pair(2));

        tempcurrent(pair(2))=tempcurrent(pair(1))+tempcurrent(pair(2));
        tempcurrent(pair(1))=0;
    end
end
for i=1:position
    was=was+((tempcurrent(i)))^2*table(1,i);
end