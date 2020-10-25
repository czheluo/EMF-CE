clear,clc
x=xlsread('md','sheet4','a1:b1000');
%a=x';
%b=reshape(a,2,500);
%c=b';
a=x(:,1);x(:,1)=[];
me=mean(x), md=median(x)
n=length(x)
iv=.75;
g=0:iv:30;
m=length(g);g(m+1)=g(m)+iv;f=zeros(1,m);
for l=1:n
    for i=1:m
        if x(l)>=g(i) && x(l)<g(i+1)
            f(i)=f(i)+1;
        end
    end
end
f(m)=n-sum(f(1:m-1))
figure(2),clf,hold on
for i=1:m
    plot([g(i),g(i),g(i+1),g(i+1)],[0,f(i),f(i),0],'b-','linewidth',2.5)    
end
plot([g(end),g(end)+iv],[0,0],'b-','linewidth',2.5)
axis([-.1,32,0,580])
plot([me,me],[0,80],'r-','linewidth',3)
text(me-1,90,'mean','fontsize',12)
plot([md,md],[0,130],'g-','linewidth',3)
text(md-.4,140,'median','fontsize',12)
text(5,465,['mean cputime me=',num2str(me)],'fontsize',14)
text(5,425,['median cputime md=',num2str(md)],'fontsize',14)
text(3,520,'the distribution of cputime of 1000 replicates for eil51','fontsize',15) 
text(g(end)-.5*iv,f(end)+5,'*','fontsize',15)