function features=fgen(window)
    f1 = fbox1(window);
    f2 = fbox2(window);
    f3 = fbox3(window);
    f4 = fbox4(window);
    f5 = fbox5(window);
    features = [f1 f2 f3 f4 f5];
    
end