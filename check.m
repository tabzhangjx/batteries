function flag=check(current,position)

flag=2;

for i=1:position
    if flag==2
        if current(1,i)<0
            flag=-1;
        end
        if current(1,i)>0
            flag=1;
        end
        if current(1,i)==0
            continue
        end
    else
        if flag==1&&current(1,i)>=0
        elseif flag==-1&&current(1,i)<=0
        elseif current(1,i)==0
        else
            flag=0;
            break
        end
    end
end
flag=abs(flag);