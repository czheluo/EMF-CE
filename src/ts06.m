%8133 n-1, move3+crt, 6
for r=1:3
    n1=max(randi(n,1,10));
    for i=n1:-1:6
        for j=i-2:-1:4
            Td1=d(j-3,j-2)+d(j,j+1)+d(i-1,i);
            Td2=d(j-3,j+1)+d(i-1,j-2)+d(j,i);
            Td3=d(j-3,j+1)+d(i-1,j)+d(j-2,i);
            if Td3<Td2, Td2=Td3; id=3; else id=2;end
            Td=Td2-Td1;
            if Td<crt*1.3
                tx=x;td=d;
                if id==2
                    tpx=tx(j-2:j,:); tx(j-2:i-4,:)=tx(j+1:i-1,:); tx(i-3:i-1,:)=tpx;
                    tph=td(j-2:j,:); td(j-2:i-4,:)=td(j+1:i-1,:); td(i-3:i-1,:)=tph;
                    tpl=td(:,j-2:j); td(:,j-2:i-4)=td(:,j+1:i-1); td(:,i-3:i-1)=tpl;
                else
                    tpx=tx(j-2:j,:); tx(j-2:i-4,:)=tx(j+1:i-1,:); tx(i-3:i-1,:)=tpx([3,2,1],:);
                    tph=td(j-2:j,:); td(j-2:i-4,:)=td(j+1:i-1,:); td(i-3:i-1,:)=tph([3,2,1],:);
                    tpl=td(:,j-2:j); td(:,j-2:i-4)=td(:,j+1:i-1); td(:,i-3:i-1)=tpl(:,[3,2,1]);
                end
                TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;
                    %disp([8133,TSP])
                end
            end
        end
    end
end