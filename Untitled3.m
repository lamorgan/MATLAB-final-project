global len
name=get(htext3,'String');
len=
eval([name '(' len+1 ')=struct(''Hits'',' numhits '''Misses'','...
    nummiss '''Outcome'',' winstat]);


totalwins=zeros(1,len);
totalwins=eval(['sum' name '.Outcome']);
wins=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.15 0.4 0.1 0.05],'String',sprintf('%d',totalwins));

totalloss=zeros(1,len);
totalloss=eval([len '-sum' name '.Outcome']);
loss=uicontrol('Style','text','Units','Normalized',...
    'Position',[0.15 0.3 0.1 0.05],'String',sprintf('%d',totalloss));

%graph hit to miss ratio
x=1:len;
y=zeros(1,len);
for i=1:len
    y=laura(i).Hits/laura(i).Misses;
end