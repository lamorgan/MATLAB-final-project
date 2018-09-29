function [r,c]=randomhit
global playerprevhits
r=randi([1,10]);
c=randi([1,10]);
    if ~isempty(find(playerprevhits(:,1)==r)) && ~isempty(find(playerprevhits(:,2)==c)) 
        %checks if the already hit matrix at generated r and c contains
        %a true value. If it does then it generates new values and checks
        %again till new ones arent already hit co-ordinates.
        r=randi([1,10]);
        c=randi([1,10]);
        return
    end
end
