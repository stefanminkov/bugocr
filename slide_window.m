function bbs=slide_window(I)
    [Ir,Ic,~] = size(I);
    wsize = [150 50];
    bbs = [];
    for w=1:size(wsize,1)
        dc = wsize(w,1);
        dr = wsize(w,2);
        bbs_i = zeros(Ir*Ic,4);
        k = 1;
        for r=1:floor(dr/4):Ir
            for c=1:floor(dc/4):Ic
                if c+dc < Ic &&  r+dr < Ir
                    bbs_i(k,:) = [c r dc dr];
                    k = k + 1;
                end
            end
        end
        
        bbs = [bbs; bbs_i(1:k-1,:)];
    end
end