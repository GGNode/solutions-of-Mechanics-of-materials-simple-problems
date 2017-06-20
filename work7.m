function varargout = work7(varargin)
% WORK7 MATLAB code for work7.fig
%      WORK7, by itself, creates a new WORK7 or raises the existing
%      singleton*.
%
%      H = WORK7 returns the handle to a new WORK7 or the handle to
%      the existing singleton*.
%
%      WORK7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WORK7.M with the given input arguments.
%
%      WORK7('Property','Value',...) creates a new WORK7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before work7_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to work7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help work7

% Last Modified by GUIDE v2.5 19-Jun-2017 15:39:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @work7_OpeningFcn, ...
                   'gui_OutputFcn',  @work7_OutputFcn, ...
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


% --- Executes just before work7 is made visible.
function work7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to work7 (see VARARGIN)

% Choose default command line output for work7
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes work7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = work7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pmyl.
function pmyl_Callback(hObject, eventdata, handles)
% hObject    handle to pmyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
situation=handles.situation;
if ~(situation==0)
    errordlg('请先清除数据');
    beep;
    return
end
situation=1;
prompt={'请输入σx：单位：Mpa','请输入σy：单位：Mpa','请输入τxy：单位：Mpa','截面方位角α 单位：度'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'20','30','40','45'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,y1,l_leftfixedend值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
sigmax = str2double(xyz{1});                                                   %获取数值。若为非法输入即得NaN输出
sigmay = str2double(xyz{2});
tauxy  = str2double(xyz{3});
alpha  = str2double(xyz{4});
if ~((sigmax>=0)&&(sigmay>=0)&&(tauxy>=0)&&(alpha>=-180)&&(alpha<=180))||(isnan(sigmax))||(isnan(sigmay))||(isnan(tauxy))||(isnan(alpha))
     errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    set(handles.sigmax,'String',xyz{1});                                   %显示状态
    set(handles.sigmay,'String',xyz{2});
    set(handles.sigmaz,'String','0');
    set(handles.tauxy,'String',xyz{3});
    set(handles.tauxz,'String','0');
    set(handles.tauyz,'String','0');
    set(handles.alpha,'String',xyz{4});
    
    sigma1=(sigmax+sigmay)./2+sqrt(((sigmax-sigmay)./2).^2+tauxy^2);
    sigma3=(sigmax+sigmay)./2-sqrt(((sigmax-sigmay)./2).^2+tauxy^2);
    sigma2=0;
    taumax=(sigma1-sigma3)/2;
    sigmaalpha=(sigmax+sigmay)/2+(sigmax-sigmay)/2*cosd(2*alpha)+tauxy*sind(2*alpha);
    taualpha=-(sigmax-sigmay)/2*sind(2*alpha)+tauxy+cosd(2*alpha);
    alpha0=atand(2*tauxy/(sigmax-sigmay)/2);
    alpha2=alpha0+90;
    
    set(handles.sigma1,'String',num2str(sigma1));
    set(handles.sigma2,'String',num2str(sigma2));
    set(handles.sigma3,'String',num2str(sigma3));
    set(handles.taumax,'String',num2str(taumax));
    set(handles.taualpha,'String',num2str(taualpha));
    set(handles.sigmaalpha,'String',num2str(sigmaalpha));
    set(handles.alpha0,'String',num2str(alpha0));
    set(handles.alpha2,'String',num2str(alpha2));
    
    theta=0:0.0001:2*pi;
    x=sqrt(((sigmax-sigmay)/2)^2+tauxy^2)*cos(theta)+(sigmax+sigmay)/2;
    y=sqrt(((sigmax-sigmay)/2)^2+tauxy^2)*sin(theta);
    axes(handles.yly);
    hold on
    xx=[sigmax,sigmay];
    yy=[-tauxy,tauxy];
    plot(x,y,'linewidth',3);
    plot(xx,yy,'linewidth',3);
    axis equal
    grid on
    grid minor
    set(gca,'XLim',[sqrt(((sigmax-sigmay)/2)^2+tauxy^2)*cos(pi)+(sigmax+sigmay)/2-40,sqrt(((sigmax-sigmay)/2)^2+tauxy^2)*cos(0)+(sigmax+sigmay)/2+40]);
    set(gca,'YLim',[sqrt(((sigmax-sigmay)/2)^2+tauxy^2)*sin(1.5*pi)-40,sqrt(((sigmax-sigmay)/2)^2+tauxy^2)*sin(pi/2)+40]);
    ax = gca;
    ax.XAxisLocation = 'origin';%规定x轴为原点位置
    xlabel('σ');
    ylabel('-τ');
    title('应力圆');
    yuanxing=strcat('(',num2str((sigmax+sigmay)/2),',','0',')');
    text((sigmax+sigmay)/2,0,yuanxing)
    dot1=strcat('X','(',num2str(sigmax),',',num2str(tauxy),')');
    dot2=strcat('Y','(',num2str(sigmay),',',num2str(-tauxy),')');
    text(sigmax,tauxy,dot1);
    text(sigmay,-tauxy,dot2);
end
handles.situation=situation;
guidata(hObject, handles);
% --- Executes on button press in kjyl.
function kjyl_Callback(hObject, eventdata, handles)
% hObject    handle to kjyl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
situation=handles.situation;
if ~(situation==0)
    errordlg('请先清除数据');
    beep;
    return
end
situation=2;
prompt={'请输入σx：单位：Mpa','请输入σy：单位：Mpa','请输入σz：单位：Mpa','请输入τxy：单位：Mpa','请输入τyz：单位：Mpa','请输入τzx：单位：Mpa'};%输入窗口命令行开始
   name='请输入参数';
   numlines=1;
   defaultanswer={'50','30','40','45','15','45'};
 options.Resize='on';
   options.WindowStyle='normal';
   options.Interpreter='tex';
 xyz=inputdlg(prompt,name,numlines,defaultanswer,options);                 %读取x1,y1,l_leftfixedend值元胞
                                                                           %输入窗口命令行结束
 if isempty(xyz)
     return;                                                               %+确保取消不报错
 end
sigmax = str2double(xyz{1});                                                   %获取数值。若为非法输入即得NaN输出
sigmay = str2double(xyz{2});
sigmaz = str2double(xyz{3});
tauxy  = str2double(xyz{4});
tauyz  = str2double(xyz{5});
tauzx  = str2double(xyz{6});
if (~((sigmax>0)&&(sigmay>0)&&(sigmaz>0)&&(tauxy>0)&&(tauyz>0)&&(tauzx>0)))||(isnan(sigmax))||(isnan(sigmay))||(isnan(sigmaz))||(isnan(tauxy))||(isnan(tauyz))||(isnan(tauzx))    
    errordlg('参数输入错误，请注意范围')                                   %warning对话框
    beep;
else
    set(handles.sigmax,'String',xyz{1});                                   %显示状态
    set(handles.sigmay,'String',xyz{2});
    set(handles.sigmaz,'String',xyz{3});
    set(handles.tauxy,'String',xyz{4});
    set(handles.tauyz,'String',xyz{5});
    set(handles.tauxz,'String',xyz{6});
    set(handles.alpha,'String','0');
    
    %开始计算
    I1=sigmax+sigmay+sigmaz;
    I2=det([sigmax,tauxy;tauxy,sigmay])+det([sigmay,tauyz;tauyz,sigmaz])+det([sigmaz,tauzx;tauzx,sigmax]);
    I3=det([sigmax,tauxy,tauzx;tauxy,sigmay,tauyz;tauzx,tauyz,sigmaz]);
    qq=[1,-I1,I2,-I3];
    qqq=roots(qq);
    sigma1=max(qqq);
    sigma3=min(qqq);
    sigma2=sum(qqq)-sigma1-sigma3;
    taumax=(sigma1-sigma3)/2;
    tau12=0.5*(sigma1-sigma2);
    tau23=0.5*(sigma2-sigma3);
    tau13=0.5*(sigma1-sigma3);
    %结束计算
    set(handles.sigma1,'String',num2str(sigma1));
    set(handles.sigma2,'String',num2str(sigma2));
    set(handles.sigma3,'String',num2str(sigma3));
    set(handles.taumax,'String',num2str(taumax));
    %画应力圆
    theta=0:0.01:2*pi;
    x1=tau13*cos(theta)+0.5*(sigma3+sigma1);
    y1=tau13*sin(theta);
    x2=tau23*cos(theta)+0.5*(sigma3+sigma2);
    y2=tau23*sin(theta);    
    x3=tau12*cos(theta)+0.5*(sigma1+sigma2);
    y3=tau12*sin(theta);
    axes(handles.yly);
    
    plot(x1,y1,'linewidth',3);
    hold on
    plot(x2,y2,'linewidth',3);
    plot(x3,y3,'linewidth',3);
    axis equal
    grid on
    grid minor
    set(gca,'XLim',[sigma3-40,sigma1+40]);
    set(gca,'YLim',[-taumax-40,taumax+40]);
    ax = gca;
    ax.XAxisLocation = 'origin';%规定x轴为原点位置
    xlabel('σ');
    ylabel('τ');
    title('应力圆');
    dot1=strcat('(',num2str(roundn(sigma3,-1)),',','0',')');
    text(sigma3,0,dot1);
    dot2=strcat('(',num2str(roundn(sigma2,-1)),',','0',')');
    text(sigma2,0,dot2);
    dot3=strcat('(',num2str(roundn(sigma1,-1)),',','0',')');
    text(sigma1,0,dot3);
    dot4=strcat('(',num2str(roundn(0.5*(sigma3+sigma2),-1)),',',num2str(roundn(tau23,-1)),')');
    text(0.5*(sigma3+sigma2),tau23,dot4);
    dot5=strcat('(',num2str(roundn(0.5*(sigma1+sigma2),-1)),',',num2str(roundn(tau12,-1)),')');
    text(0.5*(sigma1+sigma2),tau12,dot5);
    dot6=strcat('(',num2str(roundn(0.5*(sigma3+sigma1),-1)),',',num2str(roundn(tau13,-1)),')');
    text(0.5*(sigma3+sigma1),tau13,dot6);
end
handles.situation=situation;
guidata(hObject, handles);

function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to tauxz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tauxz as text
%        str2double(get(hObject,'String')) returns contents of tauxz as a double


% --- Executes during object creation, after setting all properties.
function tauxz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tauxz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tauxy_Callback(hObject, eventdata, handles)
% hObject    handle to tauxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tauxy as text
%        str2double(get(hObject,'String')) returns contents of tauxy as a double


% --- Executes during object creation, after setting all properties.
function tauxy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tauxy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigmax_Callback(hObject, eventdata, handles)
% hObject    handle to sigmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmax as text
%        str2double(get(hObject,'String')) returns contents of sigmax as a double


% --- Executes during object creation, after setting all properties.
function sigmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigmay_Callback(hObject, eventdata, handles)
% hObject    handle to sigmay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmay as text
%        str2double(get(hObject,'String')) returns contents of sigmay as a double


% --- Executes during object creation, after setting all properties.
function sigmay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigmaz_Callback(hObject, eventdata, handles)
% hObject    handle to sigmaz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmaz as text
%        str2double(get(hObject,'String')) returns contents of sigmaz as a double


% --- Executes during object creation, after setting all properties.
function sigmaz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmaz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tauyz_Callback(hObject, eventdata, handles)
% hObject    handle to tauyz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tauyz as text
%        str2double(get(hObject,'String')) returns contents of tauyz as a double


% --- Executes during object creation, after setting all properties.
function tauyz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tauyz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function text24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.yly);
cla reset
  xlabel('σ');
    ylabel('-τ');
    title('应力圆');
   set(gca,'XLim',[0 1]);
   set(gca,'YLim',[0 1]);
   grid on
    set(handles.sigmax,'String','');                                   %显示状态
    set(handles.sigmay,'String','');
    set(handles.sigmaz,'String','');
    set(handles.tauxy,'String','');
    set(handles.tauxz,'String','');
    set(handles.tauyz,'String','');
    set(handles.alpha,'String','');
    set(handles.sigma1,'String','');
    set(handles.sigma2,'String','');
    set(handles.sigma3,'String','');
    set(handles.taumax,'String','');
    set(handles.taualpha,'String','');
    set(handles.sigmaalpha,'String','');
    set(handles.alpha0,'String','');
    set(handles.alpha2,'String','');
situation=0;
handles.situation=situation;
guidata(hObject, handles);
function alpha_Callback(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha as text
%        str2double(get(hObject,'String')) returns contents of alpha as a double


% --- Executes during object creation, after setting all properties.
function alpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
situation=0;
handles.situation=situation;
guidata(hObject, handles);


function sigma1_Callback(hObject, eventdata, handles)
% hObject    handle to sigma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma1 as text
%        str2double(get(hObject,'String')) returns contents of sigma1 as a double


% --- Executes during object creation, after setting all properties.
function sigma1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigma2_Callback(hObject, eventdata, handles)
% hObject    handle to sigma2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma2 as text
%        str2double(get(hObject,'String')) returns contents of sigma2 as a double


% --- Executes during object creation, after setting all properties.
function sigma2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigma3_Callback(hObject, eventdata, handles)
% hObject    handle to sigma3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigma3 as text
%        str2double(get(hObject,'String')) returns contents of sigma3 as a double


% --- Executes during object creation, after setting all properties.
function sigma3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigma3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function taumax_Callback(hObject, eventdata, handles)
% hObject    handle to taumax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taumax as text
%        str2double(get(hObject,'String')) returns contents of taumax as a double


% --- Executes during object creation, after setting all properties.
function taumax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taumax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sigmaalpha_Callback(hObject, eventdata, handles)
% hObject    handle to sigmaalpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sigmaalpha as text
%        str2double(get(hObject,'String')) returns contents of sigmaalpha as a double


% --- Executes during object creation, after setting all properties.
function sigmaalpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sigmaalpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function taualpha_Callback(hObject, eventdata, handles)
% hObject    handle to taualpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taualpha as text
%        str2double(get(hObject,'String')) returns contents of taualpha as a double


% --- Executes during object creation, after setting all properties.
function taualpha_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taualpha (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha0_Callback(hObject, eventdata, handles)
% hObject    handle to alpha0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha0 as text
%        str2double(get(hObject,'String')) returns contents of alpha0 as a double


% --- Executes during object creation, after setting all properties.
function alpha0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alpha2_Callback(hObject, eventdata, handles)
% hObject    handle to alpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of alpha2 as text
%        str2double(get(hObject,'String')) returns contents of alpha2 as a double


% --- Executes during object creation, after setting all properties.
function alpha2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to alpha2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function yly_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate yly
 axis equal
    grid on
   % grid minor
  xlabel('σ');
    ylabel('-τ');
    title('应力圆');
   set(gca,'XLim',[0 1]);
   set(gca,'YLim',[0 1]);
grid on

% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2



% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3
imshow('埃菲尔.jpg');


% --- Executes during object creation, after setting all properties.
function work7back_CreateFcn(hObject, eventdata, handles)
% hObject    handle to work7back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate work7back
imshow('埃菲尔.jpg');
