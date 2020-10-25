%1m1,1-n,move+crt, 4
for r=1:3
    n1=min(randi(fix(n/3),1,10));
    for i=n1:n-2
        for j=i+2:n
            Td1=d(i,i+1)+d(j-1,j)+d(j,j+1);
            Td2=d(i,j)+d(j,i+1)+d(j-1,j+1);
            Td=Td2-Td1;
            if Td<crt*(.8+.25*r)
                tx=x;td=d;
                tmx=tx(j,:); tx(i+2:j,:)=tx(i+1:j-1,:); tx(i+1,:)=tmx;
                tmh=td(j,:); td(i+2:j,:)=td(i+1:j-1,:); td(i+1,:)=tmh;
                tml=td(:,j); td(:,i+2:j)=td(:,i+1:j-1); td(:,i+1)=tml;
                TSP=TSP+Td;x=tx;d=td; nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;
                    %disp([1821,TSP])
                end
            end
        end
    end
end