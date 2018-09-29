function StatsGUI1
% This GUI appears after the game ends
% Displays a win or lost message
% Also asks for the users profile name which is stored in the variable name
global winstat
f=figure('Visible','off','color','white','Units','Normalized','Position',...
    [0 0 1 1]);
httext=uicontrol('Style','text','Units','Normalized',...
    'Position',[.35 .5 .25 .1],'String','Enter your profile name to get your new stats!','Fontsize',20);
namebox=uicontrol('Style','edit','Units','Normalized','Position',[.35 .3 .2 .05],'Callback',...
    @callbackfn);
hbutton=uicontrol('Style','pushbutton','String','Go!!','Units','Normalized',...
    'Position',[.55 .3 .04 .05]);
httext3=uicontrol('Style','text','Units','Normalized',...
    'Position',[.35 .7 .25 .05],'String','Game Ended!!','Fontsize',20,'ForegroundColor','red');
axhan=axes('Units','Normalized','Position',[0 0 1 1]);
ocean=imread('ocean.jpeg');
image(ocean)
axis off
if winstat==0
statustext=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.35 0.8 0.25 0.05],'Fontsize',20,'String','Oh No! You lost!');
elseif winstat==1
    statustext=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.35 0.8 0.25 0.05],'Fontsize',20,'String','Congratulations! You Won!');
end
set(f,'Visible','on')
end
% This callback function opens up the plot Gui function which displays the
% multiple plots
function callbackfn(hObject,eventdata)
global name
name=get(hObject,'String');
close ALL
plotGUI(name)
end



