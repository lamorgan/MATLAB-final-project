function enemyshipplacement(hObject,eventdata)
% random ship placement for the enemy grid
% follows the same format as the shipplacement function except it doesn't
% display where the ships are on the grid

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

%matrix of where ships are
global compship
    compship=zeros(10);
while sum(sum(compship))~=17
    compship=zeros(10);
%Carrier
r1=randi([1,10]);
r2=rowmat{r1};
c1=randi([1,10]);
c2=columnmat{c1};
p=randi([1,2]);  %1=vertical 2=horizontal
if p==1 
    uord=randi([1,2]); %1=up 2=down
    if uord==1 %vertical up
        r1=([5,10]);
        r2=rowmat{r1};
        r11=r1-4;
        r11c=rowmat{r11};
        bgrid=imread('grid1.jpg');
        compship(r11:r1,c1)=1;
    elseif uord==2 %vertical down
        r1=([1,6]);
        r2=rowmat{r1};
        r11=r1+4;
        r11c=rowmat{r11};
        bgrid=imread('grid1.jpg');
        compship(r1:r11,c1)=1;
    end
elseif p==2 %horizontal 
    lorr=randi([1,2]);
        if lorr==1 %horizontal left
        c1=randi([5,10]);
        c2=columnmat{c1};
        c11=c1-4;
        c11c=columnmat{c11};
        bgrid=imread('grid1.jpg');
        compship(r1,c11:c1)=1;
        elseif lorr==2 %horizontal right
        c1=randi([1,6]);
        c2=columnmat{c1};
        c11=c1+4;
        c11c=columnmat{c11};
        bgrid=imread('grid1.jpg');
        compship(r1,c1:c11)=1;
        end
end

%Battleship
r21=randi([1,10]);
r22=rowmat{r21};
c21=randi([1,10]);
c22=columnmat{c21};
p2=randi([1,2]); %1=Vertical 2=horizontal
if p2==1 
    uord2=randi([1,2]); %1=up 2=down
    if uord2==1 %up
        r21=randi([4,10]);
        r22=rowmat{r21};
        r5=r21-3;
        r5c=rowmat{r5};
        while compship(r21,c21)==1 || compship(r21-1,c21)==1 || compship(r21-2,c21)==1 || compship(r21-3,c21)==1
            r21=randi([4,10]);
            r22=rowmat{r21};
            r5=r21-3;
            r5c=rowmat{r5};
        end
        compship(r5:r21,c21)=1;
    elseif uord2==2 %down
        r21=randi([1,7]);
        r22=rowmat{r21};
        r5=r21+3;
        r5c=rowmat{r5};
        while compship(r21,c21)==1 || compship(r21+1,c21)==1 || compship(r21+2,c21)==1 || compship(r21+3,c21)==1
            r21=randi([1,7]);
            r22=rowmat{r21};
            r5=r21+3;
            r5c=rowmat{r5};
        end
        compship(r21:r5,c21)=1;
    end
elseif p2==2 %horizontal
    lorr2=randi([1,2]); %1=left 2=right
    if lorr2==1 %left
        c21=randi([4,10]);
        c22=columnmat{c21};
        c5=c21-3;
        c5c=columnmat{c5};
        while compship(r21,c21)==1 || compship(r21,c21-1)==1 || compship(r21,c21-2)==1 || compship(r21,c21-3)==1
            c21=randi([4,10]);
            c22=columnmat{c21};
            c5=c21-3;
            c5c=columnmat{c5};
        end
        compship(r21,c5:c21)=1;
    elseif lorr2==2 %right
        c21=randi([1,7]);
        c22=columnmat{c21};
        c5=c21+3;
        c5c=columnmat{c5};
        while compship(r21,c21)==1 || compship(r21,c21+1)==1 || compship(r21,c21+2)==1 || compship(r21,c21+3)==1
            c21=randi([1,7]);
            c22=columnmat{c21};
            c5=c21+3;
            c5c=columnmat{c21};
        end
        compship(r21,c21:c5)=1;
    end
end

% Submarine
r31=randi([1,10]);
r32=rowmat{r31};
c31=randi([1,10]);
c32=columnmat{c31};
p3=randi([1,2]); %1=vertical 2=horizontal
if p3==1 
    uord3=randi([1,2]); %1=up 2=down
    if uord3==1 
        r31=randi([3,10]);
        r32=rowmat{r31};
        r3=r31-2;
        r3c=rowmat{r3};
        while compship(r31,c31)==1 || compship(r31-1,c31)==1 || compship(r31-2,c31)==1
            r31=randi([3,10]);
            r32=rowmat{r3};
            r3=r31-2;
            r3c=rowmat{r3};
        end
        compship(r3:r31,c31)=1;
    elseif uord3==2 %down
        r31=randi([1,8]);
        r32=rowmat{r31};
        r3=r31+2;
        r3c=rowmat{r3};
        while compship(r31,c31)==1 || compship(r31+1,c31)==1 || compship(r31+2,c31)==1
            r31=randi([1,8]);
            r32=rowmat{r3};
            r3=r31+2;
            r3c=rowmat{r3};
        end
        compship(r31:r3,c31)=1;
    end
elseif p3==2 
    lorr3=randi([1,2]); %1=left 2=right
    if lorr3==1 
        c31=randi([3,10]);
        c32=columnmat{c31};
        c3=c31-2;
        c3c=columnmat{c3};
        while compship(r31,c31)==1 || compship(r31,c31-1)==1 || compship(r31,c31-2)==1
            c31=randi([3,10]);
            c32=columnmat{c31};
            c3=c31-2;
            c3c=columnmat{c3};
        end
        compship(r31,c3:c31)=1;
    elseif lorr3==2 
        c31=randi([1,8]);
        c32=columnmat{c31};
        c3=c31+2;
        c3c=columnmat{c3};
        while compship(r31,c31)==1 || compship(r31,c31+1)==1 || compship(r31,c31+2)==1
            c31=randi([1,8]);
            c32=columnmat{c31};
            c3=c31+2;
            c3c=columnmat{c3};
        end
        compship(r31,c31:c3)=1;
    end
end

%cruiser
r41=randi([1,10]);
r42=rowmat{r41};
c41=randi([1,10]);
c42=columnmat{c41};
p4=randi([1,2]); %1=vertical 2=horizontal
if p4==1 
    uord4=randi([1,2]); %1=up 2=down
    if uord4==1 
        r41=randi([3,10]);
        r42=rowmat{r41};
        r4=r41-2;
        r4c=rowmat{r4};
        while compship(r41,c41)==1 || compship(r41-1,c41)==1 || compship(r41-2,c41)==1
            r41=randi([3,10]);
            r42=rowmat{r41};
            r4=r41-2;
            r4c=rowmat{r4};
        end
        compship(r4:r41,c41)=1;
    elseif uord4==2 
        r41=randi([1,8]);
        r42=rowmat{r41};
        r4=r41+2;
        r4c=rowmat{r4};
        while compship(r41,c41)==1 || compship(r41+1,c41)==1 || compship(r41+2,c41)==1
            r41=randi([1,8]);
            r42=rowmat{r41};
            r4=r41+2;
            r4c=rowmat{r41};
        end
        compship(r41:r4,c41)=1;
    end
elseif p4==2
    lorr4=randi([1,2]); %1=left 2=right
    if lorr4==1 
        c41=randi([3,10]);
        c42=columnmat{c41};
        c4=c41-2;
        c4c=columnmat{c4};
        while compship(r41,c41)==1 || compship(r41,c41-1)==1 || compship(r41,c41-2)==1
            c41=randi([3,10]);
            c42=columnmat{c41};
            c4=c41-2;
            c4c=columnmat{c4};
        end
        compship(r41,c4:c41)=1;
    elseif lorr4==2 
        c41=randi([1,8]);
        c42=columnmat{c41};
        c4=c41+2;
        c4c=columnmat{c4};
        while compship(r41,c41)==1 || compship(r41,c41+1)==1 || compship(r41,c41+2)==1
            c41=randi([1,8]);
            c42=columnmat{c41};
            c4=c41+2;
            c4c=columnmat{c4};
        end
        compship(r41,c41:c4)=1;
    end
end

%destroyer
r51=randi([1,10]);
r52=rowmat{r51};
c51=randi([1,10]);
c52=columnmat{c51};
p5=randi([1,2]); %1=vertical 2=horizontal
if p5==1
    uord5=randi([1,2]); %1=up 2=down
    if uord5==1
        r51=randi([2,10]);
        r52=rowmat{r51};
        r6=r51-1;
        r6c=rowmat{r6};
        while compship(r51,c51)==1 || compship(r51-1,c51)==1
            r51=randi([2,10]);
            r52=rowmat{r51};
            r6=r51-1;
            r6c=rowmat{r6};
        end
        compship(r6:r51,c51)=1;
    elseif uord5==2 
        r51=randi([1,9]);
        r52=rowmat{r51};
        r6=r51+1;
        r6c=rowmat{r6};
        while compship(r51,c51)==1 || compship(r51+1,c51)==1
            r51=randi([1,9]);
            r52=rowmat{r51};
            r6=r51+1;
            r6c=rowmat{r6};
        end
        bgrid(r52(1):r6c(end),c52,1:3)=0;
    end
elseif p5==2
    lorr5=randi([1,2]); %1=left 2=right
    if lorr5==1 
    c51=randi([2,10]);
    c52=columnmat{c51};
    c6=c51-1;
    c6c=columnmat{c6};
    while compship(r51,c51)==1 || compship(r51,c51-1)==1
        c51=randi([2,10]);
        c52=columnmat{c51};
        c6=c51-1;
        c6c=columnmat{c6};
    end
    compship(c6:c51,r51)=1;
    elseif lorr5==2 
        c51=randi([1,9]);
        c52=columnmat{c51};
        c6=c51+1;
        c6c=columnmat{c6};
        while compship(r51,c51)==1 || compship(r51,c51+1)==1
            c51=randi([1,9]);
            c52=columnmat{c51};
            c6=c51+1;
            c6c=columnmat{c6};
        end
        compship(c51:c6,r51)=1;
    end
end
end
end
