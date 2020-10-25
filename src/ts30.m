%8f1,n-1,flip, 19-2
reap=0; nd=0;
while reap<=2
    for i=n+1:-1:3
        j=2;
        while j<=n/1.5+sqrt(mod(v1,169)) && i-j>2
            Td=d(i-j-1,i-1)+d(i-j,i)-d(i-j-1,i-j)-d(i-1,i);
            if Td<.18*crt/(.95+.25*nd)
                tx=x;td=d;
                tx(i-j:i-1,:)=flipud(tx(i-j:i-1,:));
                td(i-j:i-1,:)=flipud(td(i-j:i-1,:));
                td(:,i-j:i-1)=fliplr(td(:,i-j:i-1));
                TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d; reap=0; rept=0;
                    %disp([8151 TSP])
                end
            end
            j=j+1;
        end
    end
    reap=reap+1; nd=nd+1;
end