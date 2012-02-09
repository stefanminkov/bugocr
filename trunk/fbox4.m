function f=fbox4(window)
    [wy,wx] = size(window);
    t = ceil(wy/6);
    m = ceil(2*wy/3);
    top = window(1:t,:);
    middle = window(t:t+m,:);
    bottom = window(t+m:wy,:);
    
    mt = var(top(:));
    mm = var(middle(:));
    mb = var(bottom(:));
    
    f = [mt mm mb];
end