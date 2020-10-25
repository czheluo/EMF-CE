%8m1,n-1,move, 18
reap=0; nd=0;
while reap<=2 && nd<=5
    for i=n+1:-1:3
        for j=i-2:-1:2
            Td=d(j-1,j+1)+d(i-1,j)+d(j,i)-d(j-1,j)-d(j,j+1)-d(i-1,i);
            if Td<.18*crt/sqrt(.8+nd)
                tx=x;td=d;
                tmx=tx(j,:); tx(j:i-2,:)=tx(j+1:i-1,:); tx(i-1,:)=tmx;
                tmh=td(j,:); td(j:i-2,:)=td(j+1:i-1,:); td(i-1,:)=tmh;
                tml=td(:,j); td(:,j:i-2)=td(:,j+1:i-1); td(:,i-1)=tml;
                TSP=TSP+Td; x=tx; d=td;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d; reap=0; rept=0;
                    %disp([8120 TSP])
                end
            end
        end
    end
    reap=reap+1; nd=nd+1;
end