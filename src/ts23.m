%1m20,1-n,move2+crt, 5
reap=0; nd=0;
while reap<=2
    n1=min(randi(fix(n/3),1,10));
    for i=n1:n-3
        for j=i+2:n-2
            Td1=d(i,i+1)+d(j-1,j)+d(j+1,j+2);
            Td2=d(i,j)+d(j+1,i+1)+d(j-1,j+2);
            Td3=d(i,j+1)+d(j,i+1)+d(j-1,j+2);
            if Td3<Td2, Td2=Td3; id=3;else id=2; end
            Td=Td2-Td1;
            if Td<(1+rand)*crt*(.75+.75*nd)
                tx=x; td=d;
                if id==2
                    tpx=tx(j:j+1,:); tx(i+3:j+1,:)=tx(i+1:j-1,:); tx(i+1:i+2,:)=tpx;
                    tph=td(j:j+1,:); td(i+3:j+1,:)=td(i+1:j-1,:); td(i+1:i+2,:)=tph;
                    tpl=td(:,j:j+1); td(:,i+3:j+1)=td(:,i+1:j-1); td(:,i+1:i+2)=tpl;
                else
                    tpx=tx(j:j+1,:); tx(i+3:j+1,:)=tx(i+1:j-1,:); tx(i+1:i+2,:)=tpx([2,1],:);
                    tph=td(j:j+1,:); td(i+3:j+1,:)=td(i+1:j-1,:); td(i+1:i+2,:)=tph([2,1],:);
                    tpl=td(:,j:j+1); td(:,i+3:j+1)=td(:,i+1:j-1); td(:,i+1:i+2)=tpl(:,[2,1]);
                end
                TSP=TSP+Td;x=tx;d=td; nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d; reap=0; rept=0;
                    %disp([1822,TSP])
                end
            end
        end
    end
    reap=reap+1; nd=nd+1;
end