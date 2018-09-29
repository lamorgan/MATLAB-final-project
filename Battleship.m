function Battleship
% Start the Program here
% Brings up the initial figure window


f1=figure('Visible','off','color','white','Units','Normalized','Position',...
    [0 0 1 1]);

imread('MainLogo.jpeg');
imshow('MainLogo.jpeg');


htext2=uicontrol('Style','text','Units','Normalized','Position',[.2 .1 .3 .05],...
'String','Confirm Your Identity Admiral!','Fontsize',12,'BackgroundColor',[1 1 1]);

htext3=uicontrol('Style','edit','Units','Normalized','Position',[.5 .1 .2 .05]);

button1=uicontrol('Style','pushbutton','Units','Normalized','Position',[.7 .1 .05 .05],...
'String','Go!','Callback',@checkname);

set(f1,'Visible','on')

% Callback function from the pushbutton
% Calls the battleshipgrid function which is the main playing field

    function checkname(hObject,eventdata)
                set([htext2 htext3 button1],'Visible','off');
                htext4=uicontrol('Style','text','Units','Normalized','Position',[.25 .5 .5 .1],...
                    'String','Game beginning!','Fontsize',40,'Visible','on',...
                    'ForegroundColor','blue','Fontname','Bookman Old Style');
                pause(2)
                set([htext3 htext4],'Visible','off');
                close(f1)
                battleshipgrid
    end
end

