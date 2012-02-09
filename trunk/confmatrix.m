function [tp,fn,fp,tn]=confmatrix(guesses,actual)
    posguesses = find(guesses==1);
    negguesses = find(guesses==0);
    
    tp = length(find(actual(posguesses) == 1));
    fp = length(find(actual(posguesses) == 0));
    
    fn = length(find(actual(negguesses) == 1));
    tn = length(find(actual(negguesses) == 0));
end