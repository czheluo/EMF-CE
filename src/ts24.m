%8m21 n-1, move2+crt, 14
reap=0; nd=0;
while reap<=2
    for i=n+1:-1:5
        for j=i-2:-1:3
            Td1=d(j-2,j-1)+d(j,j+1)+d(i-1,i);
            Td2=d(j-2,j+1)+d(i-1,j-1)+d(j,i);
            Td3=d(j-2,j+1)+d(i-1,j)+d(j-1,i);
            if Td3<Td2,Td2=Td3; id=3;else id=2;end
            Td=Td2-Td1;
            if Td<(1+rand)*crt*(.75+.75*nd)
                tx=x;td=d;
                if id==2
                    tpx=tx(j-1:j,:); tx(j-1:i-2,:)=tx(j+1:i,:); tx(i-2:i-1,:)=tpx;
                    tph=td(j-1:j,:); td(j-1:i-2,:)=td(j+1:i,:); td(i-2:i-1,:)=tph;
                    tpl=td(:,j-1:j); td(:,j-1:i-2)=td(:,j+1:i); td(:,i-2:i-1)=tpl;
                else
                    tpx=tx(j-1:j,:); tx(j-1:i-2,:)=tx(j+1:i,:); tx(i-2:i-1,:)=tpx([2,1],:);
                    tph=td(j-1:j,:); td(j-1:i-2,:)=td(j+1:i,:); td(i-2:i-1,:)=tph([2,1],:);
                    tpl=td(:,j-1:j); td(:,j-1:i-2)=td(:,j+1:i); td(:,i-2:i-1)=tpl(:,[2,1]);
                end
                TSP=TSP+Td;x=tx;d=td; nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d; reap=0; rept=0;
                    %disp([8122,TSP])
                end
            end
        end
    end
    reap=reap+1; nd=nd+1;
end