function plotGUI(name)

%This function uses all of the stats and creates multiple data plots
global winstat
global playernumshots
f=figure('Visible','off','color','white','Units','Normalized','Position',[0 0 1 1]);
axhan=axes('Units','Normalized','Position',[0 0 1 1]);
ocean=imread('ocean.jpeg');
image(ocean)
axis off
mystat=[playernumshots winstat];

% Creates a data file to store the previous game stats to compare them to
% the game recently played
save battlestats.mat mystat -ascii -append
load battlestats.mat -ascii
mystats=battlestats(:,:);

% this creates a pie chart showing how many hits were made and how many
% total shots were made
axhan2=axes('Units','Normalized','Position',[.5 .1 .4 .4]);
pie([playernumshots,17],{'Misses','Hits'})
axis off

% this creates a plot of which game it was (1-n) and plots the total number
% of hits that were made during each game
axhan3=axes('Units','Normalized','Position',[.5 .55 .4 .4]);
x=1:length(mystats);
y=mystats(:,1);
plot(x,y,'b*')
xlabel('Total games played')
ylabel('total number of moves')

httext=uicontrol('Style','text','String',sprintf('%s''s Game Stats',name),...
    'Units','Normalized','Position',[.05 .9 .4 .05],'Fontsize',25,'BackgroundColor','white');
scoreboard=uicontrol('Style','text','String',sprintf('%5d   %8d\n',sortrows(mystats)'),...
    'Units','Normalized','Position',[.1 .4 .3 .3],'BackgroundColor','white','Fontsize',15);
httext2=uicontrol('Style','text','String','Total moves      Win/Loss','Units',...
    'Normalized','Position',[.1 .7 .3 .05],'Fontsize',10);
button=uicontrol('Style','pushbutton','String','Play Again?!','Units','Normalized',...
    'Position',[.17 .2 .15 .15],'Fontsize',20,'ForegroundColor','red','Callback',...
    @callbackfn);
set(f,'Visible','on')
end

% this is the call back function that returns the player to the main screen
% if they choose to play again
function callbackfn(hObject,eventdata)
close ALL
Battleship
end


