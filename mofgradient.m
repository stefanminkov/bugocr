function f=mofgradient(block)
    m = gradient(block);
    f = var(m(:));
end