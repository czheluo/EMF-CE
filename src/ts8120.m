%8m1,n-1,move, 10
reap=0;
while reap<=2
    for i=n+1:-1:3
        for j=i-2:-1:2
            Td1=d(j-1,j)+d(j,j+1)+d(i-1,i);
            Td2=d(j-1,j+1)+d(i-1,j)+d(j,i);
            Td=Td2-Td1;
            if Td<0
                tx=x;td=d;
                tmx=tx(j,:); tx(j:i-2,:)=tx(j+1:i-1,:); tx(i-1,:)=tmx;
                tmh=td(j,:); td(j:i-2,:)=td(j+1:i-1,:); td(i-1,:)=tmh;
                tml=td(:,j); td(:,j:i-2)=td(:,j+1:i-1); td(:,i-1)=tml;
                TSP=TSP+Td;x=tx;d=td;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;x0=Xm;x0(n+1,:)=[];
                    fg=fg+1;
                    figure(fg),clf
                    plot(x0(:,1),x0(:,2),'o','markersize',10,'markerfacecolor','b','markeredgecolor','r','linewidth',2)
                    text(x0(:,1)-.013*rx,x0(:,2)+.033*ry,str,'fontsize',14,'fontweight','b')
                    hold on
                    plot(Xm(:,1),Xm(:,2),'c-','linewidth',1)
                    text(38,96,['i=',num2str(i-1),', j=',num2str(j),', tsp=',num2str(tsp(v1))],'fontsize',15)
                    plot([Xm(i,1),Xm(i-2,1)],[Xm(i,2),Xm(i-2,2)],'r--','linewidth',2),pause(.1)
                    plot([Xm(j,1),Xm(i-1,1)],[Xm(j,2),Xm(i-1,2)],'r--','linewidth',2),pause(.1)
                    plot([Xm(i-1,1),Xm(j-1,1)],[Xm(i-1,2),Xm(j-1,2)],'r--','linewidth',2),pause(.1)
                    pause(1)
                    plot([Xm(i,1),Xm(i-1,1)],[Xm(i,2),Xm(i-1,2)],'b--','linewidth',2),pause(.1)
                    plot([Xm(i-1,1),Xm(i-2,1)],[Xm(i-1,2),Xm(i-2,2)],'b--','linewidth',2),pause(.1)
                    plot([Xm(j,1),Xm(j-1,1)],[Xm(j,2),Xm(j-1,2)],'b--','linewidth',2),pause(.1)
                    pause(1)
                end
            end
        end
    end
    reap=reap+1;
end