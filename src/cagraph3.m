colo(1,1)='b';colo(1,2)='b';
colo(2,1)='g';colo(2,2)='g';
colo(3,1)='c';colo(3,2)='c';
colo(4,1)='r';colo(4,2)='r';
colo(5,1)='m';colo(5,2)='m';
colo(6,1)='y';colo(6,2)='y';
colo(7,1)='k';colo(7,2)='k';
colo(8,1)='b';colo(8,2)='b';
colo(9,1)='g';colo(9,2)='g';
colo(10,1)='c';colo(10,2)='c';
colo(11,1)='r';colo(11,2)='r';
colo(12,1)='m';colo(12,2)='m';
colo(13,1)='y';colo(13,2)='y';
colo(14,1)='k';colo(14,2)='k';
colo(15,1)='b';colo(15,2)='g';
colo(16,1)='g';colo(16,2)='c';
colo(17,1)='c';colo(17,2)='r';
colo(18,1)='r';colo(18,2)='m';
colo(19,1)='m';colo(19,2)='y';
colo(20,1)='y';colo(20,2)='k';
colo(21,1)='k';colo(21,2)='b';
colo(22,1)='b';colo(22,2)='c';
colo(23,1)='g';colo(23,2)='r';
colo(24,1)='c';colo(24,2)='m';
colo(25,1)='r';colo(25,2)='y';
colo(26,1)='m';colo(26,2)='k';
colo(27,1)='y';colo(27,2)='b';
colo(28,1)='k';colo(28,2)='g';
colo(29,1)='b';colo(29,2)='r';
colo(30,1)='g';colo(30,2)='m';
colo(31,1)='c';colo(31,2)='y';
colo(32,1)='r';colo(32,2)='k';
colo(33,1)='m';colo(33,2)='b';
colo(34,1)='y';colo(34,2)='g';
colo(35,1)='k';colo(35,2)='c';
colo(36,1)='b';colo(36,2)='m';
colo(37,1)='g';colo(37,2)='y';
colo(38,1)='c';colo(38,2)='k';
colo(39,1)='r';colo(39,2)='b';
colo(40,1)='m';colo(40,2)='g';
colo(41,1)='y';colo(41,2)='c';
colo(42,1)='k';colo(42,2)='r';
mk(1:7)='o';mk(8:14)='s';mk(15:21)='p';mk(22:28)='^';
mk(29:35)='d';mk(36:42)='h';
hold off
plot(x1(:,1),x1(:,2),'o')
hold on
for i=1:g
    for l=1:n
        if sum(abs(ym(l,:,i)))>0
            plot(x1(l,1),x1(l,2),mk(i),'markerfacecolor',colo(i,1),'markeredgecolor',colo(i,2),'linewidth',2.5)
            text(x1(l,1),x1(l,2)+.015*r3,num2str(l),'fontsize',10,'fontweight','b')
        end
    end
end
