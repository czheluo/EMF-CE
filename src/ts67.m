%1867,1-n,move3+crt, 8-2
%nc67=nc;
reap=0;nd=0;
while reap<=2 && nd<=10
    i=1;
    while i<=n-3
        j=i+2;
        while j<=n-2
            l=2;
            while j+l<=n+1 && l<=sqrt(n)
                Td1=d(i,i+1)+d(j-1,j)+d(j+l-1,j+l);
                Td2=d(i,j)+d(j+l-1,i+1)+d(j-1,j+l);
                Td3=d(i,j+l-1)+d(j,i+1)+d(j-1,j+l);
                if Td3<Td2, Td2=Td3; id=3;else id=2; end
                Td=Td2-Td1;
                if Td<crt*(1+l/12)/(.85+.35*nd)
                    tx=x;td=d;
                    if id==2
                        tpx=tx(j:j+l-1,:); tx(i+l+1:j+l-1,:)=tx(i+1:j-1,:); tx(i+1:i+l,:)=tpx;
                        tph=td(j:j+l-1,:); td(i+l+1:j+l-1,:)=td(i+1:j-1,:); td(i+1:i+l,:)=tph;
                        tpl=td(:,j:j+l-1); td(:,i+l+1:j+l-1)=td(:,i+1:j-1); td(:,i+1:i+l)=tpl;
                    else
                        tpx=tx(j:j+l-1,:); tx(i+l+1:j+l-1,:)=tx(i+1:j-1,:); tx(i+1:i+l,:)=tpx(l:-1:1,:);
                        tph=td(j:j+l-1,:); td(i+l+1:j+l-1,:)=td(i+1:j-1,:); td(i+1:i+l,:)=tph(l:-1:1,:);
                        tpl=td(:,j:j+l-1); td(:,i+l+1:j+l-1)=td(:,i+1:j-1); td(:,i+1:i+l)=tpl(:,l:-1:1);
                    end
                    TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                    if TSP<tsp(v1)
                        tsp(v1)=TSP;Xm=x;Dm=d;reap=0;
                        if tsp(v1)<tspm break,end
                        %disp([1867,TSP])
                    end
                end
                l=l+1;
            end
            j=j+1;
        end
        i=i+1;
    end
    reap=reap+1;nd=nd+1;
end
%nc67=nc-nc67;f1(5)=5;f2(5)=nc67;