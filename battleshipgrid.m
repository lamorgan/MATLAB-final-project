function battleshipgrid
% This is the main playing field GUI
% Declares these variables global that are used in multiple functions
global bgrid
global bgrid2
global axhan
global axhan2

f=figure('Visible','off','color','white','Units','Normalized','Position',...
    [0 0 1 1]);
axhan3=axes('Units','Normalized','Position',[0 0 1 1]);
ocean=imread('ocean.jpeg');
image(ocean)
axis off
axhan2=axes('Units','Normalized','Position',[.5 .35 .4 .55]);
bgrid2=imread('grid1.jpg');
image(bgrid2)
axis off
axhan=axes('Units','Normalized','Position',[.05 .35 .4 .55]);
bgrid=imread('grid1.jpg');
image(bgrid)
axis off
text1=uicontrol('Style','text','BackgroundColor','white','Units','Normalized',...
    'Position',[.2 .93 .1 .06],'String','Friendly','Fontsize',30);
text2=uicontrol('Style','text','BackgroundColor','white','Units','Normalized',...
    'Position',[.65 .93 .1 .06],'String','Enemy','Fontsize',30);
button=uicontrol('Style','pushbutton','String','Deploy Fleet',...
    'Units','Normalized','Position',[.15 .2 .2 .1],'Fontsize',20,'Callback',...
    @callbackfn);
button2=uicontrol('Style','pushbutton','String','Engage in War!!',...
    'Units','Normalized','Position',[.6 .2 .2 .1],'Fontsize',20,'Callback',@gamecode);
set(f,'Visible','on')
end
% This is the callback function that calls the random shipplacement for the
% players grid
function callbackfn(jObject,eventdata)
% ship placement
shipplacement(jObject,eventdata)
set(jObject,'Visible','off')
axis off
hold on
end
% This is the second callback function that calls the enemy ship placement
% function and begins the game
% Then calls the Battleship Main Script 
function gamecode(hObject,eventdata)
enemyshipplacement(hObject,eventdata)
total=uicontrol('Style','text','BackgroundColor','white','Units','Normalized',...
    'Position',[.2 .25 .1 .06],'String','Total','Fontsize',20);
hits=uicontrol('Style','text','BackgroundColor','white','Units','Normalized',...
    'Position',[.65 .25 .1 .06],'String','Hits','Fontsize',20);
totalnum=uicontrol('Style','text','BackgroundColor','white','Units','Normalized',...
    'Position',[.2 .15 .1 .06]);
totalhits=uicontrol('Style','text','BackgroundColor','white','Units','Normalized',...
    'Position',[.65 .15 .1 .06]);
set(hObject,'Visible','off')
set([total hits totalnum totalhits],'Visible','on')
BattleshipScriptMain
end

