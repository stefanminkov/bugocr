function f=fbox3(window)
    [wy,wx] = size(window);
    t = ceil(wy/6);
    m = ceil(wy/4);
    
    t1 = window(1:t,:);
    t2 = window(t:t+m,:);
    t3 = window(t+m:2*t+m);
    t4 = window(2*t+m:2*t+2*m);
    t5 = window(2*t+2*m:wy);
    
    t1 = var(t1(:));
    t2 = var(t2(:));
    t3 = var(t3(:));
    t4 = var(t4(:));
    t5 = var(t5(:));
    
    f = [t1 t2 t3 t4 t5];
end