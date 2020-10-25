if mod(v1,2)==0;
    %8144 n-1, move3+crt, 16-1
    for r=1:3
        for i=n+1:-1:7
            for j=i-2:-1:5
                Td1=d(j-4,j-3)+d(j,j+1)+d(i-1,i);
                Td2=d(j-4,j+1)+d(j-3,i-1)+d(j,i);
                Td3=d(j-4,j+1)+d(j,i-1)+d(j-3,i);
                if Td3<Td2; Td2=Td3; id=3; else id=2; end
                Td=Td2-Td1;
                if Td<crt*1.25
                    tx=x;td=d;
                    if id==2
                        tpx=tx(j-3:j,:); tx(j-3:i-5,:)=tx(j+1:i-1,:); tx(i-4:i-1,:)=tpx;
                        tph=td(j-3:j,:); td(j-3:i-5,:)=td(j+1:i-1,:); td(i-4:i-1,:)=tph;
                        tpl=td(:,j-3:j); td(:,j-3:i-5)=td(:,j+1:i-1); td(:,i-4:i-1)=tpl;
                    else
                        tpx=tx(j-3:j,:); tx(j-3:i-5,:)=tx(j+1:i-1,:); tx(i-4:i-1,:)=tpx([4,3,2,1],:);
                        tph=td(j-3:j,:); td(j-3:i-5,:)=td(j+1:i-1,:); td(i-4:i-1,:)=tph([4,3,2,1],:);
                        tpl=td(:,j-3:j); td(:,j-3:i-5)=td(:,j+1:i-1); td(:,i-4:i-1)=tpl(:,[4,3,2,1]);
                    end
                    TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                    if TSP<tsp(v1)
                        tsp(v1)=TSP;Xm=x;Dm=d;
                        %disp([8144,TSP])
                    end
                end
            end
        end
    end
else
    %8155 n-1, move3+crt, 16-2
    for r=1:3
        for i=n+1:-1:8
            for j=i-2:-1:6
                Td1=d(j-5,j-4)+d(j,j+1)+d(i-1,i);
                Td2=d(j-5,j+1)+d(j-4,i-1)+d(j,i);
                Td3=d(j-5,j+1)+d(j,i-1)+d(j-4,i);
                if Td3<Td2; Td2=Td3; id=3; else id=2; end
                Td=Td2-Td1;
                if Td<crt*1.35
                    tx=x;td=d;
                    if id==2
                        tpx=tx(j-4:j,:); tx(j-4:i-6,:)=tx(j+1:i-1,:); tx(i-5:i-1,:)=tpx;
                        tph=td(j-4:j,:); td(j-4:i-6,:)=td(j+1:i-1,:); td(i-5:i-1,:)=tph;
                        tpl=td(:,j-4:j); td(:,j-4:i-6)=td(:,j+1:i-1); td(:,i-5:i-1)=tpl;
                    else
                        tpx=tx(j-4:j,:); tx(j-4:i-6,:)=tx(j+1:i-1,:); tx(i-5:i-1,:)=tpx([5,4,3,2,1],:);
                        tph=td(j-4:j,:); td(j-4:i-6,:)=td(j+1:i-1,:); td(i-5:i-1,:)=tph([5,4,3,2,1],:);
                        tpl=td(:,j-4:j); td(:,j-4:i-6)=td(:,j+1:i-1); td(:,i-5:i-1)=tpl(:,[5,4,3,2,1]);
                    end
                    TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                    if TSP<tsp(v1)
                        tsp(v1)=TSP;Xm=x;Dm=d;
                        %disp([8155,TSP])
                    end
                end
            end
        end
    end
end