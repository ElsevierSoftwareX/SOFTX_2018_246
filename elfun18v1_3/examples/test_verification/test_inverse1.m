k = 0.73
K=elK(k)
x = 0.25*K
fprintf('cd %.16g \n',log10(ijcd(jcd(x,k),k)/x-1));
fprintf('cn %.16g \n',log10(ijcn(jcn(x,k),k)/x-1));
fprintf('cs %.16g \n',log10(ijcs(jcs(x,k),k)/x-1));
fprintf('dc %.16g \n',log10(ijdc(jdc(x,k),k)/x - 1));
fprintf('dn %.16g \n',log10(ijdn(jdn(x,k),k)/x - 1));
fprintf('ds %.16g \n',log10(ijds(jds(x,k),k)/x - 1));
fprintf('nc %.16g \n',log10(ijnc(jnc(x,k),k)/x - 1));
fprintf('nd %.16g \n',log10(ijnd(jnd(x,k),k)/x - 1));
fprintf('ns %.16g \n',log10(ijns(jns(x,k),k)/x - 1));
fprintf('sc %.16g \n',log10(ijsc(jsc(x,k),k)/x - 1));
fprintf('sd %.16g \n',log10(ijsd(jsd(x,k),k)/x - 1));
fprintf('sn %.16g \n',log10(ijsn(jsn(x,k),k)/x - 1));
m = k^2;
fprintf('mcd %.16g \n',log10(mijcd(mjcd(x,m),m)/x - 1));
fprintf('mcn %.16g \n',log10(mijcn(mjcn(x,m),m)/x - 1));
fprintf('mcs %.16g \n',log10(mijcs(mjcs(x,m),m)/x - 1));
fprintf('mdc %.16g \n',log10(mijdc(mjdc(x,m),m)/x - 1));
fprintf('mdn %.16g \n',log10(mijdn(mjdn(x,m),m)/x - 1));
fprintf('mds %.16g \n',log10(mijds(mjds(x,m),m)/x - 1));
fprintf('mnc %.16g \n',log10(mijnc(mjnc(x,m),m)/x - 1));
fprintf('mnd %.16g \n',log10(mijnd(mjnd(x,m),m)/x - 1));
fprintf('mns %.16g \n',log10(mijns(mjns(x,m),m)/x - 1));
fprintf('msc %.16g \n',log10(mijsc(mjsc(x,m),m)/x - 1));
fprintf('msd %.16g \n',log10(mijsd(mjsd(x,m),m)/x - 1));
fprintf('msn %.16g \n',log10(mijsn(mjsn(x,m),m)/x - 1));

fprintf('gcl %.16g \n',log10(igcl(gcl(x))/x-1));
fprintf('gsl %.16g \n',log10(igsl(gsl(x))/x-1));
fprintf('gd  %.16g \n',log10(igd (gd (x))/x-1));