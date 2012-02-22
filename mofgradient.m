function f=mofgradient(block)
    [tx ty] = gradient(block);
    m = sqrt(ty.^2+tx.^2);
    f = var(m(:));
end