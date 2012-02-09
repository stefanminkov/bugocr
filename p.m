function prob=p(x,beta)
    prob = 1/(1+exp(-dot(x,beta)));
end