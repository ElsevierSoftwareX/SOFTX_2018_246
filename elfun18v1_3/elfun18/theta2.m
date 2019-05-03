function f = theta2(q)
%  theta2(0,q) from AMath

  if isnan(q) || isinf(q) || q < 0 || q >= 1
    f = NaN;
    return
  end
      
  if q <0.1 
      f = theta2small(q);
  else 
    z = log(q);
    s = exp(pi^2/z);
    s = theta3small(-s);
    f = s*sqrt(-pi/z);
  end
  
end

