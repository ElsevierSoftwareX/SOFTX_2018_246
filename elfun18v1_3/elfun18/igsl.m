function result = igsl(x)
%IGSL  Inverse of Gauss' lemniscate sin.
%
%                 x
%                | |  
%                |       dt
%   invsl(x) =   |  ---------------
%                |  sqrt((1 - t^4)) 
%              | | 
%               0
%
%   Functions called:
%       rf
%
%   Matlab functions called:
%       abs, isnan
%
%   Reference:
%       https://www.encyclopediaofmath.org/index.php/Lemniscate_functions
%       https://archive.lib.msu.edu/crcmath/math/math/l/l204.htm

    if isnan(x) || abs(x) > 1
        result = NaN;
    elseif x == 0
        result = 0;
    else
        result = x*rf((1 - x)*(1 + x), 1 + x*x, 1);
    end

end

