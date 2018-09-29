function gridhitc(r,c)
global bgrid
global axhan
if r==1
R={25:52};
elseif r==2
R={54:81};
elseif r==3
R={83:110};
elseif r==4
R={112:139};
elseif r==5
R={141:168};
elseif r==6
R={170:197};
elseif r==7
R={199:226};
elseif r==8
R={228:255};
elseif r==9
R={257:284};
elseif r==10
R={286:313};
end
if c==1
C={27:54};
elseif c==2
C={56:83};
elseif c==3
C={85:112};
elseif c==4
C={114:141};
elseif c==5
C={143:170};
elseif c==6
C={172:199};
elseif c==7
C={201:228};
elseif c==8
C={230:257};
elseif c==9
C={259:286};
elseif c==10
C={288:315};
end
hit1=audioread('Hit1.wav', [15000 32000]);
sound(hit1)
axhan=axes('Units','Normalized','Position',[.05 .35 .4 .55]);
bgrid(R{1},C{1},2:3)=0;
image(bgrid)
axis off
end

