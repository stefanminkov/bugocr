function fs=fgen(window)
    fcollection = cell(3,1);
    fcollection{1} = @(block) sum(block(:))/length(block(:));
    fcollection{2} = @(block) var(block(:));
    fcollection{3} = @(block) mofgradient(block);
    
    % First set
    fs = zeros(size(fcollection,1),15);
    for i=1:length(fcollection)
        func = fcollection{i};
        fs(i,:) = fbox(window,func);
    end
    
    % Histogram of gradient
    fs = fs(:);
    intensegrad = hist(window(:),50);
    fs = [fs; intensegrad'];
    
    mapping=getmapping(8,'u2');
    lbpf = lbp(window,1,8,mapping,'h');
    fs = [fs; lbpf'];   
end