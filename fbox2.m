function f=fbox2(window)
    [wy,wx] = size(window);
    t = ceil(wy/6);
    m = ceil(wy/4);
    
    t1 = window(1:t,:);
    t2 = window(t:t+m,:);
    t3 = window(t+m:2*t+m);
    t4 = window(2*t+m:2*t+2*m);
    t5 = window(2*t+2*m:wy);
    
    t1 = sum(t1(:))/length(t1);
    t2 = sum(t2(:))/length(t2);
    t3 = sum(t3(:))/length(t3);
    t4 = sum(t4(:))/length(t4);
    t5 = sum(t5(:))/length(t5);
    
    f = [t1 t2 t3 t4 t5];
end