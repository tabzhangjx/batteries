function thepair=findpair(tempcurrent,position)

dis=51;
marki=0;
markj=0;

record=0;
circlr=0;

for i=1:position
    for j=1:position
        if tempcurrent(i)<0&&tempcurrent(j)>0
            if dis>distance(i,j,position)
                dis=distance(i,j,position);
                marki=i;
                markj=j;
            end
        end
    end
end

thepair(1)=marki;
thepair(2)=markj;