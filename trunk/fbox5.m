function f=fbox5(window)
    [wy,wx] = size(window);
    t = ceil(wy/6);
    m = ceil(2*wy/3);
    top = window(1:t,:);
    middle = window(t:t+m,:);
    bottom = window(t+m:wy,:);
    
    [tx ty] = gradient(top);
    tx = tx(:); ty = ty(:);
    mt = sum(sqrt(tx.^2 + ty.^2));
    
    [tx ty] = gradient(middle);
    tx = tx(:); ty = ty(:);
    mm = sum(sqrt(tx.^2 + ty.^2));
    
    [tx ty] = gradient(bottom);
    tx = tx(:); ty = ty(:);
    mb = sum(sqrt(tx.^2 + ty.^2));
    
    f = [mt mm mb];
end