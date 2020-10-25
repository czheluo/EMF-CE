%8m1 n-1, move+crt, 14
for r=1:3
    for i=n:-1:3
        for j=i-2:-1:2
            Td1=d(j-1,j)+d(j,j+1)+d(i-1,i);
            Td2=d(j-1,j+1)+d(i-1,j)+d(j,i);
            Td=Td2-Td1;
            if Td<crt/sqrt(r)
                tx=x;td=d;
                tmx=tx(j,:); tx(j:i-2,:)=tx(j+1:i-1,:); tx(i-1,:)=tmx;
                tmh=td(j,:); td(j:i-2,:)=td(j+1:i-1,:); td(i-1,:)=tmh;
                tml=td(:,j); td(:,j:i-2)=td(:,j+1:i-1); td(:,i-1)=tml;
                TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;
                    %disp([8121,TSP])
                end
            end
        end
    end
end