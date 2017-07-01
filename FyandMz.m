function varargout = FyandMz(varargin)
% FYANDMZ MATLAB code for FyandMz.fig
%      FYANDMZ, by itself, creates a new FYANDMZ or raises the existing
%      singleton*.
%
%      H = FYANDMZ returns the handle to a new FYANDMZ or the handle to
%      the existing singleton*.
%
%      FYANDMZ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FYANDMZ.M with the given input arguments.
%
%      FYANDMZ('Property','Value',...) creates a new FYANDMZ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FyandMz_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FyandMz_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FyandMz

% Last Modified by GUIDE v2.5 19-Jun-2017 15:35:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FyandMz_OpeningFcn, ...
                   'gui_OutputFcn',  @FyandMz_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before FyandMz is made visible.
function FyandMz_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FyandMz (see VARARGIN)

% Choose default command line output for FyandMz
if exist('Iz.mat','file')
    delete('Iz.mat');
end
if exist('Iz2.mat','file')
    delete('Iz2.mat');
end
handles.output = hObject;
handles.Iz=0;
handles.v=[];
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FyandMz wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FyandMz_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function left_simplysupportedbeam_CreateFcn(hObject, eventdata, handles)
% hObject    handle to left_simplysupportedbeam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over axes background.
function moudel_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to moudel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function shearforcediagram_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shearforcediagram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate shearforcediagram



% --- Executes during object creation, after setting all properties.

% hObject    handle to bendingmonentdiagram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate bendingmonentdiagram
grid on


% --- Executes during object creation, after setting all properties.
function bendingmonentdiagram_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bendingmonentdiagram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate bendingmonentdiagram
grid on


% --------------------------------------------------------------------
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Iz=handles.Iz;
if exist('Iz2.mat','file')
    load Iz2;
    Iz=Iz;
    delete('Iz2.mat');
    flag=1;
    Iz=Iz*1e-12;
end

if Iz==0
    errordlg('请先输入Iz');
    beep;
    return;
end
if isempty(Iz)
    errordlg('请先输入Iz');
    beep;
    return;
end
I=Iz;
set(handles.Izsituation,'string',strcat('Iz:',num2str(roundn((Iz)*10^6,-3)),'x10^6 mm^4'));
situation=handles.situation;
LOC1=handles.LOC1;
LOC2=handles.LOC2;
M_clockwise=handles.M_clockwise;
M_anticlockwise=handles.M_anticlockwise;
F_down=handles.F_down;
F_up=handles.F_up;
Q=handles.Q;
Dot=handles.Dot;
up=handles.up;
down=handles.down;
if situation==0
    errordlg('请先选择杆');
    beep
    return;
end
if isempty(M_clockwise)
    M_clockwise=[0,LOC1];
end
if isempty(M_anticlockwise)
    M_anticlockwise=[0,LOC1];
end
if isempty(F_down)
   F_down=[0,LOC1];
end
if isempty(F_up)
    F_up=[0,LOC1];
end
% if isempty(Q)
%     Q=[0,0,0];
% end
if isempty(up)
    up=[0,LOC1,LOC1];
end
if isempty(down)
    down=[0,LOC1,LOC1];
end

prompt={'请输入杨氏模量大小（GPa):'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'80'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %确保取消不报错
 end
E = str2double(xyz{1})*10e9;                                                     %获取数值。若为非法输入即得NaN输出
axes(handles.shearforcediagram)
cla reset
axes(handles.bendingmonentdiagram)
cla reset
%以下为正式运算

L=LOC2-LOC1;
F_down(:,1)=-F_down(:,1);
M_clockwise(:,1)=-M_clockwise(:,1);
down(:,1)=-down(:,1);
F=[F_up;F_down];
M=[M_clockwise;M_anticlockwise];
q=[up;down];
M=M';
F=F';
q=q';
F(2,:)=F(2,:)-LOC1;
M(2,:)=M(2,:)-LOC1;
q(3,:)=q(3,:)-LOC1;
q(2,:)=q(2,:)-LOC1;
q=[q(2,:);q(3,:);q(1,:)];



if situation==1
    [Fsy,Mz,v,x]=xb(L,F,q,M,E,I);
elseif situation==2
    F(2,:)=L-F(2,:);
    M(2,:)=L-M(2,:);
    M(1,:)=-M(1,:);
    q0(1,:)=L-q(2,:);
    q0(2,:)=L-q(1,:);
    q0(3,:)=q(3,:);
    [Fsy,Mz,v,x]=xb(L,F,q0,M,E,I);
    Fsy=fliplr(Fsy);
    Mz=fliplr(Mz);
    v=fliplr(v);
elseif situation==3
     [Fsy,Mz,v,x]=jz(0,L,L,F,q,M,E,I);
elseif situation==4
    a=0;
    b=Dot(2)-LOC1;
    L=Dot(3)-LOC1;
    [Fsy,Mz,v,x]=jz(a,b,L,F,q,M,E,I);
elseif situation==5
    Dot=Dot-LOC1;
    a=Dot(2);
    b=Dot(3);
    [Fsy,Mz,v,x]=jz(a,b,L,F,q,M,E,I);
elseif situation==6
    Dot=Dot-LOC1;
    a=Dot(2);
    b=Dot(3);
    [Fsy,Mz,v,x]=jz(a,b,L,F,q,M,E,I);
end
handles.v=v;
handles.Mz=Mz;
handles.Fsy=Fsy;
guidata(hObject, handles);
%以下为画图
x=x+LOC1;
    axes(handles.shearforcediagram)
    plot(x,1*Fsy,'k','linewidth',1);
    hold on
    ax = gca;
    ax.XAxisLocation = 'origin';%规定x轴为原点位置
    set(gca,'YLim',[-max(abs(min(Fsy)-abs(min(Fsy)).*0.75-10),abs(max(Fsy)+abs(max(Fsy)).*0.75+10)),max(abs(min(Fsy)-abs(min(Fsy)).*0.75-10),abs(max(Fsy)+abs(max(Fsy)).*0.75+10))]);
    Fsy(2,:)=LOC1:0.01:LOC2;
    for ii =x(1):0.5:x(end)
        a=find(abs(x-ii)<realmin);
        b=find(abs(Fsy(2,:)-ii)<realmin);
        c=x(a);
        d=Fsy(1,b);
        cc=[c,c];
        dd=[0,d];
        plot(cc,dd,'k','linewidth',1.5);
    end
    zz=find(abs(Fsy(1,:)-max(abs(Fsy(1,:))))<realmin);
    if ~isempty(zz)
      zz=zz(1);
    end

    zzz=find(abs(Fsy(1,:)+max(abs(Fsy(1,:))))<realmin);
   if ~isempty(zzz)
      zzz=zzz(1);
    end
if isempty(zz)
    zz=0;
end
if isempty(zzz)
    zzz=0;
end
zmax=zz+zzz;
zzmax=Fsy(2,zmax);
if v(zmax)~=0
    text(zzmax,Fsy(1,zmax),strcat(num2str(Fsy(1,zmax)/1000),'KN'));
end
   % axis equal
    axes(handles.bendingmonentdiagram)
    plot(x,1.00*Mz,'k','linewidth',1);
    hold on
    ax = gca;
    ax.XAxisLocation = 'origin';%规定x轴为原点位置
    set(gca,'YLim',[-max(abs(min(Mz)-abs(min(Mz)).*0.75-10),abs(max(Mz)+abs(max(Mz)).*0.75+10)),max(abs(min(Mz)-abs(min(Mz)).*0.75-10),abs(max(Mz)+abs(max(Mz)).*0.75+10))]);
    Mz(2,:)=LOC1:0.01:LOC2;
    for ii =x(1):0.5:x(end)
        a=find(abs(x-ii)<realmin);
        b=find(abs(Mz(2,:)-ii)<realmin);
        a=double(a);
        c=x(a);d=Mz(1,b);cc=[c,c];dd=[0,d];
        plot(cc,dd,'k','linewidth',1.5);
    end
zz=find(abs(Mz(1,:)-max(abs(Mz(1,:))))<realmin);
    if ~isempty(zz)
      zz=zz(1);
    end

    zzz=find(abs(Mz(1,:)+max(abs(Mz(1,:))))<realmin);
   if ~isempty(zzz)
      zzz=zzz(1);
   end
if max(abs(Mz))==0
    zz=0;zzz=0;
end
if isempty(zz)
    zz=0;
end
if isempty(zzz)
    zzz=0;
end
zmax=zz+zzz;
if zmax==0
    zmax=1;
end
zzmax=Mz(2,zmax);
if v(zmax)~=0
    text(zzmax,Mz(1,zmax),strcat(num2str(Mz(1,zmax)/1000),'KN.m'));
end
   % axis equal
    axes(handles.moudel)
    beishu=(log10(max(abs(max(v)),abs(min(v)))));
    vv=(v*10^(0.4+abs(beishu)));
   % vv=(vv*(abs(beishu)./2))/2;
%    vv=v*1/abs(beishu);
% vv=zeros(size(v));
% [~,sizev]=size(v);
% for ii=1:sizev
%     if v(ii)>0
%         vv(ii)=-1/log10(v(ii));
%     elseif v(ii)<0
%         vv(ii)=1/log10(-v(ii));
%     end
% end
    plot(x,vv+5.00,'linewidth',2);
    hold on
    if max(abs(v))==0
        pp=0;ppp=0;
    else
        pp=find(abs(v-max(abs(v)))<realmin);
        ppp=find(abs(v+max(abs(v)))<realmin);
    end
if isempty(pp)
    pp=0;
end
if isempty(ppp)
    ppp=0;
end
xmax=pp+ppp;
if xmax==0;
    xmax=100;
end
xxmax=Fsy(2,xmax);
if v(xmax)~=0
   %text(xxmax,v(xmax)*10^(0.1+abs(beishu))+5.00,strcat(num2str(v(xmax)*10^2),'mm'));
   text(xxmax,vv(xmax)+5.00,strcat(num2str(v(xmax)*10^2),'mm'));
end

    %axis equal
 if LOC2<=9
    set(gca,'XLim',[0 10]);
    set(gca,'YLim',[0 10]);
 elseif LOC2>9
    set(gca,'XLim',[0 LOC2+1]);

    set(gca,'XTick',0:1:LOC2+1);
 end    
 
 Mz2=Mz;
 Fsy2=Fsy;
 handles.Mz2=Mz2;
 handles.Fsy2=Fsy2;
 handles.Iz=Iz;
 guidata(hObject,handles);
%以上为正式运算


% --------------------------------------------------------------------
function resetalldata_Callback(hObject, eventdata, handles)
% hObject    handle to resetalldata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.moudel)
cla reset
grid on
set(gca,'XLim',[0,10]);
set(gca,'YLim',[0,10]);
axes(handles.shearforcediagram)
cla reset
grid on
axes(handles.bendingmonentdiagram)
cla reset
grid on

axes(handles.shearforcediagram)
cla reset
grid on
axes(handles.bendingmonentdiagram)
cla reset
grid on
situation=0;                                                               %设立杆的flag
LOC1=0;                                                                    %预定义杆两端位置
LOC2=0;
F_down=[];                                                                 %预定义外加集中力,设向下力为正，向上力为负，顺时针力偶为正，向下分布力为正
F_up=[];  
M_clockwise=[];
M_anticlockwise=[];
Q=[];
down=[];
up=[];
Dot=[];      %力的分段
Mz2=[];
Fsy2=[];
v=[];
Mz=[];
Fsy=[];
Iz=[];
I=[];
handles.Iz=Iz;
handles.Fsy=Fsy;
handles.Mz=Mz;
handles.v=v;
handles.situation=situation;
handles.LOC1=LOC1;
handles.LOC2=LOC2;
handles.M_clockwise=M_clockwise;
handles.M_anticlockwise=M_anticlockwise;
handles.F_down=F_down;
handles.F_up=F_up;
handles.Q=Q;
handles.Dot=Dot;
handles.up=up;
handles.down=down;
handles.Mz2=Mz2;
handles.Fsy2=Fsy2;
handles.I=I;
    set(handles.Izsituation,'string','');
    set(handles.value_v,'string','');
    set(handles.value_mz,'string','');
    set(handles.value_fsy,'string','');
    set(handles.xloc,'string','');
guidata(hObject, handles);
% --------------------------------------------------------------------
function help_Callback(hObject, eventdata, handles)
% hObject    handle to help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function left_fixedend_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to left_fixedend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
situation=handles.situation;
LOC1=handles.LOC1;
LOC2=handles.LOC2;
Dot=handles.Dot;
if ~(situation==0)
    errordlg('只能输入一根梁')
    return
end


prompt={'请输入悬臂长度：单位：m'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'7'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,y1,l_leftfixedend值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
x1 = 1;                                                   %获取数值。若为非法输入即得NaN输出
y1 = 5;
l_leftfixedend = str2double(xyz{1})*1;
if ~(l_leftfixedend>0)||(isnan(l_leftfixedend))%(~(x1>=30&&x1<1000&&(x1+l_leftfixedend)<=1000&&y1>=180&&y1<=820&&l_leftfixedend>0&&l_leftfixedend<=900))||(isnan(x1))||(isnan(y1))||(isnan(l_leftfixedend))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    situation=1;handles.situation=situation;
    axes(handles.moudel);
    hold on
    %axis equal
    % piczeros=ones(500,500).*255;
    % for kk=1:3
    %     for ii=x1-29:x1
    %     for jj=y1-179:y1+180
    %         piczeros(ii,jj)=pic1(jj-y1+180,ii-x1+30);
    %     end
    %     end
    % end
    % imshow(piczeros);
    %imshow('左悬臂梁.jpg');
    axis on
    x=[x1:0.01:x1+l_leftfixedend];
    y=ones(1,length(x)).*y1;
    plot(x,y,'k','LineWidth',3);
    y11=4.15:0.1:5.85;
    x11=x1.*ones(length(y11));
    plot(x11,y11,'k','Linewidth',3.5);
    if l_leftfixedend>5%防止杆长过小时图像变形
        x111=x1-0.08*l_leftfixedend:0.1:x1;
    elseif l_leftfixedend<=5
        x111=x1-0.33:0.1:x1;
    end
    %x111=x1-0.08*l_leftfixedend:0.1:x1;
    k=405/100:30/100:575/100;  
    for ii=1:length(k)    
        y111=0;
        y111=0.3*x111+k(ii);
        plot(x111,y111,'k','Linewidth',1);
    end
   if x1+l_leftfixedend+1>10
       set(gca,'XLim',[0 x1+l_leftfixedend+1]);
       set(gca,'YLim',[0 10]);
       set(gca,'XTick',0:1:x1+l_leftfixedend+1);
   elseif x1+l_leftfixedend+1<=10
        set(gca,'XLim',[0 10]);
        set(gca,'YLim',[0 10]);
       
   end
end
LOC1=x1;
LOC2=x1+l_leftfixedend;
handles.LOC1=LOC1;
handles.LOC2=LOC2;
Dot=[x1;x1+l_leftfixedend];
handles.Dot=Dot;
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
situation=0;                                                               %设立杆的flag
LOC1=0;                                                                    %预定义杆两端位置
LOC2=0;
F_down=[];                                                                 %预定义外加集中力,设向下力为正，向上力为负，顺时针力偶为正，向下分布力为正
F_up=[];  
M_clockwise=[];
M_anticlockwise=[];
Q=[];
down=[];
up=[];
Dot=[];  
v=[];%力的分段
Mz2=[];
Fsy2=[];
handles.situation=situation;
handles.LOC1=LOC1;
handles.LOC2=LOC2;
handles.M_clockwise=M_clockwise;
handles.M_anticlockwise=M_anticlockwise;
handles.F_down=F_down;
handles.F_up=F_up;
handles.Q=Q;
handles.Dot=Dot;
handles.up=up;
handles.down=down;
handles.v=v;
handles.Mz2=Mz2;
handles.Fsy2=Fsy2;
guidata(hObject, handles);


% --------------------------------------------------------------------
function right_fixedend_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to right_fixedend (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
situation=handles.situation;
LOC1=handles.LOC1;
LOC2=handles.LOC2;
Dot=handles.Dot;

if ~(situation==0)
    errordlg('只能输入一根梁')
    return
end


prompt={'请输入悬臂长度：单位：m'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'7'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,y1,x2,y2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
x1 = 1+1*str2double(xyz{1});                                                   %获取数值。若为非法输入即得NaN输出
y1 = 5;
l_rightfixedend = 1*str2double(xyz{1});
if  ~(l_rightfixedend>0)||(isnan(l_rightfixedend))                         %(~(x1>0&&x1<=970&&(x1-l_rightfixedend)>0&&y1>=180&&y1<=820&&l_rightfixedend>0&&l_rightfixedend<970))||(isnan(x1))||(isnan(y1))||(isnan(l_rightfixedend))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    situation=2;handles.situation=situation;
    axes(handles.moudel);
    hold on
    %axis equal
    % piczeros=ones(500,500).*255;
    % for kk=1:3
    %     for ii=x1-29:x1
    %     for jj=y1-179:y1+180
    %         piczeros(ii,jj)=pic1(jj-y1+180,ii-x1+30);
    %     end
    %     end
    % end
    % imshow(piczeros);
    %imshow('右悬臂梁.jpg');
    axis on
    x=[x1:-0.01:x1-l_rightfixedend];
    y=ones(1,length(x)).*y1;
    plot(x,y,'k','LineWidth',3);
    y11=4.15:0.1:5.85;
    x11=x1.*ones(length(y11));
    plot(x11,y11,'k','Linewidth',3.5);
    if l_rightfixedend>5
        x111=x1:0.1:x1+0.08*l_rightfixedend;
    elseif l_rightfixedend<=5
        x111=x1:0.1:x1+0.33;
    end
    k=405/100:30/100:575/100;  
    for ii=1:length(k)    
        y111=0;
        y111=-0.3*(x111-x1)+k(ii)+20/100;
        plot(x111,y111,'k','Linewidth',1);
    end
if x1>9
       set(gca,'XLim',[0 x1+1]);
       set(gca,'YLim',[0 10]);
       set(gca,'XTick',0:1:x1+1);
   elseif x1<=9
        set(gca,'XLim',[0 10]);
        set(gca,'YLim',[0 10]);
       
   end
end
grid on
LOC1=x1-l_rightfixedend;
LOC2=x1;
Dot=[x1-l_rightfixedend,x1];
handles.LOC1=LOC1;
handles.LOC2=LOC2;
handles.Dot=Dot;

guidata(hObject, handles);


% --------------------------------------------------------------------
function simplysupportedbeam_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to simplysupportedbeam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
situation=handles.situation;
LOC1=handles.LOC1;
LOC2=handles.LOC2;
Dot=handles.Dot;
if ~(situation==0)
    errordlg('只能输入一根梁');
    return
end


prompt={'请输入杆长：单位：m'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'8'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
x1 = 1;      
y1 = 5;                                                   %获取数值。若为非法输入即得NaN输出
x2 = 1+1*str2double(xyz{1});

if  (~(x2>0))||(isnan(x2))                                                 %(~((x1>=0)&&(x1<x2)&&(x2<=1000)&&(y1>0)&&(y1<1000)))||(isnan(x1))||(isnan(x2))||(isnan(y1))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    situation=3;
    handles.situation=situation;
    axes(handles.moudel);
    hold on
    %axis equal
    x=[x1:0.01:x2];
    y=ones(1,length(x)).*y1;
    plot(x,y,'k','LineWidth',3);
 %以下画固定端
    xx=[x1-30/100,x1-20/100,x1,x1+20/100,x1-19/100,x1+30/100];
    yy=[y1-30/100,y1-30/100,y1,y1-30/100,y1-30/100,y1-30/100,];
    yyy=[y1-60/100:0.01:y1-30/100];
    k=[x1-2.60:0.12:x1-2.10];
    plot(xx,yy,'k','Linewidth',2.5);
    for ii=1:length(k)
       xxx=yyy./2+k(ii);
       plot(xxx,yyy,'k','Linewidth',2);
    end
%以上画固定端
%以下画滚动支座
    xx1=[x2-30/100,x2-20/100,x2,x2+20/100,x2-19/100,x2+30/100];
    yy1=[y1-30/100,y1-30/100,y1,y1-30/100,y1-30/100,y1-30/100,];
    plot(xx1,yy1,'k','Linewidth',2.5);
    alpha=0:pi/40:2*pi;
    xxx1=0.10*cos(alpha)+x2-20/100;
    yyy1=0.10*sin(alpha)+y1-45/100;
    plot(xxx1,yyy1,'k','linewidth',1.5);
    xxx2=0.10*cos(alpha)+x2+20/100;
    yyy2=0.10*sin(alpha)+y1-45/100;
    plot(xxx2,yyy2,'k','linewidth',1.5);   
 %以上为画滚动支座
 if x2<=9
    set(gca,'XLim',[0 10]);
    set(gca,'YLim',[0 10]);
 elseif x2>9
    set(gca,'XLim',[0 x2+1]);
    set(gca,'YLim',[0 10]);

    set(gca,'XTick',0:1:x2+1);
 end
end
LOC1=x1;
LOC2=x2;
Dot=[x1,x2];
handles.LOC1=LOC1;
handles.LOC2=LOC2;
handles.Dot=Dot;
guidata(hObject, handles);



function test_Callback(hObject, eventdata, handles)
% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of test as text
%        str2double(get(hObject,'String')) returns contents of test as a double


% --- Executes during object creation, after setting all properties.
function test_CreateFcn(hObject, eventdata, handles)
% hObject    handle to test (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function right_overhangingbeam_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to right_overhangingbeam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
situation=handles.situation;
LOC1=handles.LOC1;
LOC2=handles.LOC2;
Dot=handles.Dot;
if ~(situation==0)
    errordlg('只能输入一根梁');
    return
end


prompt={'请输入第一段长度：单位：m','请输入第二段长度：单位：m'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'2','4'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
x1 = 1;      
y1 = 5;                                                   %获取数值。若为非法输入即得NaN输出
x2 = 1*str2double(xyz{1})+1;
l  = 1*(str2double(xyz{2})+str2double(xyz{1}));
if (~(x2>1)&&(l>(x2-1)))||(isnan(x2))||(isnan(l))%(~((x1>=0)&&(x1<x2)&&(x2<=10)&&(y1>0)&&(y1<10)&&(l>0)&&(l<=10)&&((x1+l)>0)&&((x1+l)<=10)))||(isnan(x1))||(isnan(x2))||(isnan(y1))||(isnan(l))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    situation=4;
    handles.situation=situation;
    axes(handles.moudel);
    hold on
    %axis equal
    x=[x1:0.01:x1+l];
    y=ones(1,length(x)).*y1;
    plot(x,y,'k','LineWidth',3);
    %以下画固定端
    xx=[x1-30/100,x1-20/100,x1,x1+20/100,x1-19/100,x1+30/100];
    yy=[y1-30/100,y1-30/100,y1,y1-30/100,y1-30/100,y1-30/100,];
    yyy=[y1-60/100:0.01:y1-30/100];
    k=[x1-2.60:0.12:x1-2.10];
    plot(xx,yy,'k','Linewidth',2.5);
    for ii=1:length(k)
       xxx=yyy./2+k(ii);
       plot(xxx,yyy,'k','Linewidth',2);
    end
%以上画固定端
%以下画滚动支座
    xx1=[x2-30/100,x2-20/100,x2,x2+20/100,x2-19/100,x2+30/100];
    yy1=[y1-30/100,y1-30/100,y1,y1-30/100,y1-30/100,y1-30/100];
    plot(xx1,yy1,'k','Linewidth',2.5);
    alpha=0:pi/40:2*pi;
    xxx1=0.10*cos(alpha)+x2-20/100;
    yyy1=0.10*sin(alpha)+y1-45/100;
    plot(xxx1,yyy1,'k','linewidth',1.5);
    xxx2=0.10*cos(alpha)+x2+20/100;
    yyy2=0.10*sin(alpha)+y1-45/100;
    plot(xxx2,yyy2,'k','linewidth',1.5);   
 %以上为画滚动支座   
 if (l+1)<=9
    set(gca,'XLim',[0 10]);
    set(gca,'YLim',[0 10]);
 elseif (l+1)>9
    set(gca,'XLim',[0 l+1+1]);
    set(gca,'YLim',[0 10]);

    set(gca,'XTick',0:1:l+1+1);
 end
end
LOC1=x1;
LOC2=x1+l;
handles.LOC1=LOC1;
handles.LOC2=LOC2;
Dot=[x1,x2,x1+l];
handles.Dot=Dot;
guidata(hObject, handles);


% --------------------------------------------------------------------
function left_overhangingbeam_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to left_overhangingbeam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
situation=handles.situation;
LOC1=handles.LOC1;
LOC2=handles.LOC2;
Dot=handles.Dot;
if ~(situation==0)
    errordlg('只能输入一根梁');
    return
end


prompt={'请输入第一段长度：单位：m)','请输入第二段长度：单位：m'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'3','2'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
x1 = str2double(xyz{1})+1;      
y1 = 5;                                                   %获取数值。若为非法输入即得NaN输出
x2 = str2double(xyz{2})+str2double(xyz{1})+1;
l  = str2double(xyz{2})+str2double(xyz{1});
if  (~((x1>1)&&(x2>x1)&&(l>0)))||(isnan(x1))||(isnan(x2))||(isnan(l))                                                                     %(~((x1>=0)&&(x1<x2)&&(x2<=1000)&&(y1>0)&&(y1<1000)&&(l>0)&&(l<=1000)&&((x2-l)>0)&&((x2-l)<=1000)))||(isnan(x1))||(isnan(x2))||(isnan(y1))||(isnan(l))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    situation=5;
    handles.situation=situation;
    axes(handles.moudel);
    hold on
    %axis equal
    x=[x2-l:0.01:x2];
    y=ones(1,length(x)).*y1;
    plot(x,y,'k','LineWidth',3);
 %以下画固定端
    xx=[x1-30/100,x1-20/100,x1,x1+20/100,x1-19/100,x1+30/100];
    yy=[y1-30/100,y1-30/100,y1,y1-30/100,y1-30/100,y1-30/100,];
    yyy=[y1-60/100:0.01:y1-30/100];
    k=[x1-2.60:0.12:x1-2.10];
    plot(xx,yy,'k','Linewidth',2.5);
    for ii=1:length(k)
       xxx=yyy./2+k(ii);
       plot(xxx,yyy,'k','Linewidth',2);
    end
%以上画固定端
%以下画滚动支座
    xx1=[x2-30/100,x2-20/100,x2,x2+20/100,x2-19/100,x2+30/100];
    yy1=[y1-30/100,y1-30/100,y1,y1-30/100,y1-30/100,y1-30/100];
    plot(xx1,yy1,'k','Linewidth',2.5);
    alpha=0:pi/40:2*pi;
    xxx1=0.10*cos(alpha)+x2-20/100;
    yyy1=0.10*sin(alpha)+y1-45/100;
    plot(xxx1,yyy1,'k','linewidth',1.5);
    xxx2=0.10*cos(alpha)+x2+20/100;
    yyy2=0.10*sin(alpha)+y1-45/100;
    plot(xxx2,yyy2,'k','linewidth',1.5);   
 %以上为画滚动支座
 if (l+1)<=9
    set(gca,'XLim',[0 10]);
    set(gca,'YLim',[0 10]);
 elseif (l+1)>9
    set(gca,'XLim',[0 l+1+1]);
    set(gca,'YLim',[0 10]);

    set(gca,'XTick',0:1:l+1+1);
 end
end
LOC1=x2-l;
LOC2=x2;
handles.LOC1=LOC1;
handles.LOC2=LOC2;
Dot=[x2-l,x1,x2];
handles.Dot=Dot;
guidata(hObject, handles);


% --------------------------------------------------------------------
function double__overhangingbeam_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to double__overhangingbeam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
situation=handles.situation;
LOC1=handles.LOC1;
LOC2=handles.LOC2;
Dot=handles.Dot;
if ~(situation==0)
    errordlg('只能输入一根梁');
    return
end


prompt={'请输入第一段长度：单位：m','请输入第二段长度：单位：m)','请输入第三段长度：单位：m'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'3','2','1'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
x1 = str2double(xyz{1})+1;      
y1 = 5;                                                   %获取数值。若为非法输入即得NaN输出
x2 = str2double(xyz{2})+str2double(xyz{1})+1;
x3 = 1;
x4 = str2double(xyz{3})+str2double(xyz{2})+str2double(xyz{1})+1;           %x3,x1,x2,x4
if (~((x1>1)&&(x2>x1)&&(x4>x2)))||(isnan(x1))||(isnan(x2))||(isnan(x4))%(~(0<=x3)&&(x3<x1)&&(x1<x2)&&(x2<x4)&&(x4<=1000)&&(0<y1)&&(y1<1000))||(isnan(x1))||(isnan(x2))||(isnan(y1))||(isnan(x3))||(isnan(x4))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    situation=6;
    handles.situation=situation;
    axes(handles.moudel);
    hold on
    %axis equal
    x=[x3:0.01:x4];
    y=ones(1,length(x)).*y1;
    plot(x,y,'k','LineWidth',3);
%以下画固定端
    xx=[x1-30/100,x1-20/100,x1,x1+20/100,x1-19/100,x1+30/100];
    yy=[y1-30/100,y1-30/100,y1,y1-30/100,y1-30/100,y1-30/100];
    yyy=[y1-60/100:0.01:y1-30/100];
    k=[x1-2.60:0.12:x1-2.10];
    plot(xx,yy,'k','Linewidth',2.5);
    for ii=1:length(k)
       xxx=yyy./2+k(ii);
       plot(xxx,yyy,'k','Linewidth',2);
    end
%以上画固定端
%以下画滚动支座
    xx1=[x2-30/100,x2-20/100,x2,x2+20/100,x2-19/100,x2+30/100];
    yy1=[y1-30/100,y1-30/100,y1,y1-30/100,y1-30/100,y1-30/100];
    plot(xx1,yy1,'k','Linewidth',2.5);
    alpha=0:pi/40:2*pi;
    xxx1=0.10*cos(alpha)+x2-20/100;
    yyy1=0.10*sin(alpha)+y1-45/100;
    plot(xxx1,yyy1,'k','linewidth',1.5);
    xxx2=0.10*cos(alpha)+x2+20/100;
    yyy2=0.10*sin(alpha)+y1-45/100;
    plot(xxx2,yyy2,'k','linewidth',1.5);   
 %以上为画滚动支座
 if (x4)<=9
    set(gca,'XLim',[0 10]);
    set(gca,'YLim',[0 10]);
 elseif (x4)>9
    set(gca,'XLim',[0 x4+1]);
    set(gca,'YLim',[0 10]);

    set(gca,'XTick',0:1:x4+1);
 end
end
LOC1=x3;
LOC2=x4;
handles.LOC1=LOC1;
handles.LOC2=LOC2;
Dot=[x3,x1,x2,x4];
handles.Dot=Dot;
guidata(hObject, handles);


% --------------------------------------------------------------------
function down_force_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to down_force (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LOC1=handles.LOC1;
LOC2=handles.LOC2;
situation=handles.situation;
F_down=handles.F_down;
if situation==0
    errordlg('请先选择杆');
    beep
    return;
end
prompt={'请输入力的大小(KN):','请输入力的作用点(m):'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'30','2.5'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
Fvalue1 = str2double(xyz{1})*1000;      
Floc1 = str2double(xyz{2});                                                %获取数值。若为非法输入即得NaN输出

if (~((Fvalue1>0)&&(Floc1>=LOC1)&&(Floc1<=LOC2)))||(isnan(Fvalue1))||(isnan(Floc1))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    F_down=[F_down;[Fvalue1,Floc1]];                                                 %获取力的矩阵

    if isempty(F_down)
        return;
    else
        [a,~]=size(F_down);
        axes(handles.moudel);
        hold on;
        %axis equal;
        for ii=1:a
            xx=[F_down(ii,2)-15/100,F_down(ii,2),F_down(ii,2)+15/100];
            yy=[5.25,5.00,5.25];
            xxx=[F_down(ii,2),F_down(ii,2)];
            yyy=[5.00,7.00];
            plot(xx,yy,'k','linewidth',2);
            plot(xxx,yyy,'k','linewidth',2.5);
            BB=strcat(num2str(F_down(ii,1)/1000),'KN');
            text(F_down(ii,2)+5/100,7.00,BB);
 if LOC2<=9
    set(gca,'XLim',[0 10]);
    set(gca,'YLim',[0 10]);
 elseif LOC2>9
    set(gca,'XLim',[0 LOC2+1]);
    set(gca,'YLim',[0 10]);

    set(gca,'XTick',0:1:LOC2+1);
 end
        end
    end
end
handles.F_down=F_down;
guidata(hObject, handles);


% --------------------------------------------------------------------
function up_force_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to up_force (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LOC1=handles.LOC1;
LOC2=handles.LOC2;
situation=handles.situation;
F_up=handles.F_up;
if situation==0
    errordlg('请先选择杆');
    beep
    return;
end
prompt={'请输入力的大小(KN):','请输入力的作用点(m):'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'30','2'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
Fvalue1 = str2double(xyz{1})*1000;      
Floc1 = str2double(xyz{2});                                                %获取数值。若为非法输入即得NaN输出

if (~((Fvalue1>0)&&(Floc1>=LOC1)&&(Floc1<=LOC2)))||(isnan(Fvalue1))||(isnan(Floc1))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    F_up=[F_up;[Fvalue1,Floc1]];                                                 %获取力的矩阵

    if isempty(F_up)
        return;
    else
        [a,~]=size(F_up);
        axes(handles.moudel);
        hold on;
        %axis equal;
        for ii=1:a
            xx=[F_up(ii,2)-15/100,F_up(ii,2),F_up(ii,2)+15/100];
            yy=[4.75,5.00,4.75];
            xxx=[F_up(ii,2),F_up(ii,2)];
            yyy=[5.00,3.00];
            plot(xx,yy,'k','linewidth',2);
            plot(xxx,yyy,'k','linewidth',2.5);
            BB=strcat(num2str(F_up(ii,1)/1000),'KN');
            text(F_up(ii,2)+5/100,3.00,BB);
             if LOC2<=9
                 set(gca,'XLim',[0 10]);
                 set(gca,'YLim',[0 10]);
             elseif LOC2>9
                 set(gca,'XLim',[0 LOC2+1]);
                 set(gca,'YLim',[0 10]);
                 set(gca,'XTick',0:1:LOC2+1);
             end
        end
    end
end
handles.F_up=F_up;
guidata(hObject, handles);


% --------------------------------------------------------------------
function couple_anticlockwise_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to couple_anticlockwise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LOC1=handles.LOC1;
LOC2=handles.LOC2;
situation=handles.situation;
M_anticlockwise=handles.M_anticlockwise;
if situation==0
    errordlg('请先选择杆');
    beep
    return;
end
prompt={'请输入力偶的大小(KN.m):','请输入力偶的作用点(m):'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'3','5'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
Mvalue1 = str2double(xyz{1})*1000;      
Mloc1 = str2double(xyz{2});                                                %获取数值。若为非法输入即得NaN输出

if (~((Mvalue1>0)&&(Mloc1>=LOC1)&&(Mloc1<=LOC2)))||(isnan(Mvalue1))||(isnan(Mloc1))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    M_anticlockwise=[M_anticlockwise;[Mvalue1,Mloc1]];                                                 %获取力的矩阵

    if isempty(M_anticlockwise)
        return;
    else
        [a,~]=size(M_anticlockwise);
        axes(handles.moudel);
        hold on;
        %axis equal;
        for ii=1:a
            xx=[M_anticlockwise(ii,2)-40/100,M_anticlockwise(ii,2),M_anticlockwise(ii,2),M_anticlockwise(ii,2)+40/100];
            yy=[6.00,6.00,4.00,4.00];
            xxx=[M_anticlockwise(ii,2)-30/100,M_anticlockwise(ii,2)-40/100,M_anticlockwise(ii,2)-30/100];
            yyy=[6.25,6.00,5.75];
            xxxx=[M_anticlockwise(ii,2)+30/100,M_anticlockwise(ii,2)+40/100,M_anticlockwise(ii,2)+30/100];
            yyyy=[4.25,4.00,3.75];
            plot(xx,yy,'k','linewidth',2.5);
            plot(xxx,yyy,'k','linewidth',2);
            plot(xxxx,yyyy,'k','linewidth',2);
            BB=strcat(num2str(M_anticlockwise(ii,1)/1000),'KN.m');
            text(M_anticlockwise(ii,2)+5/100,6.5,BB);
             if LOC2<=9
                 set(gca,'XLim',[0 10]);
                 set(gca,'YLim',[0 10]);
             elseif LOC2>9
                 set(gca,'XLim',[0 LOC2+1]);
                 set(gca,'YLim',[0 10]);
                 set(gca,'XTick',0:1:LOC2+1);
             end
        end
    end
end
handles.M_anticlockwise=M_anticlockwise;
guidata(hObject, handles);


% --------------------------------------------------------------------
function couple_clockwise_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to couple_clockwise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LOC1=handles.LOC1;
LOC2=handles.LOC2;
situation=handles.situation;
M_clockwise=handles.M_clockwise;
if situation==0
    errordlg('请先选择杆');
    beep
    return;
end
prompt={'请输入力偶的大小(KN.m):','请输入力偶的作用点(m):'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'3','2'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
Mvalue1 = str2double(xyz{1})*1000;      
Mloc1 = str2double(xyz{2});                                                %获取数值。若为非法输入即得NaN输出

if (~((Mvalue1>0)&&(Mloc1>=LOC1)&&(Mloc1<=LOC2)))||(isnan(Mvalue1))||(isnan(Mloc1))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    M_clockwise=[M_clockwise;[Mvalue1,Mloc1]];                                                 %获取力的矩阵

    if isempty(M_clockwise)
        return;
    else
        [a,~]=size(M_clockwise);
        axes(handles.moudel);
        hold on;
        %axis equal;
        for ii=1:a
            xx=[M_clockwise(ii,2)-40/100,M_clockwise(ii,2),M_clockwise(ii,2),M_clockwise(ii,2)+40/100];
            yy=[4.00,4.00,6.00,6.00];
            xxx=[M_clockwise(ii,2)-30/100,M_clockwise(ii,2)-40/100,M_clockwise(ii,2)-30/100];
            yyyy=[6.25,6.00,5.75];
            xxxx=[M_clockwise(ii,2)+30/100,M_clockwise(ii,2)+40/100,M_clockwise(ii,2)+30/100];
            yyy=[4.25,4.00,3.75];
            plot(xx,yy,'k','linewidth',2.5);
            plot(xxx,yyy,'k','linewidth',2);
            plot(xxxx,yyyy,'k','linewidth',2);
            BB=strcat(num2str(M_clockwise(ii,1)/1000),'KN.m');
            text(M_clockwise(ii,2)+5/100,3.50,BB);
 if LOC2<=9
    set(gca,'XLim',[0 10]);
    set(gca,'YLim',[0 10]);
 elseif LOC2>9
    set(gca,'XLim',[0 LOC2+1]);
    set(gca,'YLim',[0 10]);

    set(gca,'XTick',0:1:LOC2+1);
 end
        end
    end
end
handles.M_clockwise=M_clockwise;
guidata(hObject, handles);


% --------------------------------------------------------------------
function down_distributedcouple_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to down_distributedcouple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LOC1=handles.LOC1;
LOC2=handles.LOC2;
situation=handles.situation;
down=handles.down;
if situation==0
    errordlg('请先选择杆');
    beep
    return;
end
prompt={'请输入分布力的大小(KN/m):','请输入分布力的作用起点(m):','请输入分布力的作用终点(m):'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'3','3.5','5'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %确保取消不报错
 end
Value = str2double(xyz{1})*1000;      
opening = str2double(xyz{2});                                             %获取数值。若为非法输入即得NaN输出
ending=str2double(xyz{3});

if (~((Value>0)&&(opening>=LOC1)&&(ending<=LOC2)&&(opening<ending)))||(isnan(Value))||(isnan(opening))||(isnan(ending))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    down=[down;[Value,opening,ending]];                                                 %获取力的矩阵

    if isempty(down)
        return;
    else
        [a,~]=size(down);
        axes(handles.moudel);
        hold on;
        %axis equal;
        for ii=1:a
            xx=[down(ii,2),down(ii,3)];
            yy=6.00*ones(1,length(xx));
            plot(xx,yy,'k','linewidth',2);                                 %画分布力横梁
            BB=strcat(num2str(down(ii,1)/1000),'KN.m');
            text(down(ii,2)+5/100,6.50,BB);
            %以下为画分布力
            k=down(ii,2):0.20:down(ii,3);
            for jj=1:length(k)
                xxx=[k(jj),k(jj)];
                yyy=[6.00,5.00];
                plot(xxx,yyy,'k','linewidth',2.5);
                xxxx=[k(jj)-10/100,k(jj),k(jj)+10/100];
                yyyy=[5.25,5.00,5.25];
                plot(xxxx,yyyy,'k','linewidth',1);
            end
            %以上为画分布力
 if LOC2<=9
    set(gca,'XLim',[0 10]);
    set(gca,'YLim',[0 10]);
 elseif LOC2>9
    set(gca,'XLim',[0 LOC2+1]);
    set(gca,'YLim',[0 10]);

    set(gca,'XTick',0:1:LOC2+1);
 end
        end
    end
end
handles.down=down;
guidata(hObject, handles);


% --------------------------------------------------------------------
function up_distributedcouple_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to up_distributedcouple (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LOC1=handles.LOC1;
LOC2=handles.LOC2;
situation=handles.situation;
up=handles.up;
if situation==0
    errordlg('请先选择杆');
    beep
    return;
end
prompt={'请输入分布力的大小(KN/m):','请输入分布力的作用起点(m):','请输入分布力的作用终点(m):'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'3','4.5','5'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,x2值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %确保取消不报错
 end
Value = str2double(xyz{1})*1000;      
opening = str2double(xyz{2});                                             %获取数值。若为非法输入即得NaN输出
ending=str2double(xyz{3});

if (~((Value>0)&&(opening>=LOC1)&&(ending<=LOC2)&&(opening<ending)))||(isnan(Value))||(isnan(opening))||(isnan(ending))
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    up=[up;[Value,opening,ending]];                                                 %获取力的矩阵

    if isempty(up)
        return;
    else
        [a,~]=size(up);
        axes(handles.moudel);
        hold on;
        %axis equal;
        for ii=1:a
            xx=[up(ii,2),up(ii,3)];
            yy=4.00*ones(1,length(xx));
            plot(xx,yy,'k','linewidth',2);                                 %画分布力横梁
            BB=strcat(num2str(up(ii,1)/1000),'KN.m');
            text(up(ii,2)+5/100,3.50,BB);
            %以下为画分布力
            k=up(ii,2):0.20:up(ii,3);
            for jj=1:length(k)
                xxx=[k(jj),k(jj)];
                yyy=[4.00,5.00];
                plot(xxx,yyy,'k','linewidth',2.5);
                xxxx=[k(jj)-10/100,k(jj),k(jj)+10/100];
                yyyy=[4.75,5.00,4.75];
                plot(xxxx,yyyy,'k','linewidth',1);
            end
            %以上为画分布力
 if LOC2<=9
    set(gca,'XLim',[0 10]);
    set(gca,'YLim',[0 10]);
 elseif LOC2>9
    set(gca,'XLim',[0 LOC2+1]);
    set(gca,'YLim',[0 10]);

    set(gca,'XTick',0:1:LOC2+1);
 end
        end
    end
end
handles.up=up;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function moudel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to moudel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate moudel
grid on


% --------------------------------------------------------------------
function inputIz_Callback(hObject, eventdata, handles)
% hObject    handle to inputIz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function handin_Callback(hObject, eventdata, handles)
% hObject    handle to handin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Iz=handles.Iz;
prompt={'请输入Iz：x10^6 单位：mm^4'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'2'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,y1,l_leftfixedend值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
Iz = str2double(xyz{1})*10^-6; 
if isnan(Iz)
    errordlg('请输入正确的值');
    beep;
    return;
end
set(handles.Izsituation,'string',strcat('Iz:',num2str(roundn((Iz)*10^6,-3)),'x10^6 mm^4'));
handles.Iz=Iz;
guidata(hObject,handles)
% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
work3_2


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function hand_Callback(hObject, eventdata, handles)
% hObject    handle to hand (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LOC1=handles.LOC1;
LOC2=handles.LOC2;
v=handles.v;
Mz2=handles.Mz2;
Fsy2=handles.Fsy2;
Iz=handles.Iz;
if Iz==0
    errordlg('数据未输入完全');
    beep;
    return;
end
prompt={'请输入x坐标：(请精确到0.01)'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'1'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,y1,l_leftfixedend值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
xvalue = str2double(xyz{1}); 
if (~((xvalue>=LOC1)&&(xvalue<=LOC2)))||(isnan(xvalue))
    errordlg('请输入正确的值!');
    beep;
    return;
else
    xvalue=roundn(xvalue,-2);
    aa=find(abs(Mz2(2,:)-xvalue)<realmin);
    qq=strcat('挠度：',num2str(v(1,aa).*100),'mm');
    qqq=strcat('剪力:',num2str(Fsy2(1,aa)/1000),'KN');
    qqqq=strcat('弯矩:',num2str(Mz2(1,aa)/1000),'KN.m');
    set(handles.value_v,'string',qq);
    set(handles.value_mz,'string',qqqq);
    set(handles.value_fsy,'string',qqq);
    set(handles.xloc,'string',strcat('查询点坐标：',num2str(xvalue),'m'));
end
% --------------------------------------------------------------------
function mouse_Callback(hObject, eventdata, handles)
% hObject    handle to mouse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LOC1=handles.LOC1;
LOC2=handles.LOC2;
v=handles.v;
Mz2=handles.Mz2;
Fsy2=handles.Fsy2;
Iz=handles.Iz;
if Iz==0
    errordlg('数据未输入完全');
    beep;
    return;
end
[xx,~]=ginput(1);
if xx<LOC1
    xx=LOC1;
elseif xx>LOC2
    xx=LOC2;
end
xx=roundn(xx,-2);
    aa=find(abs(Mz2(2,:)-xx)<realmin);
    qq=strcat('挠度：',num2str(v(1,aa).*100),'mm');
    qqq=strcat('剪力:',num2str(Fsy2(1,aa)/1000),'KN');
    qqqq=strcat('弯矩:',num2str(Mz2(1,aa)/1000),'KN.m');
    set(handles.value_v,'string',qq);
    set(handles.value_mz,'string',qqqq);
    set(handles.value_fsy,'string',qqq);
    set(handles.xloc,'string',strcat('查询点坐标：',num2str(xx),'m'));


% --- Executes during object creation, after setting all properties.

% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate back


% --- Executes during object creation, after setting all properties.
function back_CreateFcn(hObject, eventdata, handles)
% hObject    handle to back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
imshow('埃菲尔.jpg');
% Hint: place code in OpeningFcn to populate back


% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes7
imshow('埃菲尔.jpg');


% --- Executes during object creation, after setting all properties.
function axes8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes8
;


% --- Executes during object creation, after setting all properties.
function axes9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes9
imshow('埃菲尔.jpg')


% --- Executes during object creation, after setting all properties.
function fsyandmzback_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fsyandmzback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate fsyandmzback
imshow('埃菲尔.jpg');
