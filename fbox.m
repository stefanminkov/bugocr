function f=fbox(bb,func)
    [wy,wx] = size(bb);
    t = floor(wy/6);
    m = floor(2*wy/3);
    c = floor(wy/4);
        
    top = bb(1:t,:);
    middle = bb(t:t+m,:);
    bottom = bb(t+m:end,:);

    f(1) = func(top);
    f(2) = func(middle);
    f(3) = func(bottom);
        
    t1 = bb(1:t,:);
    t2 = bb(t:t+c,:);
    t3 = bb(t+c:t+c+t,:);
    t4 = bb(t+c+t:t+c+t+c,:);
    t5 = bb(t+c+t+c:end,:);
        
    f(4) = func(t1);
    f(5) = func(t2);
    f(6) = func(t3);
    f(7) = func(t4);
    f(8) = func(t5);
    
    c1 = bb(:,1:floor(wx/3));
    c2 = bb(:,floor(wx/3):2*floor(wx/3));
    c3 = bb(:,2*floor(wx/3):wx);

    f(9) = func(c1);
    f(10) = func(c2);
    f(11) = func(c3);
    
    r1 = bb(1:floor(wy/2),:);
    r2 = bb(floor(wy/2):wy,:);

    f(12) = func(r1);
    f(13) = func(r2);
    
    c1 = bb(:,1:floor(wx/2));
    c2 = bb(:,floor(wx/2):wx);

    f(14) = func(c1);
    f(15) = func(c2);
end