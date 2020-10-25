%8155 n-1, move3+crt, 16-2
%nc76=nc;
reap=0;nd=0;
while reap<=2 && nd<=10
    i=n+1;
    while i>=5
        j=i-2;
        while  j>=3
            l=2;
            while j-l>=1 && l<=sqrt(n)
                Td1=d(j-l,j-l+1)+d(j,j+1)+d(i-1,i);
                Td2=d(j-l,j+1)+d(j-l+1,i-1)+d(j,i);
                Td3=d(j-l,j+1)+d(j,i-1)+d(j-l+1,i);
                if Td3<Td2; Td2=Td3; id=3; else id=2; end
                Td=Td2-Td1;
                if Td<crt*(1+l/15)/(.85+.35*nd)
                    tx=x;td=d;
                    if id==2
                        tpx=tx(j-l+1:j,:); tx(j-l+1:i-l-1,:)=tx(j+1:i-1,:); tx(i-l:i-1,:)=tpx;
                        tph=td(j-l+1:j,:); td(j-l+1:i-l-1,:)=td(j+1:i-1,:); td(i-l:i-1,:)=tph;
                        tpl=td(:,j-l+1:j); td(:,j-l+1:i-l-1)=td(:,j+1:i-1); td(:,i-l:i-1)=tpl;
                    else
                        tpx=tx(j-l+1:j,:); tx(j-l+1:i-l-1,:)=tx(j+1:i-1,:); tx(i-l:i-1,:)=tpx(l:-1:1,:);
                        tph=td(j-l+1:j,:); td(j-l+1:i-l-1,:)=td(j+1:i-1,:); td(i-l:i-1,:)=tph(l:-1:1,:);
                        tpl=td(:,j-l+1:j); td(:,j-l+1:i-l-1)=td(:,j+1:i-1); td(:,i-l:i-1)=tpl(:,l:-1:1);
                    end
                    TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                    if TSP<tsp(v1)
                        tsp(v1)=TSP;Xm=x;Dm=d;reap=0;
                        if tsp(v1)<tspm break,end
                        %disp([1876,TSP])
                    end
                end
                l=l+1;
            end
            j=j-1;
        end
        i=i-1;
    end
    reap=reap+1;nd=nd+1;
end
%nc76=nc-nc76;f1(6)=6;f2(6)=nc76;