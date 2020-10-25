function []=EMFCE(tspfile,dia,tspm,nr)
%tspfile='pr124.tsp',dia='diary.txt',tspm=59030,nr=1
%EMFCE('../pr124.tsp','diary.txt',59030,2)
addpath([pwd,'/src/']);
%clear all, clc
global x d n nc v1 TSP tsp Xm Dm crt
diary(dia) ;
if nargin<4
    nr = 1;
end
[Dimension,NodeCoord,NodeWeight,Name]=FileInput(tspfile);%'pr124.tsp',fl417rd400.gil226,lin318kroB200
x1=NodeCoord(:,2:3);
n=length(x1);cp=randperm(n);x1=x1(cp,:);
%x1=xlsread('tspt2','result1','e2:f1578');
%n=length(x1);cp=randperm(n);x1=x1(cp,:);
%tspm=59030;
if nr ==1
    x=x1;
    tm=zeros(1,nr);tpm=zeros(1,nr); tsm=tspm+50;
    [n,k]=size(x);
    %cp=randperm(n); x=x(cp,:);
    xo=x;x0=x;
    rx=range(x(:,1));ry=range(x(:,k));
    md=round((1.5+.27*n)/(1+.008*n))-3;me=md+10;
    mc=(2+.0063*n)/(1+.0007*n);
    str=num2str([1:n]');
    x(n+1,:)=x(1,:);Td=0;
    d=pdist2(x,x);d=round(d);
    for i=1:n
        Td=Td+d(i,i+1);
    end
    crt=50*Td/n^1.8; N=n*(n+1)/2; nc=0;

    X=zeros(n,2,5);tp=zeros(1,5);
    for i=1:5
        X(:,:,i)=xo;tp(i)=Td;
    end
    tmx=zeros(1,k);tmh=zeros(1,n+1);tml=zeros(n+1,1);
    tpx=zeros(3,k);tph=zeros(3,n+1);tpl=zeros(n+1,3);
    TSP=Td; disp(['TSP0=',num2str(Td)])
    tsp=zeros(1,30*n);tsp(1:2)=Td;Xm=x;Dm=d;v1=2;rep=0;
    pause(.01), t1=tic;nm=0;

    while  rep<=398 && tsp(v1)>tspm
    
        if rep>11 && mod(v1,md)==0
            n1=random('unif',n/29,n/12,1,md+6);
            while sum(n1)>1.03*n, n1=n1-1; end
            while sum(n1)>.96*n, n1(n1==min(n1))=[]; end
            n1=round(n1);
            if sum(n1)<.8*n
                n2=length(n1); n2=n2+2;n1(n2-1)=fix((n-sum(n1))/2);n1(n2)=n-sum(n1);
            else
                n2=length(n1); n2=n2+1;n1(n2)=n-sum(n1);
            end
            n1(n1<=0)=[];n2=length(n1);
            ncp=randperm(n2);m=1;b=zeros(n2,max(n1));
            for i=1:n2
                b(i,1:n1(i))=m:m+n1(i)-1;
                m=m+n1(i);
            end
            a=b(ncp,:);
            fp=randi(2,1,n2)-1;
            for i=1:n2
                if fp(i)==1
                    fliplr(a(i,:));
                end
            end
            a=a'; a=a(:); a(a==0)=[];
            x=x0;
            x=x(a,:); x(n+1,:)=x(1,:); Td=0;
            d=pdist2(x,x);d=round(d);
            for i=1:n
                Td=Td+d(i,i+1);
            end
            TSP=Td; crt=(.15+.25*rand)*crt; nc=0;
            disp([md,TSP,crt,n2])
        elseif mod(v1,me)==0 && rep>12
            crt=crt/(3.5+7*rand); x=Xm; d=Dm; %TSP=tsp(v1);
        elseif mod(v1,7+fix(log(v1)))==4
            nm=nm+1;
            if mod(nm,3)==0
                x=X(:,:,randi(5,1,1)); B=[x;x];crt=rand*crt/1.85;
            else
                B=[x0;x0]; 
            end
            in=fix(random('unif',.3*n,.7*n,1));
            x=B(in:in+n-1,:); x(n+1,:)=x(1,:);
            Td=0; d=pdist2(x,x);d=round(d);
            for i=1:n
                Td=Td+d(i,i+1);
            end
            TSP=Td;
        end
    
        if mod(v1,11)==0 && rep>5
            rept=0;crt=crt/1.65;
            while rept<=3
                rd=randperm(18);
                for i1=1:18
                    switch rd(i1)
                        case 1
                            ts17
                        case 2
                            ts18
                        case 3
                            ts19
                        case 4
                            ts21
                        case 5
                            ts22
                        case 6
                            ts23
                        case 7
                            ts24
                        case 8
                            ts34
                        case 9
                            ts43
                        case 10
                            ts45
                        case 11
                            ts54
                        case 12
                            ts56
                        case 13
                            ts65
                        case 14
                            ts67
                        case 15
                            ts76
                        case 16
                            ts29
                        case 17
                            ts30
                        otherwise
                            ts20                        
                    end
                end            
                rept=rept+1;
            end
            if tsp(v1)<tspm, break,end
            pause(.1)
        else
            ts1,ts2,ts3,ts4,ts5,ts77,ts30
            if tsp(v1)<tspm,break,end
            ts6,ts7,ts8,ts9,ts55,ts10,ts29
            if tsp(v1)<tspm,break,end
            ts11,ts12,ts13,ts14,ts20,ts66
            if tsp(v1)<tspm,break,end
            ts15,ts16,ts17,ts44,ts18,ts19
            if tsp(v1)<tspm,break,end
            pause(.1)
        end
        if tsp(v1)<tspm,break,end
        if mod(v1,2)==0
            crt=crt*exp(-.75*(sqrt(nc)-sqrt(.03*N+.15*n*mod(v1,n)+1.25*n*mod(v1,fix(n/mc))))/n);
            crt=.1*TSP/n*(crt<.1*TSP/n)+(crt>=.1*TSP/n)*crt*(crt<=6*TSP/n)+6*TSP/n*(crt>6*TSP/n);
            %disp([1,nc crt])
            ne=nc;
        else
            crt=crt*exp(-.68*(sqrt(nc)-sqrt(.05*N+.2*n*mod(v1,n)+2.5*n*mod(v1,fix(n/mc))))/n);
            crt=.1*TSP/n*(crt<.1*TSP/n)+(crt>=.1*TSP/n)*crt*(crt<=6*TSP/n)+6*TSP/n*(crt>6*TSP/n);
            %disp([2,nc,crt])
            ne=nc;nc=0;
        end
%       figure(3),clf    
%       bar(f1,f2)
%       axis tight
%       pause(.1)
        if tsp(v1)<tsp(v1-1)
            x0=Xm;x0(n+1,:)=[];
            for i=5:-1:2
                X(:,:,i)=X(:,:,i-1);tp(i)=tp(i-1);
            end
            X(:,:,1)=x0;tp(1)=tsp(v1);rep=0;
        elseif mod(v1,30)==0
            X(:,:,5)=x1;tp(5)=TSP;
        end
        rep=rep+1;v1=v1+1;tsp(v1)=tsp(v1-1);
        disp([v1-2,tsp(v1),crt,ne])
        if tsp(v1)<tsp(v1-2) || v1<=3
            figure(2),clf
            plot(x0(:,1),x0(:,2),'o','markersize',7,'markerfacecolor','g','markeredgecolor','r','linewidth',1.5)
            text(x0(:,1)-.0075*rx,x0(:,2)+.017*ry,str,'fontsize',8,'fontweight','b')
            hold on
            plot(Xm(:,1),Xm(:,2),'c-','linewidth',2.5)
            plot(Xm(:,1),Xm(:,2),'b-','linewidth',.5)
            title(['tsp=',num2str(tsp(v1))],'fontsize',14)
            axis tight
            pause(.1)
        end
    end
    t2=toc(t1)
    disp(tsp(v1))
    figure(1),clf
    x0=Xm;x0(n+1,:)=[];
    plot(x0(:,1),x0(:,2),'o','markersize',7,'markerfacecolor','c','markeredgecolor','r','linewidth',1.5)
    text(x0(:,1)-.0075*rx,x0(:,2)+.015*ry,str,'fontsize',10,'fontweight','b')
    hold on
    plot(Xm(:,1),Xm(:,2),'g-','linewidth',2.5)
    plot(Xm(:,1),Xm(:,2),'b-','linewidth',.5)
    title(['tsp=',num2str(tsp(v1))],'fontsize',16)
    axis tight
    tm=tm';tpm=tpm';tsm;
    diary off
else
   tm=zeros(1,nr);tpm=zeros(1,nr); tsm=tspm+50;
    %xm=x1;
    for ii=1:nr
        x=x1; %tspm=tsm-10/ii;
        [n,k]=size(x);
        %cp=randperm(n); x=x(cp,:);
        xo=x;x0=x;
        rx=range(x(:,1));ry=range(x(:,k));
        md=round((1.5+.27*n)/(1+.008*n))-3;me=md+10;
        mc=(2+.0063*n)/(1+.0007*n);
        str=num2str([1:n]');
        x(n+1,:)=x(1,:);Td=0;
        d=pdist2(x,x);d=round(d);
        for i=1:n
            Td=Td+d(i,i+1);
        end
        crt=50*Td/n^1.8; N=n*(n+1)/2; nc=0;
        X=zeros(n,2,5);tp=zeros(1,5);
        for i=1:5
            X(:,:,i)=xo;tp(i)=Td;
        end
        tmx=zeros(1,k);tmh=zeros(1,n+1);tml=zeros(n+1,1);
        tpx=zeros(3,k);tph=zeros(3,n+1);tpl=zeros(n+1,3);
        TSP=Td; disp(['TSP0=',num2str(Td)])
        tsp=zeros(1,30*n);tsp(1:2)=Td;Xm=x;Dm=d;v1=2;rep=0;
        pause(.01), t1=tic;nm=0;
        while  rep<=398 && tsp(v1)>tspm
            if rep>11 && mod(v1,md)==0
                n1=random('unif',n/29,n/12,1,md+6);
                while sum(n1)>1.03*n, n1=n1-1; end
                while sum(n1)>.96*n, n1(n1==min(n1))=[]; end
                n1=round(n1);
                if sum(n1)<.8*n
                    n2=length(n1); n2=n2+2;n1(n2-1)=fix((n-sum(n1))/2);n1(n2)=n-sum(n1);
                else
                    n2=length(n1); n2=n2+1;n1(n2)=n-sum(n1);
                end
                n1(n1<=0)=[];n2=length(n1);
                ncp=randperm(n2);m=1;b=zeros(n2,max(n1));
                for i=1:n2
                    b(i,1:n1(i))=m:m+n1(i)-1;
                    m=m+n1(i);
                end
                a=b(ncp,:);
                fp=randi(2,1,n2)-1;
                for i=1:n2
                    if fp(i)==1
                        fliplr(a(i,:));
                    end
                end
                a=a'; a=a(:); a(a==0)=[];
                x=x0;
                x=x(a,:); x(n+1,:)=x(1,:); Td=0;
                d=pdist2(x,x);d=round(d);
                for i=1:n
                    Td=Td+d(i,i+1);
                end
                TSP=Td; crt=(.15+.25*rand)*crt; nc=0;
                disp([md,TSP,crt,n2])
            elseif mod(v1,me)==0 && rep>12
                crt=crt/(3.5+7*rand); x=Xm; d=Dm; %TSP=tsp(v1);
            elseif mod(v1,7+fix(log(v1)))==4
                nm=nm+1;
                if mod(nm,3)==0
                    x=X(:,:,randi(5,1,1)); B=[x;x];crt=rand*crt/1.85;
                else
                    B=[x0;x0]; 
                end
                in=fix(random('unif',.3*n,.7*n,1));
                x=B(in:in+n-1,:); x(n+1,:)=x(1,:);
                Td=0; d=pdist2(x,x);d=round(d);
                for i=1:n
                    Td=Td+d(i,i+1);
                end
                TSP=Td;
            end
    
            if mod(v1,11)==0 && rep>5
                rept=0;crt=crt/1.65;
                while rept<=3
                    rd=randperm(18);
                    for i1=1:18
                        switch rd(i1)
                            case 1
                                ts17
                            case 2
                                ts18
                            case 3
                                ts19
                            case 4
                                ts21
                            case 5
                                ts22
                            case 6
                                ts23
                            case 7
                                ts24
                            case 8
                                ts34
                            case 9
                                ts43
                            case 10
                                ts45
                            case 11
                                ts54
                            case 12
                                ts56
                            case 13
                                ts65
                            case 14
                                ts67
                            case 15
                                ts76
                            case 16
                                ts29
                            case 17
                                ts30
                            otherwise
                                ts20                        
                        end
                    end            
                    rept=rept+1;
                end
                if tsp(v1)<tspm, break,end
                pause(.1)
            else
                ts1,ts2,ts3,ts4,ts5,ts77,ts30
                if tsp(v1)<tspm,break,end
                ts6,ts7,ts8,ts9,ts55,ts10,ts29
                if tsp(v1)<tspm,break,end
                ts11,ts12,ts13,ts14,ts20,ts66
                if tsp(v1)<tspm,break,end
                ts15,ts16,ts17,ts44,ts18,ts19
                if tsp(v1)<tspm,break,end
                pause(.1)
            end
            if tsp(v1)<tspm,break,end
            if mod(v1,2)==0
                crt=crt*exp(-.75*(sqrt(nc)-sqrt(.03*N+.15*n*mod(v1,n)+1.25*n*mod(v1,fix(n/mc))))/n);
                crt=.1*TSP/n*(crt<.1*TSP/n)+(crt>=.1*TSP/n)*crt*(crt<=6*TSP/n)+6*TSP/n*(crt>6*TSP/n);
                %disp([1,nc crt])
                ne=nc;
            else
                crt=crt*exp(-.68*(sqrt(nc)-sqrt(.05*N+.2*n*mod(v1,n)+2.5*n*mod(v1,fix(n/mc))))/n);
                crt=.1*TSP/n*(crt<.1*TSP/n)+(crt>=.1*TSP/n)*crt*(crt<=6*TSP/n)+6*TSP/n*(crt>6*TSP/n);
                %disp([2,nc,crt])
                ne=nc;nc=0;
            end
%       figure(3),clf    
%       bar(f1,f2)
%       axis tight
%       pause(.1)
            if tsp(v1)<tsp(v1-1)
                x0=Xm;x0(n+1,:)=[];
                for i=5:-1:2
                    X(:,:,i)=X(:,:,i-1);tp(i)=tp(i-1);
                end
                X(:,:,1)=x0;tp(1)=tsp(v1);rep=0;
            elseif mod(v1,30)==0
                X(:,:,5)=x1;tp(5)=TSP;
            end
            rep=rep+1;v1=v1+1;tsp(v1)=tsp(v1-1);
            disp([v1-2,tsp(v1),crt,ne])
            if tsp(v1)<tsp(v1-2) || v1<=3
                figure(2),clf
                plot(x0(:,1),x0(:,2),'o','markersize',7,'markerfacecolor','g','markeredgecolor','r','linewidth',1.5)
                text(x0(:,1)-.0075*rx,x0(:,2)+.017*ry,str,'fontsize',8,'fontweight','b')
                hold on
                plot(Xm(:,1),Xm(:,2),'c-','linewidth',2.5)
                plot(Xm(:,1),Xm(:,2),'b-','linewidth',.5)
                title(['tsp=',num2str(tsp(v1))],'fontsize',14)
                axis tight
                pause(.1)
            end
        end
        t2=toc(t1)
        disp(tsp(v1))
        figure(1),clf
        x0=Xm;x0(n+1,:)=[];
        plot(x0(:,1),x0(:,2),'o','markersize',7,'markerfacecolor','c','markeredgecolor','r','linewidth',1.5)
        text(x0(:,1)-.0075*rx,x0(:,2)+.015*ry,str,'fontsize',10,'fontweight','b')
        hold on
        plot(Xm(:,1),Xm(:,2),'g-','linewidth',2.5)
        plot(Xm(:,1),Xm(:,2),'b-','linewidth',.5)
        title(['tsp=',num2str(tsp(v1))],'fontsize',16)
        axis tight
        tm(ii)=t2; tpm(ii)=tsp(v1);
        if tpm(ii)<tsm,tsm=tpm(ii);xm=x0;end   
    end
end
