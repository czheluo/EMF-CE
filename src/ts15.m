%1831, 1-n, change+crt, 15
for r=1:3
    for i=1:n-2
        if i>=2
            Td1=d(i-1,i)+d(i+1,i+2);
            Td2=d(i-1,i+1)+d(i,i+2);
            Td=Td2-Td1;
            if Td<0
                tx=x;td=d;
                tmx=tx(i,:); tx(i,:)=tx(i+1,:); tx(i+1,:)=tmx;
                tmh=td(i,:); td(i,:)=td(i+1,:); td(i+1,:)=tmh;
                tml=td(:,i); td(:,i)=td(:,i+1); td(:,i+1)=tml;
                TSP=TSP+Td;x=tx;d=td; nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;
                    %disp([1831 TSP])
                end
            end
        end
        for j=i+3:n
            Td1=d(i,i+1)+d(i+1,i+2)+d(j-1,j)+d(j,j+1);
            Td2=d(i,j)+d(j,i+2)+d(j-1,i+1)+d(i+1,j+1);
            Td=Td2-Td1;
            if Td<.8*crt/sqrt(r)
                tx=x;td=d;
                tmx=tx(i+1,:); tx(i+1,:)=tx(j,:); tx(j,:)=tmx;
                tmh=td(i+1,:); td(i+1,:)=td(j,:); td(j,:)=tmh;
                tml=td(:,i+1); td(:,i+1)=td(:,j); td(:,j)=tml;
                TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;
                    %disp([1831,TSP])
                end
            end
        end
    end
end