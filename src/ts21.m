%1m0,1-n,move, 7
reap=0; nd=0;
while reap<=2
    for i=1:n-2
        for j=i+2:n
            Td1=d(i,i+1)+d(j-1,j)+d(j,j+1);
            Td2=d(i,j)+d(j,i+1)+d(j-1,j+1);
            Td=Td2-Td1;
            if Td<.5*rand*crt/(1+nd)
                tx=x;td=d;
                tmx=tx(j,:); tx(i+2:j,:)=tx(i+1:j-1,:); tx(i+1,:)=tmx;
                tmh=td(j,:); td(i+2:j,:)=td(i+1:j-1,:); td(i+1,:)=tmh;
                tml=td(:,j); td(:,i+2:j)=td(:,i+1:j-1); td(:,i+1)=tml;
                TSP=TSP+Td;x=tx;d=td; nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d; reap=0; rept=0;
                    %disp([1820,TSP])
                end
            end
        end
    end
    reap=reap+1; nd=nd+1;
end