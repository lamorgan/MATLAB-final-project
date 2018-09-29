doesitalreadyexist=find(compprevhits(:,1)==r);
idk=compprevhits(doesitalreadyexist,2);
while ~isempty(doesitalreadyexist) && idk==c
    errordlg('You have targetted this co-ordinate before. Please select',...
    'another location to hit!','Invalid co-ordinate selected!');
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
doesitalreadyexist=find(compprevhits(:,1)==r);
idk=compprevhits(doesitalreadyexist,2);
[row,col]=ginput(1);
end

end