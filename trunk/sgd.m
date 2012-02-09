function beta=sgd(data,lambda0,mu,scheduletype)
	X = data(:,1:size(data,2)-1);
	y = data(:,size(data,2));
	[n,d] = size(X);
	beta = zeros(1,d);
	error = 1;
	%epoch = 0;
	threshold = .001;
	c = 10;
	for epoch=1:50
		epoch
		lambda = lambda0/c^epoch;
		%lambda = lambda0/(1+lambda0*c*epoch);
		for i=1:n
			x_i = X(i,:);
			y_i = y(i);
			p_i = p(x_i,beta);
			yp = y_i - p_i;
            nbeta = beta + lambda*(yp*x_i - 2*mu*beta);
            %error = error + sum((nbeta - beta).^2);
            beta = nbeta;
        end
    end
end
