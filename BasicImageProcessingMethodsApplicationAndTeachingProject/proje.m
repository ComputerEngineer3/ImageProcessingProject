function varargout = proje(varargin)
% PROJE MATLAB code for proje.fig
%      PROJE, by itself, creates a new PROJE or raises the existing
%      singleton*.
%
%      H = PROJE returns the handle to a new PROJE or the handle to
%      the existing singleton*.
%
%      PROJE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJE.M with the given input arguments.
%
%      PROJE('Property','Value',...) creates a new PROJE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before proje_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to proje_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help proje

% Last Modified by GUIDE v2.5 20-May-2022 13:58:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @proje_OpeningFcn, ...
                   'gui_OutputFcn',  @proje_OutputFcn, ...
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


% --- Executes just before proje is made visible.
function proje_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to proje (see VARARGIN)

% Choose default command line output for proje
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes proje wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = proje_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbuttonImageLoad.
function pushbuttonImageLoad_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonImageLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
[filename,pathname] = uigetfile();
if filename==0
    msgbox(sprintf('Resim se??mediniz!'),'HATA','Error');
end
axes(handles.axes1)
image=imread(filename);
imshow(image);
set(handles.textFileName,'String',filename);
set(handles.textFilePath,'String',pathname);

function editFileName_Callback(hObject, eventdata, handles)
% hObject    handle to editFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFileName as text
%        str2double(get(hObject,'String')) returns contents of editFileName as a double


% --- Executes during object creation, after setting all properties.
function editFileName_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFileName (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editFilePath_Callback(hObject, eventdata, handles)
% hObject    handle to editFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFilePath as text
%        str2double(get(hObject,'String')) returns contents of editFilePath as a double


% --- Executes during object creation, after setting all properties.
function editFilePath_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFilePath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonSave.
function pushbuttonSave_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
imwrite(image, 'sonuc.png');


function editWorkingLogic_Callback(hObject, eventdata, handles)
% hObject    handle to editWorkingLogic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editWorkingLogic as text
%        str2double(get(hObject,'String')) returns contents of editWorkingLogic as a double


% --- Executes during object creation, after setting all properties.
function editWorkingLogic_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editWorkingLogic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonConverttoBlackWhite.
function pushbuttonConverttoBlackWhite_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonConverttoBlackWhite (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
axes(handles.axes1)
image=im2bw(image);
axes(handles.axesResultImage)
imshow(image);
workingLogic = 'global image';
workingLogic = [workingLogic newline 'axes(handles.axes1)'];
workingLogic = [workingLogic newline 'image=im2bw(image);'];
workingLogic = [workingLogic newline 'axes(handles.axesResultImage)'];
workingLogic = [workingLogic newline 'imshow(image)'];
workingLogic = [workingLogic newline ' '];
workingLogic = [workingLogic newline ' '];
workingLogic = [workingLogic newline '??mge im2bw() fonksiyonu kullan??larak siyah-beyaz imgeye d??n????t??r??lm????t??r. Fonksiyona parametre olarak siyah-beyaza ??evrilmek istenen imge girilmelidir. Fonksiyonun farkl?? kullan??mlar?? da mevcuttur.'];
set(handles.textWorkingLogic,'string',workingLogic);


% --- Executes on button press in pushbuttonGrayScale.
function pushbuttonGrayScale_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonGrayScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
axes(handles.axes1)
image=rgb2gray(image);
axes(handles.axesResultImage)
imshow(image);
workingLogic = 'global image';
workingLogic = [workingLogic newline 'axes(handles.axes1)'];
workingLogic = [workingLogic newline 'image=rgb2gray(image);'];
workingLogic = [workingLogic newline 'axes(handles.axesResultImage)'];
workingLogic = [workingLogic newline 'imshow(image);'];
workingLogic = [workingLogic newline ' '];
workingLogic = [workingLogic newline ' '];
workingLogic = [workingLogic newline '??mge rgb2gray() fonksiyonu kullan??larak gri-d??zey imgeye d??n????t??r??lm????t??r. Fonksiyona parametre olarak gri-d??zeye ??evrilmek istenen imge girlmelidir.'];
set(handles.textWorkingLogic,'string',workingLogic);


% --- Executes on button press in pushbuttonTakeTheNegative.
function pushbuttonTakeTheNegative_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonTakeTheNegative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
axes(handles.axes1)
if islogical(image)==0
    image = 255-image;
else
    image=imcomplement(image);
end
axes(handles.axesResultImage)
imshow(image);
workingLogic = 'global image';
workingLogic = [workingLogic newline 'axes(handles.axes1)'];
workingLogic = [workingLogic newline 'if islogical(image)==0'];
workingLogic = [workingLogic newline '    image = 255-image;'];
workingLogic = [workingLogic newline 'else'];
workingLogic = [workingLogic newline '    image=imcomplement(image);'];
workingLogic = [workingLogic newline 'end'];
workingLogic = [workingLogic newline 'axes(handles.axesResultImage)'];
workingLogic = [workingLogic newline 'imshow(image);'];
workingLogic = [workingLogic newline ' '];
workingLogic = [workingLogic newline 'Renki imgelerin ve gri-d??zey imgelerin her bir pikselleri 0-255 aras??nda de??erler almaktad??rlar. Negatifleri al??nmak istendi??inde her bir piksellerinin de??erleri 255 de??erinden ????kart??lmal??d??r.'];
workingLogic = [workingLogic newline 'Siyah-beyaz imgelerde ise piksellerin de??erleri ya 0 ya da 1 dir. Siyah-beyaz imgenin negatifi de 0 olan piksellerin 1, 1 olan piksellerin 0 olarak de??i??tirilmesiyle elde edilir. Bu i??lem imcomplement() fonksiyonu kullan??larak yap??labilmektedir. ??mgenin siyah-beyaz bir imge olup olmad?????? da islogical() fonksiyonu kullan??larak bulunmaktad??r. D??nen sonu?? 1 ise imge siyah-beyazd??r, 0 ise siyah-beyaz de??ildir.'];

set(handles.textWorkingLogic,'string',workingLogic);


% --- Executes on button press in pushbuttonAddSaltPepperNoise.
function pushbuttonAddSaltPepperNoise_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAddSaltPepperNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
axes(handles.axes1)
noiseDensity = get(handles.sliderNoise,'Value');
image = imnoise(image, 'salt & pepper', noiseDensity);
axes(handles.axesResultImage)
imshow(image);
workingLogic = "global image";
workingLogic = [workingLogic newline "axes(handles.axes1)"];
workingLogic = [workingLogic newline "noiseDensity = get(handles.sliderNoise,'Value');"];
workingLogic = [workingLogic newline "image = imnoise(image, 'salt & pepper', noiseDensity);"];
workingLogic = [workingLogic newline "axes(handles.axesResultImage)"];
workingLogic = [workingLogic newline "imshow(image);"];
workingLogic = [workingLogic newline ""];
workingLogic = [workingLogic newline "??mgeye imnoise() fonksiyonu kullan??larak g??r??lt?? eklenmektedir. imnoise() fonksiyonu ald?????? parametrelere g??re imgelere farkl?? g??r??lt??ler eklemektedir. Burada imgeye Salt&Pepper(Tuz&Biber) g??r??lt??s?? eklenmektedir. ??lk parametre olarak imge, ikinci parametre olarak eklenmek istenen g??r??lt?? olan 'salt & pepper', ??????nc?? parametre olarak ise g??r??lt??n??n yo??unlu??u girilmelidir. G??r??lt??n??n yo??unlu??u ??st k??sm??nda bulunan silder dan se??ilmelidir."];
workingLogic = [workingLogic newline "Salt&Pepper g??r??lt??s??n??n, yo??unluk parametresi olmadan kullan??m?? da mevcuttur. Bu parametre girilmezse imgeye varsay??lan olarak 0,05 yani %5 yo??unlukla g??r??lt?? eklenir."];
set(handles.textWorkingLogic,'string',workingLogic);

% --- Executes on button press in pushbuttonAddGaussianNoise.
function pushbuttonAddGaussianNoise_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonAddGaussianNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
axes(handles.axes1)
noiseDensity = get(handles.sliderNoise,'Value');
image = imnoise(image, 'gaussian', noiseDensity);
axes(handles.axesResultImage)
imshow(image)
workingLogic= "global image";
workingLogic = [workingLogic newline "axes(handles.axes1)"];
workingLogic = [workingLogic newline "noiseDensity = get(handles.sliderNoise,'Value');"];
workingLogic = [workingLogic newline "image = imnoise(image, 'gaussian', noiseDensity);"];
workingLogic = [workingLogic newline "axes(handles.axesResultImage)"];
workingLogic = [workingLogic newline "imshow(image);"];
workingLogic = [workingLogic newline ""];
workingLogic = [workingLogic newline "??mgeye imnoise() fonksiyonu kullan??larak g??r??lt?? eklenmektedir. imnoise() fonksiyonu ald?????? parametrelere g??re imgelere farkl?? g??r??lt??ler eklemektedir. Burada imgeye Gaussian beyaz g??r??lt??s?? eklenmektedir. ??lk parametre olarak imge, ikinci parametre olarak eklenmek istenen g??r??lt?? olan 'gaussian', ??????nc?? parametre olarak ise ortalama girilmelidir. Ortalama ??st k??s??mda bulunan slider dan se??ilmektedir."];
workingLogic = [workingLogic newline "Gaussian beyaz g??r??lt??s??n??n, ortalama parametresi olmadan kullan??m?? da mevcuttur. Ortalama parametresi girilmedi??inde varsay??lan olarak 0 kabul edilmektedir. D??rd??nc?? olarak da varyans parametresi girilerek kullan??labilmekte, almad?????? takdirde varsay??lan olarak 0,01 varyans ile g??r??lt?? eklemektedir."];
set(handles.textWorkingLogic,'string',workingLogic);

% --- Executes on button press in pushbuttonRemoveNoiseWithMedianFilter.
function pushbuttonRemoveNoiseWithMedianFilter_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonRemoveNoiseWithMedianFilter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
axes(handles.axes1)
image = im2double(image);
[rows, columns, x] = size(image);
if x==3
    r = medfilt2(image(:,:,1), [3 3]);
    g = medfilt2(image(:,:,2), [3 3]);
    b = medfilt2(image(:,:,3), [3 3]);
    image = cat(3, r, g, b);
else
    image = medfilt2(image);
end
axes(handles.axesResultImage)
imshow(image);
workingLogic = 'global image';
workingLogic = [workingLogic newline 'axes(handles.axes1)'];
workingLogic = [workingLogic newline 'image = im2double(image);'];
workingLogic = [workingLogic newline '[rows, columns, x] = size(image)'];
workingLogic = [workingLogic newline 'if x==3'];
workingLogic = [workingLogic newline '    r = medfilt2();'];
workingLogic = [workingLogic newline '    g = medfilt2();'];
workingLogic = [workingLogic newline '    b = medfilt2();'];
workingLogic = [workingLogic newline '    image = cat(3, r, g, b);'];
workingLogic = [workingLogic newline 'else'];
workingLogic = [workingLogic newline '    image = medfilt2(image)'];
workingLogic = [workingLogic newline 'end'];
workingLogic = [workingLogic newline 'axes(handles.axesResultImage)'];
workingLogic = [workingLogic newline 'imshow(image);'];
workingLogic = [workingLogic newline ''];
workingLogic = [workingLogic newline '??mgedeki g??r??lt?? temizleme i??lemi median filtresi kullan??larak ger??ekle??tirilmi??tir. Madian filtresi, imgeye medfilt2() fonksiyonu ile uygulanm????t??r. ??lk ??nce imgenin tek boyutlu olup olmad?????? kontrol edilmelidir. Boyutu size() fonsiyonu kullan??larak ????renilebilmektedir. E??er imge tek boyutluysa imgeye medfilt2() fonksiyonunu uygulamak yeterli olacakt??r.'];
workingLogic = [workingLogic newline 'E??er imge renki imgeyse yani ??ok boyutluysa medfilt2() fonksiyonu her boyutuna ayr?? ayr?? uygulanmal??, sonras??nda cat() fonsiyonu ile tekrardan birle??tirilmelidir.'];
set(handles.textWorkingLogic,'string',workingLogic);


% --- Executes on slider movement.
function sliderNoise_Callback(hObject, eventdata, handles)
% hObject    handle to sliderNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function sliderNoise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sliderNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbuttonHistogramStreching.
function pushbuttonHistogramStreching_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHistogramStreching (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
axes(handles.axes1)
image = (image-min(image(:)))*(255/(max(image(:))-min(image(:))));
axes(handles.axesResultImage)
imshow(image);
workingLogic = "global image";
workingLogic = [workingLogic newline "axes(handles.axes1)"];
workingLogic = [workingLogic newline "image = (image-min(image(:)))*(255/(max(image(:))-min(image(:))))"];
workingLogic = [workingLogic newline "axes(handles.axesResultImage)"];
workingLogic = [workingLogic newline "imshow(image);"];
workingLogic = [workingLogic newline ""];
workingLogic = [workingLogic newline "Histogram germe imgede benzer tonlar aras??nda toplanm???? pikselleri 0-255 aras??nda e??it olarak da????tarak imgenin daha d??zg??n, daha anla????l??r olmas??n?? sa??lamaktad??r. Histogram germe, kodda g??sterilen form??lle imgedeki en k??????k de??ere sahip pikselin 0'a, en b??y??k de??ere sahip pikselin 255'e, di??er piksellerin de bu orant??ya uygun olacak ??ekilde aradaki de??erlere e??itlenmesiyle ger??ekle??tirilmektedir."];
set(handles.textWorkingLogic,'string',workingLogic);

% --- Executes on button press in pushbuttonHistogramEqualization.
function pushbuttonHistogramEqualization_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonHistogramEqualization (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
axes(handles.axes1)
image = histeq(image);
axes(handles.axesResultImage)
imshow(image);
workingLogic = 'global image';
workingLogic = [workingLogic newline 'axes(handles.axes1)'];
workingLogic = [workingLogic newline 'image = histeq(image);'];
workingLogic = [workingLogic newline 'axes(handles.axesResutImage)'];
workingLogic = [workingLogic newline 'imshow(image);'];
workingLogic = [workingLogic newline ''];
workingLogic = [workingLogic newline 'Histogram e??itleme imgedeki benzer tonlar etraf??nda toplanm???? piksellerin yo??un oldu??u noktalar?? daha ??ok da????tarak imgenin daha belirgin olmas??n?? sa??lamaktad??r. Histogram e??itleme i??lemi histeq() fonksiyonu kullan??larak ger??ekle??tirilmi??tir. Fonksiyona parametre olarak imge verilmelidir. histeq() fonksiyonunun farkl?? kullan??mlar?? da mevcuttur.'];
set(handles.textWorkingLogic,'string',workingLogic);


% --- Executes on button press in pushbuttonEdgeDetection.
function pushbuttonEdgeDetection_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonEdgeDetection (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image
axes(handles.axes1)
functionp = get(handles.edgeDetectionFunctions,'SelectedObject');
functionp = get(functionp,'String');
[rows, columns, x] = size(image);
if x==3
    image=rgb2gray(image);
end

if functionp=="Sobel"
    image=edge(image,'Sobel');
elseif functionp=="Prewitt"
    image=edge(image,'Prewitt');
else
    image=edge(image,'Roberts');
end

axes(handles.axesResultImage)
imshow(image)
workingLogic = "global image";
workingLogic = [workingLogic newline "axes(handles.axes1)"];
workingLogic = [workingLogic newline "functionp = get(handles.edgeDetectionFunctions, 'SelectedObject');"];
workingLogic = [workingLogic newline "functionp = get(functionp,'string');"];
workingLogic = [workingLogic newline "[rows, columns, x] = size(image);"];
workingLogic = [workingLogic newline "if x==3"];
workingLogic = [workingLogic newline "    image=rgb2gray(image);"];
workingLogic = [workingLogic newline "end"];
workingLogic = [workingLogic newline 'if functionp=="Sobel"'];
workingLogic = [workingLogic newline "    image=edge(image,'Sobel');"];
workingLogic = [workingLogic newline 'elseif functionp="Prewitt"'];
workingLogic = [workingLogic newline "    image=edge(image,'Prewitt');"];
workingLogic = [workingLogic newline "else"];
workingLogic = [workingLogic newline "    image=edge(image,'Roberts');"];
workingLogic = [workingLogic newline "end"];
workingLogic = [workingLogic newline "axes(handles.axesResultImage)"];
workingLogic = [workingLogic newline "imshow(image)"];
workingLogic = [workingLogic newline "??mgede bulunan nesnelerin kenarlar?? farkl?? y??ntemlerle de belirlenebilmektedir. Burada edge() fonksiyonu kullan??larak belirlenmi??tir. edge() fonksiyonuna imge ve method parametreleri girilmelidir. Method parametresi olarak ise s??k kullan??lan sobel, prewitt ve roberts methodlar?? se??ilmi??tir. ??stenilen method se??ilip parametre olarak girildi??inde y??klenen imgenin nesnelerinin s??n??rlar?? belirlenerek g??sterilmektedir. ??mge renkli bir imgeyse ??nce gri d??zeye ??evrilmektedir."];
set(handles.textWorkingLogic,'string',workingLogic);
