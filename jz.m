function [Fsy,Mz,v,x]=jz(a,b,L,F,q,M,E,I)
%计算简支梁的剪力、弯矩、挠度
x=0:0.01:L;
[~,Fnum]=size(F);
[~,qnum]=size(q);
[~,Mnum]=size(M);
Fsy=zeros(1,length(x));
Mz=zeros(1,length(x));
v=zeros(1,length(x));

%计算固定端约束力F1,F2
M1=0;
M2=0;
F0=0;
for k=1:Fnum
    if F(2,k)<a
        M1=M1-F(1,k)*(a-F(2,k));
    elseif F(2,k)>a
        M1=M1+F(1,k)*(F(2,k)-a);
    end
end
for k=1:qnum
    if (q(1,k)+q(2,k))/2<a
        M2=M2-(q(2,k)-q(1,k))*q(3,k)*(a-(q(1,k)+q(2,k))/2);
    elseif (q(1,k)+q(2,k))/2>a
        M2=M2+(q(2,k)-q(1,k))*q(3,k)*((q(1,k)+q(2,k))/2-a);
    end
end
F2=(-M1-M2-sum(M(1,:)))/(b-a);
for k=1:qnum
    F0=F0+(q(2,k)-q(1,k))*q(3,k);
end
F1=-sum(F(1,:))-F0-F2;

F=[F(1,:),F1,F2;F(2,:),a,b];
[~,Fnum]=size(F);

%计算集中力F导致的Fsy、Mz
for m=1:length(x)
    for k=1:Fnum
        if x(m)>=F(2,k)
        Fsy(m)=Fsy(m)+F(1,k);
        Mz(m)=Mz(m)-F(1,k)*(x(m)-F(2,k));
        end
    end
end

%计算分布力q导致的Fsy、Mz
for k=1:qnum
    for m=1:length(x)
        if (q(1,k)<=x(m))&&(x(m)<q(2,k))
            Fsy(m)=Fsy(m)+q(3,k)*(x(m)-q(1,k));
            Mz(m)=Mz(m)-q(3,k)*((x(m)-q(1,k))^2)*0.5;
        elseif x(m)>=q(2,k)
            Fsy(m)=Fsy(m)+q(3,k)*(q(2,k)-q(1,k));
            Mz(m)=Mz(m)-q(3,k)*(q(2,k)-q(1,k))*(x(m)-(q(2,k)+q(1,k))/2);
        end
    end
end

%计算集中力偶导致的Mz
for m=1:length(x)
    for k=1:Mnum
        if M(2,k)<=x(m)
            Mz(m)=Mz(m)+M(1,k);
        end
    end
end

Mz=-Mz;
Fsy=-Fsy;
%计算挠度
n=ceil(L*100);
A=zeros(n+1,n+1);
for p=1:n-1
    A(p,p)=1;
    A(p,p+1)=-2;
    A(p,p+2)=1;
end
A(n,(a*100+1))=1;
A(n+1,(b*100+1))=1;
B=[Mz(2:(end-1)),0,0];
B=(1/100)^2/(E*I)*B;
B=B';
v=A\B;
v=v';
% %画出剪力图
% subplot(3,1,1);
% hold on;
% plot(x,Fsy);
% % title('剪力图');
% ax = gca;
% ax.XAxisLocation = 'origin';%规定x轴为原点位置
% 
% 
% %画出弯矩图
% subplot(3,1,2);
% hold on
% plot(x,Mz);
% % title('弯矩图');
% ax = gca;
% ax.XAxisLocation = 'origin';%规定x轴为原点位置
% 
% 
% %画出挠曲线
% subplot(3,1,3);
% plot(x,v);
% % title('挠度曲线');
% ax = gca;
% ax.XAxisLocation = 'origin';%规定x轴为原点位置

end