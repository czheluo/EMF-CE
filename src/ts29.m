% 1f1,1-n, flip, 19-1
reap=0;nd=0;
while reap<=2
    for i=1:n-2
        j=2;
        while j<=n/1.5+sqrt(mod(v1,144)) && i+j<n
            Td=d(i,i+j)+d(i+1,i+j+1)-d(i,i+1)-d(i+j,i+j+1);
            if Td<.18*crt/(.95+.25*nd)
                tx=x;td=d;
                tx(i+1:i+j,:)=flipud(tx(i+1:i+j,:));
                td(i+1:i+j,:)=flipud(td(i+1:i+j,:));
                td(:,i+1:i+j)=fliplr(td(:,i+1:i+j));
                TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d; reap=0; rept=0;
                    %disp([1851,TSP])
                end
            end
            j=j+1;
        end
    end
    reap=reap+1; nd=nd+1;
end