function BattleshipScriptMain
% This runs the main part of the game. 


global playernumshots % number of shots made by player
global compnumshots % number of shots made by computer
global playerprevhits % 100X3 matrix of coordinates of prev  
                      %hits ON player and 3rd col -1 for miss, 0 for not
                      %hit and 1 for hit
global compprevhits % 100X3 matrix of coordinates of prev
                      %hits ON computer and 3rd col -1 for miss, 0 for not
                      %hit and 1 for hit
global playership   % Stores where the playerships are
global compship     % Sotres where the compships are



playerdamage=0; %sum(playerwashit);
compdamage=0; %sum(compwashit)

%preallocation
playerprevhits=zeros(100,3);
compprevhits=zeros(100,3);

playernumshots=0;
compnumshots=0;

%logical 10 by 10s that store true for where there are ships
playership=playership;
compship=compship;

% List of the coordinates of the image
R1={25:52};
R2={54:81};
R3={83:110};
R4={112:139};
R5={141:168};
R6={170:197};
R7={199:226};
R8={228:255};
R9={257:284};
R10={286:313};
C1={27:54};
C2={56:83};
C3={85:112};
C4={114:141};
C5={143:170};
C6={172:199};
C7={201:228};
C8={230:257};
C9={259:286};
C10={288:315};
rowmat(1,:)=R1;
rowmat(2,:)=R2;
rowmat(3,:)=R3;
rowmat(4,:)=R4;
rowmat(5,:)=R5;
rowmat(6,:)=R6;
rowmat(7,:)=R7;
rowmat(8,:)=R8;
rowmat(9,:)=R9;
rowmat(10,:)=R10;
columnmat(:,1)=C1;
columnmat(:,2)=C2;
columnmat(:,3)=C3;
columnmat(:,4)=C4;
columnmat(:,5)=C5;
columnmat(:,6)=C6;
columnmat(:,7)=C7;
columnmat(:,8)=C8;
columnmat(:,9)=C9;
columnmat(:,10)=C10;

%This is just the boxes where the running counts go
totalnum=uicontrol('Style','text','BackgroundColor','white','Units','Normalized',...
    'Position',[.2 .15 .1 .06]);
totalhits=uicontrol('Style','text','BackgroundColor','white','Units','Normalized',...
    'Position',[.65 .15 .1 .06]);

%main while loop starts here
while playerdamage<17 && compdamage<17
    %first comes players turn
    [r,c]=Pshot;
    playernumshots=playernumshots+1; %increment number of shots hit
    playerprevhits(playernumshots,1:2)=[r,c]; %sets hit corodinate to true
    set(totalnum,'Visible','on','Fontsize',30,'String',playernumshots)
    if compship(r,c)==true
        % This is if the player hits a ship
        % calls the gridhit function which turns the shot red if its a hit
       gridhit(r,c)
       compprevhits(playernumshots,3)=1;
       compdamage=compdamage+1;
       set(totalhits,'Visible','on','Fontsize',30,'String',compdamage)
    else
        compprevhits(playernumshots,3)=-1;
        % If the player misses 
        % Turns the enemy grid blue
       gridmiss(r,c)
    end
    pause(1)
    % Now starts the computers turn
    % this calls the random hit function which gets the coordinates that
    % computer uses to make a shot
    [r,c]= randomhit;
    compnumshots=compnumshots+1; %increment number of shots fired
    compprevhits(compnumshots,1:2)=[r,c]; %sets hit corodinate to true
    if playership(r,c)==true
       % if the computer hits ship, calls a function to turn the players
       % square red
       gridhitc(r,c)
       playerprevhits(compnumshots,3)=1;
       playerdamage=playerdamage+1;
    else
        % if the computer misses, calls a function to turn grid blue
        gridmissc(r,c)
       playerprevhits(compnumshots,3)=-1;
    end
end
global winstat
%Checks to see who lost
% there are a total of 17 squares with ships on them so if the count=17 the
% game ends

if playerdamage==17
   %This is if the player loses
   %GUI box with sorry you lost
   set([totalnum totalhits],'Visible','off')
   pause(2)
   winstat=0;
    close ALL
    % calls the stats GUI which leads to the plots and statistical analysis
   StatsGUI1
elseif compdamage==17
   % If the player wins
   %GUI box with Congrats you won
   set([totalnum totalhits],'Visible','off')
   pause(2)
   winstat=1;
   close ALL
   % calls the stats GUI
   StatsGUI1
end
end

function [r,c]=Pshot
global compprevhits % 100X3 matrix of coordinates of prev
                      %hits ON computer and 3rd col -1 for miss, 0 for not
                      %hit and 1 for hit

%max and min x and y store the postion of the computer's 10X10 grid so 
%this getcore function gets the graphical input from the user and 
%checks whether the ginput is within valid bounds or not

% This function is supposed to check if the hit is within the set bounds,
% there is a problem with the indexing. 
% Sometimes it works and sometimes it doesn't
[row,col]=getcors;

if floor(row)>=25 && floor(row)<52
    c=1;
elseif floor(row)>=52 && floor(row)<81
    c=2;
elseif floor(row)>=81 && floor(row)<110
    c=3;
elseif floor(row)>=110 && floor(row)<139
    c=4;
elseif floor(row)>=139 && floor(row)<168
    c=5;
elseif floor(row)>=168 && floor(row)<197
    c=6;
elseif floor(row)>=197 && floor(row)<226
    c=7;
elseif floor(row)>=226 && floor(row)<255
    c=8;
elseif floor(row)>=255 && floor(row)<284
    c=9;
elseif floor(row)>=284 && floor(row)<313
    c=10;
end


if floor(col)>=27 && floor(col)<54
    r=1;
elseif floor(col)>=54 && floor(col)<83
    r=2;
elseif floor(col)>=83 && floor(col)<112
    r=3;
elseif floor(col)>=112 && floor(col)<141
    r=4;
elseif floor(col)>=141 && floor(col)<170
    r=5;
elseif floor(col)>=170 && floor(col)<199
    r=6;
elseif floor(col)>=199 && floor(col)<228
    r=7;
elseif floor(col)>=228 && floor(col)<257
    r=8;
elseif floor(col)>=257 && floor(col)<286
    r=9;
elseif floor(col)>=286 && floor(col)<315
    r=10;
end
   

end


function [row,col]=getcors

%placeholder xmin xmax ymin ymax values are here. please replace for final
%programme

rmin=25;
rmax=318;
cmin=24;
cmax=314;

    [row,col]=ginput(1);
    

end


