function StatsGUI

global compnumshots
global playernumshots
global playerprevhits
global name
global winstat

f3=figure('Visible','off','Color','white','Units','Normalized',...
    'Position',[0 0 1 1]);

htext=uicontrol('Style','text','Units','Normalized','Position',[.2 .4 .1 .1],...
'String','Please enter profile name!','Fontsize',12,'BackgroundColor',[1 1 1]);

htext2=uicontrol('Style','edit','Units','Normalized','Position',[.5 .1 .2 .05]);

button1=uicontrol('Style','pushbutton','Units','Normalized','Position',[.7 .1 .05 .05],...
'String','Go!','Callback',@checkname2);

endgame=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.25 0.85 0.5 0.15],'String','Game Ended',...
    'BackgroundColor',[1 1 1]);

set(f3,'Visible','on')

if winstat==0
statustext=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.25 0.75 0.5 0.05],'String','Oh No! You lost!');
elseif winstat==1
    statustext=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.25 0.75 0.5 0.05],'String','Congratulations! You Won!');
end


hitindecies=find(playerprevhits(:,3)==1);
numhits=length(hitindecies);
hits=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.15 0.6 0.1 0.05],'String',sprintf('%d',numhits));

missindecies=find(playerprevhits(:,3)==-1);
nummiss=length(missindecies);
miss=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.15 0.5 0.1 0.05],'String',sprintf('%d',nummiss));

hitmissratio=numhits/nummiss;
ratio=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.15 0.5 0.1 0.05],'String',sprintf('%.3f',hitmissratio));

%now append the original save file and add the new stats

axishan=axes('Units','Normalized','Position',[0.6 0.4 0.3 0.3]);
x=7;
y=2;
plot(x,y,'r*');
title('Hit-to-Miss ratio of all past games')

%make buttons for quit and play again
quitbutton=uicontrol('Style','pushbutton','String','Quit Game',...
    'Units','Normalized','Position',[0.2  0.1 0.1 0.05],'Callback',@quitgame);
playbutton=uicontrol('Style','pushbutton','String','Play Again',...
    'Units','Normalized','Position',[0.2  0.1 0.1 0.05],'Callback',@playagain);



set(f3,'Visible','on')

uibuttongroup

%eval(['save ' name '.mat ' name]);
end
    function quitgame(hObject,eventdata)
        %eval(['save ' name '.mat ' name]\)
        clear
        clc
        close ALL
    end
    function playagain(hObject,eventdata)
        %eval(['save ' name '.mat ' name]\)
        clear
        clc
        close ALL
        battleship
    end
        
    function checkname(hObject,eventdata)
    global name
        name=get(htext3,'String');
        fid=fopen(sprintf('%s.mat',name));
            if fid<=0
                set(htext2,'string','Are you sure you spelled the profile correctly?');
            else
                set([htext2 htext3 button1],'Visible','off');
                
            end
    end
