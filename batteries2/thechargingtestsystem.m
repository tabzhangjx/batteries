%%
%imitate thr charging system
%fid = fopen('result.txt','wt');
%position
for position=38:50
%     keys=zeros(30,51);
%% produce batteries with time moving
    for akey=1:25
    %%
%define
        numberofbatteries=0;
        numofbatteries=0;
        t_change=5;
        table=calcresi();
        testsystem=zeros(4,position);
%number
        for i=1:position
            testsystem(1,i)=i;
        end
%conditon  0-none;1-first release;2-charging;3-second release;
%current
%electricity
        wastage=0;
        wholewaste=0;
        Electricity=0;
        flag=0;
%%
%     j=1;
%     for i=1:50
%         if j>50
%             j=j-50;
%         end
%         key(i)=j;
%         j=j+7;
%     end
     key=[1,4,7,10,13,16,19,22,25,28,31,34,37,2,5,8,11,14,17,20,23,26,29,32,35,38,3,6,9,12,15,18,21,24,27,30,33,36,39,1,4,7,10,13,16,19,22,25,28,31,34,37,2,5,8,11,14,17,20,23,26,29,32,35,38,];
%     key=[1,3,49,5,47,7,45,9,43,11,41,13,39,15,37,17,35,19,33,21,31,23,29,25,27];
%     extra=randperm(50);
%     addition=zeros(25);
%     j=1;
%     for i=1:50
%         if mod(extra(1,i),2)==0
%             addition(1,j)=extra(1,i);
%             j=j+1;
%         end
%     end
%     j=1;
%     for i=26:50
%         key(1,i)=addition(1,j);
%         j=j+1;
%     end
        for t=0:400
%% 重置变量
            spot=0;
            temp=Inf(1);
%% 产生新电池，测试在一个位置加入新电池后的损耗并标记最小值点
           if(mod(t,5)==0)
                Electricity=45+rand*10;
                numberofbatteries=numberofbatteries+1;
                numofbatteries=numofbatteries+1;
                if numberofbatteries<=36
                    mark=key(numberofbatteries);
                    if mark==0
                        mark=0;
                    end
                else
                    mark=findmark(testsystem,Electricity,temp,table,position);
                end
        %% 加入新电池
                if testsystem(2,mark)==0
                    testsystem(2,mark)=1;
                    testsystem(3,mark)=-1;
                    testsystem(4,mark)=Electricity;
                else
                    outone=testsystem(4,mark);
                    outone1=testsystem(1,mark);
                    outone2=testsystem(2,mark);
                    outone3=testsystem(3,mark);
            %fprintf(fid,'%g:%g:%g:%g:%g\n',outone1,outone2,outone3,outone,t);
                    flag=1;
                    spot=1;
                    numofbatteries=numofbatteries-1;
                    testsystem(2,mark)=1;
                    testsystem(3,mark)=-1;
                    testsystem(4,mark)=Electricity;
                end
            end
    
%% 计算损耗
            for i=1:position
                ttt(i)=testsystem(3,i);
            end
            wastage=calcwas(table,ttt,position);
            wholewaste=wholewaste+wastage;
%     plot(t,wastage,'.r');
%     hold on
%     plot(t,wholewaste/t,'.b');
%% 进行充放电过程
            for i=1:position
                if testsystem(2,i)==0
                elseif testsystem(2,i)==1
                    if testsystem(4,i)+testsystem(3,i)>0
                        testsystem(4,i)=testsystem(4,i)+testsystem(3,i)*5/3;
                    else
                        testsystem(2,i)=2;
                        testsystem(3,i)=0.3;
                        %chargingcurrent(i,testsystem(3,:));
                        testsystem(4,i)=0;
                    end
                elseif testsystem(2,i)==2
                    if testsystem(4,i)+testsystem(3,i)<100
                        testsystem(4,i)=testsystem(4,i)+testsystem(3,i)*5/3;
                    else
                        testsystem(2,i)=3;
                        testsystem(3,i)=-1;
                        testsystem(4,i)=100;
                    end
                elseif testsystem(2,i)==3
                    if testsystem(4,i)+testsystem(3,i)>12
                        testsystem(4,i)=testsystem(4,i)+testsystem(3,i)*5/3;
                    else
                    end
                end
            end
%% 补充出电池
            if flag==0
            else
                if spot==1
                else
                    if mod(t,5)==0
                        outone=100;
                        for i=1:position
                           if testsystem(2,i)==3
                             if outone>testsystem(4,i)
                                 markpoint=i;
                             end
                           end
                        end
                %fprintf(fid,'%g:%g:%g:%g:%g\n',testsystem(1,markpoint),testsystem(2,markpoint),testsystem(3,markpoint),testsystem(4,markpoint),t);
                        testsystem(2,markpoint)=0;
                        testsystem(3,markpoint)=0;
                        testsystem(4,markpoint)=0;
                        numofbatteries=numofbatteries-1;
                    else
                    end
                end
            end
%%
%     [m,n]=size(testsystem); %获取矩阵的大小，p为要输出的矩阵
%     for i=4
%         for j=1:1:n
%             if j==n  %如果一行的个数达到n个则换行，否则空格
%                 fprintf(fid,'%g--%4.3f\n',j,testsystem(i,j)); 
%             else
%                 fprintf(fid,'%g--%4.3f\t',j,testsystem(i,j));
%             end
%         end
%     end
        end
            keys(akey,70-position+1)=wholewaste/t;
%     for i=1:50
%         keys(akey,i+1)=key(1,i);
%     end
    end
position
end
%%
%fclose(fid);