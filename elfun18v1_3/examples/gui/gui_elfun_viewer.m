function varargout = gui_elfun_viewer(varargin)
% GUI_ELFUN_VIEWER MATLAB code for gui_elfun_viewer.fig
%      GUI_ELFUN_VIEWER, by itself, creates a new GUI_ELFUN_VIEWER or raises the existing
%      singleton*.
%
%      H = GUI_ELFUN_VIEWER returns the handle to a new GUI_ELFUN_VIEWER or the handle to
%      the existing singleton*.
%
%      GUI_ELFUN_VIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_ELFUN_VIEWER.M with the given input arguments.
%
%      GUI_ELFUN_VIEWER('Property','Value',...) creates a new GUI_ELFUN_VIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_elfun_viewer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_elfun_viewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_elfun_viewer

% Last Modified by GUIDE v2.5 15-Jan-2018 15:36:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
'gui_Singleton',  gui_Singleton, ...
'gui_OpeningFcn', @gui_elfun_viewer_OpeningFcn, ...
'gui_OutputFcn',  @gui_elfun_viewer_OutputFcn, ...
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


% --- Executes just before gui_elfun_viewer is made visible.
function gui_elfun_viewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_elfun_viewer (see VARARGIN)

% Choose default command line output for gui_elfun_viewer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_elfun_viewer wait for user response (see UIRESUME)
% uiwait(handles.figure1);

uinit(handles);


% --- Outputs from this function are returned to the command line.
function varargout = gui_elfun_viewer_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

global item
item = get(hObject,'Value');
%set(handles.inpX,'String','');
%hw = waitbar(0,'Please wait...');
uplot_function( handles);
%delete(hw);


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor','white');

end




% --- Executes on slider movement.
function sldKK_Callback(hObject, eventdata, handles)
% hObject    handle to sldKK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

uSet_k(get(hObject,'Value'),handles);


% --- Executes during object creation, after setting all properties.
function sldKK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldKK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function inpKmax_Callback(hObject, eventdata, handles)
% hObject    handle to inpKmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpKmax as text
%        str2double(get(hObject,'String')) returns contents of inpKmax as a double

uSet_kmax(str2double(get(hObject,'String')),handles);



% --- Executes during object creation, after setting all properties.
function inpKmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpKmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor','white');
end



function inpNpts_Callback(hObject, eventdata, handles)
% hObject    handle to inpNpts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpNpts as text
%        str2double(get(hObject,'String')) returns contents of inpNpts as a double

uSet_npts(str2num(get(hObject,'String')),handles)


% --- Executes during object creation, after setting all properties.
function inpNpts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpNpts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function datElK_Callback(hObject, eventdata, handles)
% hObject    handle to datElK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of datElK as text
%        str2double(get(hObject,'String')) returns contents of datElK as a double


    % --- Executes during object creation, after setting all properties.
function datElK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to datElK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sldNpts_Callback(hObject, eventdata, handles)
% hObject    handle to sldNpts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

uSet_npts(get(hObject,'Value'),handles)


% --- Executes during object creation, after setting all properties.
function sldNpts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldNpts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function inpXmax_Callback(hObject, eventdata, handles)
% hObject    handle to txtXmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtXmax as text
%        str2double(get(hObject,'String')) returns contents of txtXmax as a double
uSet_xmax(  str2num(get(hObject,'String')),handles);


% --- Executes during object creation, after setting all properties.
function inpXmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on slider movement.
function sldX_Callback(hObject, eventdata, handles)
% hObject    handle to sldX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

uSet_xmax( get(hObject,'Value'),handles);



% --- Executes during object creation, after setting all properties.
function sldX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function inpX_Callback(hObject, eventdata, handles)
% hObject    handle to inpX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpX as text
%        str2double(get(hObject,'String')) returns contents of inpX as a double

global aaaa
uSet_x(evalf(get(hObject,'String')),handles)


% --- Executes during object creation, after setting all properties.
function inpX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inpY_Callback(hObject, eventdata, handles)
% hObject    handle to inpY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpY as text
%        str2double(get(hObject,'String')) returns contents of inpY as a double


% --- Executes during object creation, after setting all properties.
function inpY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function inpKlim_Callback(hObject, eventdata, handles)
% hObject    handle to inpKlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpKlim as text
%        str2double(get(hObject,'String')) returns contents of inpKlim as a double

uSet_klim( str2double(get(hObject,'String')), handles)

% --- Executes during object creation, after setting all properties.
function inpKlim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpKlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in chkScaleXaxis.
function chkScaleXaxis_Callback(hObject, eventdata, handles)
% hObject    handle to chkScaleXaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkScaleXaxis
global aaaa
aaaa.usexscale = get(hObject,'Value');
uplot_function(handles)


% --- Executes on button press in chkScaleYaxis.
function chkScaleYaxis_Callback(hObject, eventdata, handles)
% hObject    handle to chkScaleYaxis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkScaleYaxis
global aaaa
aaaa.useyscale = get(hObject,'Value');
uplot_function(handles)



function inpXlim_Callback(hObject, eventdata, handles)
% hObject    handle to inpXlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpXlim as text
%        str2double(get(hObject,'String')) returns contents of inpXlim as a double
uSet_xlim(str2double(get(hObject,'String')),handles)

% --- Executes during object creation, after setting all properties.
function inpXlim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpXlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor','white');
end


function inpYmax_Callback(hObject, eventdata, handles)
% hObject    handle to inpYmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpYmax as text
%        str2double(get(hObject,'String')) returns contents of inpYmax as a double
uSet_ymax(str2double(get(hObject,'String')),handles);

% --- Executes during object creation, after setting all properties.
function inpYmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpYmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function sldY_Callback(hObject, eventdata, handles)
% hObject    handle to sldY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
uSet_ymax(get(hObject,'Value'),handles);

% --- Executes during object creation, after setting all properties.
function sldY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until af   ter all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function inpYlim_Callback(hObject, eventdata, handles)
% hObject    handle to inpYlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpYlim as text
%        str2double(get(hObject,'String')) returns contents of inpYlim as a double
uSet_ylim(str2double(get(hObject,'String')),handles);


% --- Executes during object creation, after setting all properties.
function inpYlim_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpYlim (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in chkAutoZoomY.
function chkAutoZoomY_Callback(hObject, eventdata, handles)
% hObject    handle to chkAutoZoomY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkAutoZoomY
global aaaa
aaaa.autozoom = get(hObject,'Value');
if aaaa.autozoom
set(handles.inpYmax,'Enable','off')
set(handles.sldY,'Enable','off')
else
set(handles.inpYmax,'Enable','on')
set(handles.sldY,'Enable','on')
end
uplot_function(handles)


% --- Executes on button press in cmdPlot3d.
function cmdPlot3d_Callback(hObject, eventdata, handles)
% hObject    handle to cmdPlot3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global aaaa
plot3d(aaaa)



% --- Executes on button press in optX.
function optX_Callback(hObject, eventdata, handles)
% hObject    handle to optX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of optX
global aaaa
aaaa.fix = 'x';
uplot_function(handles)


% --- Executes on button press in optK.
function optK_Callback(hObject, eventdata, handles)
% hObject    handle to optK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of optK
global aaaa
aaaa.fix = 'k';
uplot_function(handles)


% --- Executes on button press in chkAutoPlot3d.
function chkAutoPlot3d_Callback(hObject, eventdata, handles)
% hObject    handle to chkAutoPlot3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkAutoPlot3d
global aaaa
aaaa.autoplot3d = get(hObject,'Value');
uplot_function(handles)


% --- Executes on button press in chkCont.
function chkCont_Callback(hObject, eventdata, handles)
% hObject    handle to chkCont (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkCont
global aaaa
aaaa.cont = get(hObject,'Value');
plot3d(aaaa)



function inpNpts3d_Callback(hObject, eventdata, handles)
% hObject    handle to inpNpts3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpNpts3d as text
%        str2double(get(hObject,'String')) returns contents of inpNpts3d as a double
global aaaa
aaaa.npts3d = round(str2double(get(hObject,'String')));
uplot_function(handles)

% --- Executes during object creation, after setting all properties.
function inpNpts3d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpNpts3d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function panSlice_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to panSlice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function inpK_Callback(hObject, eventdata, handles)
% hObject    handle to inpK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpK as text
%        str2double(get(hObject,'String')) returns contents of inpK as a double
global aaaa
uSet_k(evalf(get(hObject,'String')),handles);
return

aaaa.k = evalf(get(hObject,'String'));
set(hObject,'String',sprintf('%.16g',aaaa.k))
uplot_function(handles)

% --- Executes during object creation, after setting all properties.
function inpK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in chkSlicePlot.
function chkSlicePlot_Callback(hObject, eventdata, handles)
% hObject    handle to chkSlicePlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkSlicePlot
global aaaa
aaaa.sliceplot = get(hObject,'Value');
if ~aaaa.cont
plot3d(aaaa)
end


% --- Executes on button press in cmdPlot2d.
function cmdPlot2d_Callback(hObject, eventdata, handles)
% hObject    handle to cmdPlot2d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uplot_function( handles)


function inpTransp_Callback(hObject, eventdata, handles)
% hObject    handle to inpTransp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inpTransp as text
%        str2double(get(hObject,'String')) returns contents of inpTransp as a double
global aaaa
aaaa.transp = str2double(get(hObject,'String'));
if ~aaaa.cont
    plot3d( aaaa);
end

% --- Executes during object creation, after setting all properties.
function inpTransp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inpTransp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in chkAddInverse.
function chkAddInverse_Callback(hObject, eventdata, handles)
% hObject    handle to chkAddInverse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkAddInverse
global aaaa
aaaa.addinverse = get(hObject,'Value');
uplot_function(handles)


% --- Executes on button press in cmdHardcopy.
function cmdHardcopy_Callback(hObject, eventdata, handles)
% hObject    handle to cmdHardcopy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global aaaa
f = getframe(gca);
imwrite(f.cdata,strcat('zoom','.jpg'),'jpg');
plot(aaaa,true)



% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
% hObject    handle to sldKK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
disp('OK')
uSet_k(get(hObject,'Value'),handles)

% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldKK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sldK_Callback(hObject, eventdata, handles)
% hObject    handle to sldK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
uSet_kmax(get(hObject,'Value'),handles)

% --- Executes during object creation, after setting all properties.
function sldK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function sldXX_Callback(hObject, eventdata, handles)
% hObject    handle to sldXX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
uSet_x(get(hObject,'Value'),handles)

% --- Executes during object creation, after setting all properties.
function sldXX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldXX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in chkSymK.
function chkSymK_Callback(hObject, eventdata, handles)
% hObject    handle to chkSymK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkSymK
global aaaa
aaaa.symk = get(hObject,'Value');
k = aaaa.kkmax;
uSet_klim( k, handles)



function uinit(handles)
    global fun_list

    global item
    global aaaa

    aaaa = elfun;

    %List box
    fun_list = {};
    if isempty(fun_list)
        fun_list = get(handles.listbox1,'String');
    end

    %Sliders
    set(handles.inpNpts3d,'String',num2str(aaaa.npts3d))
    set(handles.inpNpts,'String',num2str(aaaa.npts))
    set(handles.sldNpts,'Min', 100);
    set(handles.sldNpts,'Max', aaaa.nptsmax);
    set(handles.sldNpts,'Value',aaaa.npts);

    set(handles.inpKmax,'String',num2str(aaaa.kmax));
    set(handles.inpKlim,'String',num2str(aaaa.kkmax));
    set(handles.sldK,'Min', 0 );
    set(handles.sldK,'Max', aaaa.kkmax);
    set(handles.sldK,'Value',aaaa.kmax);

    set(handles.inpXmax,'String',num2str(aaaa.xmax))
    set(handles.inpXlim,'String',num2str(aaaa.xxmax))
    set(handles.sldX,'Min',0);
    set(handles.sldX,'Max',aaaa.xxmax);
    set(handles.sldX,'Value',aaaa.xmax);

    set(handles.inpYmax,'String',num2str(aaaa.ymax))
    set(handles.inpYlim,'String',num2str(aaaa.yymax))
    set(handles.sldY,'Min',0);
    set(handles.sldY,'Max',aaaa.yymax);
    set(handles.sldY,'Value',aaaa.ymax);

    % Calculator
    set(handles.inpK,'String',num2str(aaaa.k))
    set(handles.inpX,'String',num2str(aaaa.x))
    set(handles.inpY,'String',num2str(aaaa.y))
    set(handles.inpTransp,'String',num2str(aaaa.transp))

    set(handles.sldKK,'Min',aaaa.kkmin);
    set(handles.sldKK,'Max',aaaa.kkmax);
    set(handles.sldKK,'Value',aaaa.k);

    set(handles.sldXX,'Min',aaaa.xxmin);
    set(handles.sldXX,'Max',aaaa.xxmax);
    set(handles.sldXX,'Value',aaaa.x);

    % Options
    set(handles.chkScaleXaxis,'Value',aaaa.usexscale);
    set(handles.chkScaleYaxis,'Value',aaaa.useyscale);
    set(handles.chkAutoZoomY, 'Value',aaaa.autozoom);
    set(handles.chkAutoZoomY, 'Value',aaaa.autoplot3d);
    set(handles.chkCont,      'Value',aaaa.cont);
    set(handles.chkSlicePlot, 'Value',aaaa.sliceplot);
    set(handles.chkAddInverse,  'Value',aaaa.addinverse);
    set(handles.chkSymK,  'Value',aaaa.symk);
    set(handles.chkUseM,  'Value',aaaa.usem);
    set(handles.chkTri,  'Value',aaaa.usetri);

    switch aaaa.fix
        case 'x'
            set(handles.optX,  'Value',1);
        case 'k'
            set(handles.optK,  'Value',1);
    end

    item = 1;
    set(handles.listbox1,'Value',item);

    uplot_function(handles)

function uSet_npts( n, handles)
    global aaaa
    try
        n = round(n);
        if n >= 100 && n <= aaaa.nptsmax
            aaaa.npts = n;
            uplot_function(handles);
        end
    end
    set(handles.inpNpts,'String',num2str(aaaa.npts))
    set(handles.sldNpts,'Value',aaaa.npts)


function uSet_k( k, handles)
    global aaaa

    aaaa.k = k;

    set(handles.inpK,'String',num2str(aaaa.k));
    if k >= aaaa.kkmin && k <= aaaa.kkmax
        set(handles.sldKK,'Value',aaaa.k);
    end

    uplot_function( handles);

function uSet_kmax( kmax, handles)
    global aaaa
    try
        if kmax ~= aaaa.kmax
            if kmax > 0 && kmax <= aaaa.kkmax
                aaaa.kmax = kmax;
                if aaaa.symk
                    aaaa.kmin = -kmax;
                else
                    aaaa.kmin = 0;
                end
                uplot_function(handles);
            end
        end
    catch
    end
    set(handles.sldK,    'Value' ,aaaa.kmax)
    set(handles.inpKmax,'String',num2str(aaaa.kmax))

function uSet_klim( klim, handles)
    global aaaa

    if klim <= 0
        return
    end

    klim = abs(klim);

    aaaa.kkmax =  klim;
    if aaaa.symk
        aaaa.kkmin = -klim;
    else
        aaaa.kkmin = 0;
    end

    if aaaa.kmax > aaaa.kkmax
        aaaa.kmax = aaaa.kkmax;
    end
    if aaaa.symk
        aaaa.kmin = -aaaa.kmax;
    else
        aaaa.kmin = 0;
    end

    set(handles.inpKlim,'String',num2str(aaaa.kkmax));

    set(handles.sldK,'Min'   , 0);
    set(handles.sldK,'Max'   , aaaa.kkmax);
    set(handles.sldK,'Value' , aaaa.kmax);

    set(handles.inpKmax,'String', num2str(aaaa.kmax));

    set(handles.sldKK,'Min',aaaa.kkmin);
    set(handles.sldKK,'Max',aaaa.kkmax);
    try
        set(handles.sldKK,'Value',aaaa.k);
    end

    uplot_function( handles);

function uSet_x( x, handles)
    global aaaa
    aaaa.x=x;
    set(handles.inpX,'String',num2str(aaaa.x));
    if x >= aaaa.xxmin && x <= aaaa.xxmax
        set(handles.sldXX,'Value',aaaa.x);
    end
    uplot_function( handles);

function uSet_xmax( xmax, handles)
    global aaaa
    try
        if xmax ~= aaaa.xmax
            if xmax > 0 && xmax <= aaaa.xxmax
                aaaa.xmax = xmax;
                aaaa.xmin = -xmax;
                uplot_function(handles);
            end
        end
    end
    set(handles.sldX,'Value',aaaa.xmax)
    set(handles.inpXmax,'String',num2str(aaaa.xmax))


function uSet_xlim( xlim, handles)
    global aaaa

    xlim = abs(xlim);

    aaaa.xxmax =  xlim;
    aaaa.xxmin = -xlim;

    if aaaa.xmin < aaaa.xxmin
        aaaa.xmin = aaaa.xxmin;
    elseif aaaa.xmax > aaaa.xxmax
        aaaa.xmax = aaaa.xxmax;
    end

    set(handles.inpXmax,'String',num2str(aaaa.xmax));

    set(handles.sldX,'Min'   , 0);
    set(handles.sldX,'Max'   , aaaa.xxmax);
    set(handles.sldX,'Value' , aaaa.xmax);

    set(handles.txtXmax,'String', num2str(aaaa.xmax));

    set(handles.sldXX,'Min',aaaa.xxmin);
    set(handles.sldXX,'Max',aaaa.xxmax);
    try
        set(handles.sldXX,'Value',aaaa.x);
    end
    uplot_function( handles);

function uSet_ymax( ymax, handles)
    global aaaa
    try
        if ymax ~= aaaa.ymax
            if ymax > 0 && ymax <= aaaa.yymax
                aaaa.ymax = ymax;
                aaaa.ymin = -ymax;
                uplot_function(handles);
            end
        end
    end
    set(handles.sldY,'Value',aaaa.ymax)
    set(handles.inpYmax,'String',num2str(aaaa.ymax))

function uSet_ylim( ylim, handles)
    global aaaa

    ylim = abs(ylim);

    aaaa.yymax =  ylim;
    aaaa.yymin = -ylim;

    if aaaa.ymin < aaaa.yymin
        aaaa.ymin = aaaa.yyxmin;
    elseif aaaa.ymax > aaaa.yymax
        aaaa.ymax = aaaa.yymax;
    end

    set(handles.inpYmax,'String',num2str(aaaa.ymax));

    set(handles.sldY,'Min'   , 0);
    set(handles.sldY,'Max'   , aaaa.yymax);
    set(handles.sldY,'Value' , aaaa.ymax);

    set(handles.inpYmax,'String', num2str(aaaa.ymax));

    uplot_function( handles);

function uplot_function( handles)

    global fun_list
    global item
    global aaaa

    aaaa.fun = fun_list{item};

   
    aaaa.usem = aaaa.usem;
    set(handles.chkUseM,'Value',aaaa.usem)
    if aaaa.usem
        set(handles.txtK,'String','m = ')
        set(handles.optK,'String','m');
        set(handles.txtKmax,'String','mmax');    
        set(handles.txtKlim,'String','mlim');      
        set(handles.txtElK,'String','K(m) =');         
    else
        set(handles.txtK,'String','k = ')
        set(handles.optK,'String','k');
        set(handles.txtKmax,'String','kmax');     
        set(handles.txtKlim,'String','klim');         
        set(handles.txtElK,'String','K(k) =');   
    end
    
    if strlength(aaaa.data) == 1
        aaaa.fix = aaaa.data;
        if strcmp(aaaa.fix,'x')
            set(handles.optX,'Value',1);
            set(handles.inpK,'Enable','off');
            set(handles.inpK,'String','');
            set(handles.datElK,'String','');
        else
            set(handles.optK,'Value',1);
            set(handles.inpX,'Enable','off');
            set(handles.inpX,'String','');
            if aaaa.usem
                set(handles.datElK,'String',sprintf('%.16g',melK(aaaa.k)));
            else
                set(handles.datElK,'String',sprintf('%.16g',elK(aaaa.k)));
            end
        end
        set(handles.pan3d,'Visible','off')
    else
        set(handles.inpX,'Enable','on');
        set(handles.inpX,'String',sprintf('%.16g',aaaa.x));
        set(handles.inpK,'Enable','on');
        set(handles.inpK,'String',sprintf('%.16g',aaaa.k));
        if aaaa.usem
            set(handles.datElK,'String',sprintf('%.16g',melK(aaaa.k)));
        else
            set(handles.datElK,'String',sprintf('%.16g',elK(aaaa.k)));
        end
        set(handles.pan3d,'Visible','on')
    end

    axes(handles.axes1)
    plot(aaaa)
    set(handles.inpY,'String',sprintf('%.16g',aaaa.y));
    
function result = evalf(sym)
    try
        result = eval(sym);
    catch
        result = NaN;
    end


% --- Executes on button press in chkUseM.
function chkUseM_Callback(hObject, eventdata, handles)
% hObject    handle to chkUseM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkUseM
global aaaa
aaaa.usem = get(hObject,'Value');
uplot_function(handles)


% --- Executes on button press in chkTri.
function chkTri_Callback(hObject, eventdata, handles)
% hObject    handle to chkTri (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkTri
global aaaa
aaaa.usetri = get(hObject,'Value');
uplot_function(handles)
