function [Fsy,Mz,v,x]=xb(L,F,q,M,E,I)
%计算左端悬臂梁的剪力、弯矩、挠度
x=0:0.01:L;
[~,Fnum]=size(F);
[~,qnum]=size(q);
Fsy=zeros(1,length(x));
Mz=zeros(1,length(x));
v=zeros(1,length(x));

% %计算固定端约束力Fy,M0
% F1=0;
% for k=1:qnum
%     F1=F1+(q(2,k)-q(1,k))*q(3,k);
% end
% Fy=-sum(F(1,:))-F1;
% M1=0;
% M2=0;
% for k=1:qnum
%     M1=M1+(q(2,k)-q(1,k))^2*q(3,k)*0.5;
% end
% for k=1:Fnum
%     M2=M2+F(1,k)*F(2,k);
% end
% M0=-M1-M2-sum(M(1,:));
% F=[F(1,:),Fy;F(2,:),0];
% M=[M(1,:),M0;M(2,:),0];
[~,Fnum]=size(F);
[~,Mnum]=size(M);

%计算集中力F导致的Fsy、Mz
for k=1:Fnum
    for m=1:length(x)
        if x(m)<F(2,k)
        Fsy(m)=Fsy(m)+F(1,k);
        Mz(m)=Mz(m)+F(1,k)*(F(2,k)-x(m));
        end
    end
end

%计算分布力q导致的Fsy、Mz、v
for k=1:qnum
    for m=1:length(x)
        if (q(1,k)<=x(m))&&(x(m)<=q(2,k))
            Fsy(m)=Fsy(m)+q(3,k)*(q(2,k)-x(m));
            Mz(m)=Mz(m)+q(3,k)*((q(2,k)-x(m))^2)*0.5;
        elseif x(m)<q(1,k)
            Fsy(m)=Fsy(m)+q(3,k)*(q(2,k)-q(1,k));
            Mz(m)=Mz(m)+q(3,k)*(q(2,k)-q(1,k))*((q(2,k)+q(1,k))/2-x(m));
        elseif x(m)>q(2,k)
            Mz(m)=Mz(m);
            Fsy(m)=Fsy(m);
        end
    end
end

%计算集中力偶导致的Mz
for m=1:length(x)
    for k=1:Mnum
        if M(2,k)>=x(m)
            Mz(m)=Mz(m)+M(1,k);
        end
    end
end
% Mz=-Mz;
% Fsy=-Fsy;

%计算挠度
n=ceil(L*100);
A=zeros(n+2,n+2);
v=[0,v];
for p=1:n
    A(p,p)=1;
    A(p,p+1)=-2;
    A(p,p+2)=1;
end
A(n+1,2)=1;
A(n+2,1)=1;
A(n+2,3)=-1;
B=[Mz(1:(end-1)),0,0];
B=(1/100)^2/(E*I)*B;
B=B';
v=A\B;
v=v(2:end);
v=v';


% %画出剪力图
% subplot(3,1,1);
% hold on;
% plot(x,Fsy);
% title('剪力图');
% ax = gca;
% ax.XAxisLocation = 'origin';%规定x轴为原点位置
% 
% 
% %画出弯矩图
% subplot(3,1,2);
% plot(x,Mz);
% title('弯矩图');
% ax = gca;
% ax.XAxisLocation = 'origin';%规定x轴为原点位置
% 
% 
% %画出挠曲线
% subplot(3,1,3);
% plot(x,v);
% title('挠度曲线');
% ax = gca;
% ax.XAxisLocation = 'origin';%规定x轴为原点位置
% 

end