%Logistic map
% X_{k+1}=alpha*X_{k}*(1-X_{k})

clc
clear
close all

xvals=[];
%Ciclo sui alpha perchè voglio cambiare coefficiente ogni volta
for alpha=1:0.01:4
    oldx=0.5;
    %Transient
    for i=1:2000
        newx=alpha*(oldx-oldx^2);
        %Itero
        oldx=newx;
    end
    sensibility=newx;
    for i=1:2000
        newx=alpha*(oldx-oldx^2);
        oldx=newx;
        xvals(1,length(xvals)+1)=alpha;
        xvals(2,length(xvals))=newx;
        if (abs(newx-sensibility)<0.001)
            break
        end
    end
end

%plotto la mappa logistica
figure
plot(xvals(1,:),xvals(2,:),'.','markersize',0.01,'color','b')
set(gca,'color','k')
title('Logistic Map')
xlabel('\alpha')
ylabel('x')