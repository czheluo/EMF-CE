%1833,1-n,move3+crt, 11
for r=1:3
    for i=1:n-6
        for j=i+2:n-4
            Td1=d(i,i+1)+d(j-1,j)+d(j+2,j+3);
            Td2=d(i,j)+d(j+2,i+1)+d(j-1,j+3);
            Td3=d(i,j+2)+d(j,i+1)+d(j-1,j+3);
            if Td3<Td2, Td2=Td3; id=3;else id=2; end
            Td=Td2-Td1;
            if Td<crt*1.3
                tx=x;td=d;
                if id==2
                    tpx=tx(j:j+2,:); tx(i+4:j+2,:)=tx(i+1:j-1,:); tx(i+1:i+3,:)=tpx;
                    tph=td(j:j+2,:); td(i+4:j+2,:)=td(i+1:j-1,:); td(i+1:i+3,:)=tph;
                    tpl=td(:,j:j+2); td(:,i+4:j+2)=td(:,i+1:j-1); td(:,i+1:i+3)=tpl;
                else
                    tpx=tx(j:j+2,:); tx(i+4:j+2,:)=tx(i+1:j-1,:); tx(i+1:i+3,:)=tpx([3,2,1],:);
                    tph=td(j:j+2,:); td(i+4:j+2,:)=td(i+1:j-1,:); td(i+1:i+3,:)=tph([3,2,1],:);
                    tpl=td(:,j:j+2); td(:,i+4:j+2)=td(:,i+1:j-1); td(:,i+1:i+3)=tpl(:,[3,2,1]);
                end
                TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;
                    %disp([1833,TSP])
                end
            end
        end
    end
end