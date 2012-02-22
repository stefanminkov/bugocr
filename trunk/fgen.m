function fs=fgen(window)
    fcollection = cell(3,1);
    fcollection{1} = @(block) sum(block(:))/length(block(:));
    fcollection{2} = @(block) var(block(:));
    fcollection{3} = @(block) mofgradient(block);
    
    fs = zeros(size(fcollection,1),15);
    for i=1:length(fcollection)
        func = fcollection{i};
        fs(i,:) = fbox(window,func);
    end
    
    fs = reshape(fs,size(fcollection,1)*15,1);
end