% 1f0,1-n, flip, 19-1
reap=0;nd=0;
while reap<=1
    for i=1:n-2
        j=2;
        while j<=n/1.5+sqrt(mod(v1,144)) && i+j<n
            Td=d(i,i+j)+d(i+1,i+j+1)-d(i,i+1)-d(i+j,i+j+1);
            if Td<.12*crt/(1+.5*nd)
                tx=x;td=d;xo=x;xo(n+1,:)=[];
                tx(i+1:i+j,:)=flipud(tx(i+1:i+j,:));
                td(i+1:i+j,:)=flipud(td(i+1:i+j,:));
                td(:,i+1:i+j)=fliplr(td(:,i+1:i+j));
                TSP=TSP+Td;x=tx;d=td;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d; reap=0; rept=0;
                    fg=fg+1;
                    figure(fg),clf
                    plot(xo(:,1),xo(:,2),'o','markersize',10,'markerfacecolor','b','markeredgecolor','r','linewidth',2)
                    text(xo(:,1)-.013*rx,xo(:,2)+.04*ry,str,'fontsize',14,'fontweight','b')
                    hold on
                    plot(Xm(:,1),Xm(:,2),'c-','linewidth',2)
                    text(35,95,['i=',num2str(i+1),', j=',num2str(i+j),', tsp=',num2str(tsp(v1))],'fontsize',15)
                    plot([Xm(i,1),Xm(i+1,1)],[Xm(i,2),Xm(i+1,2)],'b--','linewidth',2.5),pause(.1)
                    plot([Xm(i+j,1),Xm(i+j+1,1)],[Xm(i+j,2),Xm(i+j+1,2)],'b--','linewidth',2.5),pause(.1)
                    pause(1)
                    plot([Xm(i,1),Xm(i+j,1)],[Xm(i,2),Xm(i+j,2)],'r--','linewidth',2),pause(.1)
                    plot([Xm(i+1,1),Xm(i+j+1,1)],[Xm(i+1,2),Xm(i+j+1,2)],'r--','linewidth',2),pause(.1)
                    pause(1)
                    axis([0,100,0,100])                    
                end
            end
            j=j+1;
        end
    end
    reap=reap+1; nd=0;
end