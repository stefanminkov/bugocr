function [data,maxout,minout]=normalize_feature(data,maxin,minin)
	% This file will walk through each column of the feature table and find the range for the value.
	% This serves the purpose to map continuous data into the [0-1] range
	rows = size(data,1);
    
    if (maxin == 0) & (minin == 0)
        maxout = max(data,[],1);
        minout = min(data,[],1);
    else
        maxout = maxin;
        minout = minin;
    end
    
    maxM = repmat(maxout,rows,1);
    minM = repmat(minout,rows,1);
    
    data = (data - minM)./(maxM-minM);
end

%Test case
%a = [1 2 3; 4 3 1; 20, -1, 40]
% >> normalize_feature(a,0,0)
% 
% ans =
% 
%          0    0.7500    0.0513
%     0.1579    1.0000         0
%     1.0000         0    1.0000
% >> normalize_feature(a,[10,10,10],[1,1,1])
% 
% ans =
% 
%          0    0.1111    0.2222
%     0.3333    0.2222         0
%     2.1111   -0.2222    4.3333