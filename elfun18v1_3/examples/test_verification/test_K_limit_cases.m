for n = 1:15
    m = 1-10^(-n);
    rer = (melK(m)/ellipticK(m)-1);
    fprintf('%16g %16g %16g %16g\n',n,m,rer/eps,log10(rer))
end