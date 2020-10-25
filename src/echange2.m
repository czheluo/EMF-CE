for r=1:3
    n1=max(randi(n+1,3,10));
    for i=n1:-1:3
        if i<n+1
            Td1=d(i-2,i-1)+d(i,i+1);
            Td2=d(i-2,i)+d(i-1,i+1);
            Td=Td2-Td1;
            if Td<0
                tx=x;td=d;
                tmx=tx(i-1,:); tx(i-1,:)=tx(i,:); tx(i,:)=tmx;
                tmh=td(i-1,:); td(i-1,:)=td(i,:); td(i,:)=tmh;
                tml=td(:,i-1); td(:,i-1)=td(:,i); td(:,i)=tml;
                TSP=TSP+Td;x=tx;d=td; 
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;                    
                end
            end
        end
        for j=i-3:-1:2
            Td1=d(j-1,j)+d(j,j+1)+d(i-2,i-1)+d(i-1,i);
            Td2=d(j-1,i-1)+d(i-1,j+1)+d(i-2,j)+d(j,i);
            Td=Td2-Td1;
            if Td<crt/sqrt(r)
                tx=x;td=d;
                tmx=tx(i-1,:); tx(i-1,:)=tx(j,:); tx(j,:)=tmx;
                tmh=td(i-1,:); td(i-1,:)=td(j,:); td(j,:)=tmh;
                tml=td(:,i-1); td(:,i-1)=td(:,j); td(:,j)=tml;
                TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;                    
                end
            end
        end
    end
end