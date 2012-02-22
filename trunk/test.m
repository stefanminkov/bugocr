function [tp,fn,fp,tn,guesses]=test(data,beta)
    X = data(:,1:(size(data,2)-1));
	y = data(:,size(data,2));
    [n,d] = size(X);
    
    guesses = zeros(n,1);
    for i=1:n
        x_i = X(i,:);
        if p(x_i,beta) > .5
            guesses(i) = 1;
        end
    end
    
    [tp,fn,fp,tn] = confmatrix(guesses,y);
end