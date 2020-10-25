if mod(v1,2)==1
    %1844 move4  8-1
    for r=1:3
        n1=min(randi(fix(n/3),1,10));
        for i=n1:n-7
            for j=i+2:n-4
                Td1=d(i,i+1)+d(j-1,j)+d(j+3,j+4);
                Td2=d(i,j)+d(j+3,i+1)+d(j-1,j+4);
                Td3=d(i,j+3)+d(j,i+1)+d(j-1,j+4);
                if Td3<Td2, Td2=Td3; id=3; else id=2; end
                Td=Td2-Td1;
                if Td<crt*1.4
                    tx=x;td=d;
                    if id==2
                        tpx=tx(j:j+3,:); tx(i+5:j+3,:)=tx(i+1:j-1,:); tx(i+1:i+4,:)=tpx;
                        tph=td(j:j+3,:); td(i+5:j+3,:)=td(i+1:j-1,:); td(i+1:i+4,:)=tph;
                        tpl=td(:,j:j+3); td(:,i+5:j+3)=td(:,i+1:j-1); td(:,i+1:i+4)=tpl;
                    else
                        tpx=tx(j:j+3,:); tx(i+5:j+3,:)=tx(i+1:j-1,:); tx(i+1:i+4,:)=tpx([4,3,2,1],:);
                        tph=td(j:j+3,:); td(i+5:j+3,:)=td(i+1:j-1,:); td(i+1:i+4,:)=tph([4,3,2,1],:);
                        tpl=td(:,j:j+3); td(:,i+5:j+3)=td(:,i+1:j-1); td(:,i+1:i+4)=tpl(:,[4,3,2,1]);
                    end
                    TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                    if TSP<tsp(v1)
                        tsp(v1)=TSP;Xm=x;Dm=d;
                        %disp([1844,TSP])
                    end
                end
            end
        end
    end
else
    %1855,1-n,move3+crt, 8-2
    for r=1:3
        n1=min(randi(fix(n/3),1,10));
        for i=n1:n-7
            for j=i+2:n-5
                Td1=d(i,i+1)+d(j-1,j)+d(j+4,j+5);
                Td2=d(i,j)+d(j+4,i+1)+d(j-1,j+5);
                Td3=d(i,j+4)+d(j,i+1)+d(j-1,j+5);
                if Td3<Td2, Td2=Td3; id=3;else id=2; end
                Td=Td2-Td1;
                if Td<crt*1.5
                    tx=x;td=d;
                    if id==2
                        tpx=tx(j:j+4,:); tx(i+6:j+4,:)=tx(i+1:j-1,:); tx(i+1:i+5,:)=tpx;
                        tph=td(j:j+4,:); td(i+6:j+4,:)=td(i+1:j-1,:); td(i+1:i+5,:)=tph;
                        tpl=td(:,j:j+4); td(:,i+6:j+4)=td(:,i+1:j-1); td(:,i+1:i+5)=tpl;
                    else
                        tpx=tx(j:j+4,:); tx(i+6:j+4,:)=tx(i+1:j-1,:); tx(i+1:i+5,:)=tpx([5,4,3,2,1],:);
                        tph=td(j:j+4,:); td(i+6:j+4,:)=td(i+1:j-1,:); td(i+1:i+5,:)=tph([5,4,3,2,1],:);
                        tpl=td(:,j:j+4); td(:,i+6:j+4)=td(:,i+1:j-1); td(:,i+1:i+5)=tpl(:,[5,4,3,2,1]);
                    end
                    TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                    if TSP<tsp(v1)
                        tsp(v1)=TSP;Xm=x;Dm=d;
                        %disp([1855,TSP])
                    end
                end
            end
        end
    end
end