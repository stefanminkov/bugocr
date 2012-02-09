function f=fbox1(window)
    [wy,wx] = size(window);
    t = ceil(wy/6);
    m = ceil(2*wy/3);
    top = window(1:t,:);
    middle = window(t:t+m,:);
    bottom = window(t+m:wy,:);
    
    mt = sum(top(:))/length(top);
    mm = sum(middle(:))/length(middle);
    mb = sum(bottom(:))/length(bottom);
    
    f = [mt mm mb];
end