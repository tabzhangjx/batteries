function a=calcwas2(table,current)
a=0;
flow=current;
whole=0;
for i=1:50
    whole=whole+flow(1,i);
end
if whole>0
    for i=1:50
        if flow(i)<0
            j=serach(i,flow);
        else
            continue
        end
        if abs(flow(i))>flow(j)
            a=a+(flow(j))^2*table(i,j);
            flow(j)=0;
            flow(i)=flow(i)+flow(j);
        else
            a=a+(flow(i))^2*table(i,j);
            flow(i)=0;
            flow(j)=flow(j)+flow(i);
        end
        if flow(i)<0
            i=i-1;
        end
    end
else
    for i=1:50
        if flow(i)>0
            j=serach(i,flow);
        else
            continue
        end
        if abs(flow(i))>flow(j)
            a=a+(flow(j))^2*table(i,j);
            flow(j)=0;
            flow(i)=flow(i)+flow(j);
        else
            a=a+(flow(i))^2*table(i,j);
            flow(i)=0;
            flow(j)=flow(j)+flow(i);
        end
        if flow(i)>0
            i=i-1;
        end
    end
end
for i=1:50
    a=a+abs(flow(1,i))^2*table(1,i);
end