%1831, 1-n, change+crt, 15
for r=1:3
    for i=1:n-2
        if i>=2
            Td1=d(i-1,i)+d(i+1,i+2);
            Td2=d(i-1,i+1)+d(i,i+2);
            Td=Td2-Td1;
            if Td<0
                tx=x;td=d;xo=x;xo(n+1,:)=[];
                tmx=tx(i,:); tx(i,:)=tx(i+1,:); tx(i+1,:)=tmx;
                tmh=td(i,:); td(i,:)=td(i+1,:); td(i+1,:)=tmh;
                tml=td(:,i); td(:,i)=td(:,i+1); td(:,i+1)=tml;
                TSP=TSP+Td;x=tx;d=td; nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;x0=Xm;x0(n+1,:)=[];
                    fg=fg+1;
                    figure(fg),clf
                    plot(xo(:,1),xo(:,2),'o','markersize',10,'markerfacecolor','k','markeredgecolor','r','linewidth',2)
                    text(xo(:,1)-.013*rx,xo(:,2)+.04*ry,str,'fontsize',14,'fontweight','b')
                    hold on
                    text(38,96,['i=',num2str(i),', j=',num2str(i+1),', tsp=',num2str(tsp(v1))],'fontsize',15)
                    plot(Xm(:,1),Xm(:,2),'c-','linewidth',2),pause(1)
                    plot([Xm(i-1,1),Xm(i+1,1)],[Xm(i-1,2),Xm(i+1,2)],'r--','linewidth',2),pause(.1)
                    plot([Xm(i,1),Xm(i+2,1)],[Xm(i,2),Xm(i+2,2)],'r--','linewidth',2),pause(.1)
                    pause(1)
                    plot([Xm(i-1,1),Xm(i,1)],[Xm(i-1,2),Xm(i,2)],'b--','linewidth',2.5),pause(.1)                    
                    plot([Xm(i+1,1),Xm(i+2,1)],[Xm(i+1,2),Xm(i+2,2)],'b--','linewidth',2.5),pause(.1)
                    pause(1)
                    axis([0,110,0,110])                    
                end
            end
        end
        for j=i+3:n
            Td1=d(i,i+1)+d(i+1,i+2)+d(j-1,j)+d(j,j+1);
            Td2=d(i,j)+d(j,i+2)+d(j-1,i+1)+d(i+1,j+1);
            Td=Td2-Td1;
            if Td<0
                tx=x;td=d;xo=x;xo(n+1,:)=[];
                tmx=tx(i+1,:); tx(i+1,:)=tx(j,:); tx(j,:)=tmx;
                tmh=td(i+1,:); td(i+1,:)=td(j,:); td(j,:)=tmh;
                tml=td(:,i+1); td(:,i+1)=td(:,j); td(:,j)=tml;
                TSP=TSP+Td;x=tx;d=td;nc=nc+1;
                if TSP<tsp(v1)
                    tsp(v1)=TSP;Xm=x;Dm=d;x0=Xm;x0(n+1,:)=[];
                    fg=fg+1;
                    figure(fg),clf
                    plot(xo(:,1),xo(:,2),'o','markersize',10,'markerfacecolor','k','markeredgecolor','r','linewidth',2)
                    text(xo(:,1)-.013*rx,xo(:,2)+.04*ry,str,'fontsize',14,'fontweight','b')
                    hold on
                    plot(Xm(:,1),Xm(:,2),'c-','linewidth',2)
                    text(38,96,['i=',num2str(i+1),', j=',num2str(j),', tsp=',num2str(tsp(v1))],'fontsize',15)
                    plot([Xm(i,1),Xm(j,1)],[Xm(i,2),Xm(j,2)],'r--','linewidth',2),pause(.1)
                    if j>i+3,plot([Xm(j,1),Xm(i+2,1)],[Xm(j,2),Xm(i+2,2)],'r--','linewidth',2),pause(.1),end
                    if j>i+3,plot([Xm(j-1,1),Xm(i+1,1)],[Xm(j-1,2),Xm(i+1,2)],'r--','linewidth',2),pause(.1) ,end
                    plot([Xm(i+1,1),Xm(j+1,1)],[Xm(i+1,2),Xm(j+1,2)],'r--','linewidth',2),pause(.1)
                    pause(1)
                    plot([Xm(i,1),Xm(i+1,1)],[Xm(i,2),Xm(i+1,2)],'b--','linewidth',2.5),pause(.1)
                    if j>i+3, plot([Xm(i+1,1),Xm(i+2,1)],[Xm(i+1,2),Xm(i+2,2)],'b--','linewidth',2.5),pause(.1), end
                    if j>i+3, plot([Xm(j-1,1),Xm(j,1)],[Xm(j-1,2),Xm(j,2)],'b--','linewidth',2.5),pause(.1), end
                    plot([Xm(j,1),Xm(j+1,1)],[Xm(j,2),Xm(j+1,2)],'b--','linewidth',2.5),pause(.1)
                    pause(1)
                    axis([0,110,0,110])                    
                end
            end
        end
    end
end