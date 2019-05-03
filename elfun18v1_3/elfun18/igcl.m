function result = igcl(x)
%IGSL  Inverse lemniscate cosine function.
%
%                 1
%                | |  
%                |       dt
%   invcl(x) =   |  ---------------
%                |  sqrt((1 - t^4)) 
%              | | 
%               x
%
%   Functions called:
%       melK, rf
%
%   Matlab functions called:
%       abs, isnan
%
%   Reference:
%       http://mathworld.wolfram.com/LemniscateFunction.html
%       https://archive.lib.msu.edu/crcmath/math/math/l/l204.htm

    if isnan(x) || abs(x) > 1
        result = NaN;
        return
    end

    if x == 1
        result = 0;
    else
        result = melK(-1) - x*rf((1 - x)*(1 + x),1 + x*x,1);
    end

end

