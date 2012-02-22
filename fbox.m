function f=fbox(window,func)
    [wy,wx] = size(window);
    t = ceil(wy/6);
    m = ceil(2*wy/3);
    c = ceil(wy/4);
        
    top = window(1:t,:);
    middle = window(t:t+m,:);
    bottom = window(t+m:wy,:);

    f(1) = func(top);
    f(2) = func(middle);
    f(3) = func(bottom);
        
    t1 = window(1:t,:);
    t2 = window(t:t+c,:);
    t3 = window(t+c:2*t+c,:);
    t4 = window(2*t+c:2*t+2*c,:);
    t5 = window(2*t+2*c:wy,:);
        
    f(4) = func(t1);
    f(5) = func(t2);
    f(6) = func(t3);
    f(7) = func(t4);
    f(8) = func(t5);
    
    c1 = window(:,1:floor(wx/3));
    c2 = window(:,floor(wx/3):2*floor(wx/3));
    c3 = window(:,2*floor(wx/3):wx);

    f(9) = func(c1);
    f(10) = func(c2);
    f(11) = func(c3);
    
    r1 = window(1:floor(wy/2),:);
    r2 = window(floor(wy/2):wy,:);

    f(12) = func(r1);
    f(13) = func(r2);
    
    c1 = window(:,1:floor(wx/2));
    c2 = window(:,floor(wx/2):wx);

    f(14) = func(c1);
    f(15) = func(c2);
end