function bbs=slide_window(I)
    [Ir,Ic,a_] = size(I);
    dr = floor(Ir/10);
    dc = floor(Ic/5);
    bbs = zeros(Ir*Ic,4);
    k = 1;
    for r=1:40:Ir-dr
        r
        for c=1:40:Ic-dc
            if c+dc < Ic &&  r+dr < Ir
                bbs(k,:) = [c r dc dr];
                k = k + 1;
            end
        end
    end
    bbs = bbs(1:k-1,:);
end