if mod(v1,2)==1
    % 1f0,1-n, flip, 19-1
    reap=0;nd=0;
    while reap<=1
        for i=1:n-2
            j=2;
            while j<=n/1.5+sqrt(mod(v1,144)) && i+j<n
                Td=d(i,i+j)+d(i+1,i+j+1)-d(i,i+1)-d(i+j,i+j+1);
                if Td<.12*crt/(1+.5*nd)
                    tx=x;td=d;
                    tx(i+1:i+j,:)=flipud(tx(i+1:i+j,:));
                    td(i+1:i+j,:)=flipud(td(i+1:i+j,:));
                    td(:,i+1:i+j)=fliplr(td(:,i+1:i+j));
                    TSP=TSP+Td;x=tx;d=td;
                    if TSP<tsp(v1)
                        tsp(v1)=TSP;Xm=x;Dm=d;reap=0;rept=0;
                        %disp([1850,TSP])
                    end
                end
                j=j+1;
            end
        end
        reap=reap+1;nd=nd+1;
    end
else
    %8f0,n-1,flip, 19-2
    reap=0; nd=0;
    while reap<=1
        for i=n+1:-1:3
            j=2;
            while j<=n/1.5+sqrt(mod(v1,169)) && i-j>2
                Td=d(i-j-1,i-1)+d(i-j,i)-d(i-j-1,i-j)-d(i-1,i);
                if Td<.12*crt/(1+.5*nd)
                    tx=x;td=d;
                    tx(i-j:i-1,:)=flipud(tx(i-j:i-1,:));
                    td(i-j:i-1,:)=flipud(td(i-j:i-1,:));
                    td(:,i-j:i-1)=fliplr(td(:,i-j:i-1));
                    TSP=TSP+Td;x=tx;d=td;
                    if TSP<tsp(v1)
                        tsp(v1)=TSP;Xm=x;Dm=d; reap=0; rept=0;
                        %disp([8150 TSP])
                    end
                end
                j=j+1;
            end
        end
        reap=reap+1; nd=nd+1;
    end
end