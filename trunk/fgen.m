function fs=fgen(bb)
    fcollection = cell(3,1);
    fcollection{1} = @(block) sum(block(:))/length(block(:));
    fcollection{2} = @(block) var(block(:));
    fcollection{3} = @(block) mofgradient(block);
    
    % First set
    fs = zeros(size(fcollection,1),15);
    for i=1:length(fcollection)
        func = fcollection{i};
        fs(i,:) = fbox(bb,func);
    end
    
    fs = fs(:);
    
    h = hog(bb,20,15);
    
    fs = [fs; h(:)];
    
    %mapping=getmapping(8,'u2');
    %lbpf = lbp(bb,1,8,mapping,'h');
    %fs = [fs; lbpf'];   
end