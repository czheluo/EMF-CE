x(n+1,:)=[];B=[x;x];
in=fix(random('unif',.3*n,.7*n,1));
x=B(in:in+n-1,:); x(n+1,:)=x(1,:);
Td=0; d=pdist2(x,x);d=round(d);
for i=1:n
    Td=Td+d(i,i+1);
end
TSP=Td;