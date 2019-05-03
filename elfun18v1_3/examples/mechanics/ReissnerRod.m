close all
ex =1;
% Data
alpha = NaN;
switch ex
    case 1
        psi1   = pi/2;  %
        lambda = 15;    % generalized slenderness > 0
        nu     = 1;     % stiffness ratio [-1..1]
        omega  = 10;    % = F*L^2/EI  load factor
        kappa1 = 0;     % = M*L/EI    end moment
    case 2
        psi1   = pi/3;  %
        lambda = 10;    % generalized slenderness > 0
        nu     = -1;     % stiffness ratio [-1..1]
        omega  = 4;    % = F*L^2/EI  load factor
        kappa1 = 1;     % = M*L/EI    end moment
    case 3
        psi1   = pi/3;  %
        lambda = 10;    % generalized slenderness > 0
        nu     = -1;     % stiffness ratio [-1..1]
        omega  = 5;    % = F*L^2/EI  load factor
        kappa1 = 8.3852549;     % = M*L/EI    end moment
    case 4
        psi1   = pi/3;  %
        lambda = 10;    % generalized slenderness > 0
        nu     = -1;     % stiffness ratio [-1..1]
        omega  = 2;    % = F*L^2/EI  load factor
        kappa1 = 5;     % = M*L/EI    end moment
    case 53
        F = 10;
        L = 1;
        EA = 20^21;
        EI = 10;
        GA = 10;
        lambda = sqrt(L^2/EI/(1/GA + 1/EA));    % generalized slenderness > 0
        nu     = (GA - EA)/(GA + EA);    % stiffness ratio [-1..1]
        omega  = sqrt(F*L/EI); % = F*L^2/EI  load factor
        kappa1 = 0;     % = M*L/EI    end moment   
        alpha = pi/2;
        psi1 = 0; % ????
        
end
cantilever( psi1, lambda, nu, omega, kappa1,alpha)

function cantilever( psi1, lambda, nu, omega, kappa1, alpha)
% Cantilever under follower force ([1] Sec 5.1)
%
% Reference:
%  [1]  M.Batista - A closed-form solution for Reissner planar finite-strain 
%       beam using Jacobi elliptic functions, International Journal of Solids
%       and Structures 87 (2016) 153–166

% Calculate constants
eta2   = (omega/lambda)^2;
if isnan(alpha)
    key = 1;
    if kappa1 ~= 0
        k  = 2*(sin(psi1/2)^2*(1 - nu*eta2*cos(psi1/2)^2) + (kappa1/2/omega)^2);  % Eq 50
        k  = k/(1 - nu*eta2 + sqrt((1 - nu*eta2*cos(psi1))^2 + nu*(kappa1/lambda)^2));
        k  = sqrt(k);
    else
        k  = sin(psi1/2);                                     % Eq 53
    end
    m2     = nu*eta2*k^2/(1 - nu*eta2*(1 - k^2));             % Eq 34a
    omega1 = omega*sqrt(1 + nu*eta2*(2*k^2 - 1));             % Eq 34b
    k1     = sqrt((k^2 + m2)/(1 + m2));                       % Eq 39    
    if kappa1 ~= 0
        C0 = - omega1 + ijcn(kappa1/(omega1*k*sqrt(1 + m2) + ...
            sqrt((omega*k)^2-m2*((omega*k)^2 +  kappa1^2))),k1);  % Eq 69
    else
        C0 = -omega1 + elK(k1);                               % Eq 67
    end
    alpha  = 2*asin(k*jsn(C0,k1)/sqrt(1 + m2*jcn(C0,k1)^2));      % Eq 65
else
    key = 2;
    k1 = fun(0);
    k = fzero(@fun,0.91);
    m2     = nu*eta2*k^2/(1 - nu*eta2*(1 - k^2));             % Eq 34a
    omega1 = omega*sqrt(1 + nu*eta2*(2*k^2 - 1));             % Eq 34b
    k1     = sqrt((k^2 + m2)/(1 + m2));                       % Eq 39      
    C0 = ijsn( sin(alpha/2)*sqrt((1 + m2)/(k^2 + m2*sin(alpha/2)^2)),k1); %Eq 70
end


[ x, y, phi ] = shape( 0:0.01:1 );

if nu == 1  % shearless beam
    L = 1 - (1 + 2*k^2/m2)*eta2 + 2*k^2/m2/omega1*eta2*...
        (jlambda(omega1 + C0,m2/(1 + m2),k1) - jlambda(C0,m2/(1 + m2),k1));
else
    L = NaN;
end
fprintf('%s = %.16g\n','C',     C0)
fprintf('%s = %.16g\n','alpha', alpha)
fprintf('%s = %.16g\n','L',     L)
fprintf('%s = %.16g\n','X', x(end))
fprintf('%s = %.16g\n','Y', y(end))
figure
hold on
% center line
plot(x,y,'k')
s = -1:0.1:1;
h = 1/lambda/2; % aux. beam thickness
% plot outer lines
plot(x + h*sin(phi),y - h*cos(phi),'k','LineWidth',2)
plot(x - h*sin(phi),y + h*cos(phi),'k','LineWidth',2)
% plot section
for n = 1:9
    [x0,y0,phi0] = shape(0.1*n);
    plot(x0 + h*sin(phi0)*s,y0 - h*cos(phi0)*s,'k');
end
% plot end sections
[x0,y0,phi0] = shape(0);
plot(x0 + h*sin(phi0)*s,y0 - h*cos(phi0)*s,'k','LineWidth',4);
[x0,y0,phi0] = shape(1);
plot(x0 + h*sin(phi0)*s,y0 - h*cos(phi0)*s,'k');
% plot force
if key == 1
quiver(x0 + h*sin(phi0),y0 - h*cos(phi0), -h*sin(phi0), h*cos(phi0),...
    4,'r','Linewidth',1.5);
else
    phi0 = alpha-pi/2;
quiver(x0 + h*sin(phi0),y0 - h*cos(phi0), -h*sin(phi0), h*cos(phi0),...
    2,'r','Linewidth',1.5);
end
txt = sprintf('%s = %g  %s = %g\n%s = %g  %s = %g  %s = %g%s',...
    '\lambda',lambda,'\nu',nu,'\omega',omega,'\kappa_{1}',kappa1,...
    '\psi_{1}',psi1*180/pi,'^{0}');
text(0.2,0.2,txt,'FontSize',14);
axis equal
grid on
hold off

    function [ x, y, phi ] = shape( s )
        C = C0*ones(size(s));
        xx = ((nu - 1)*omega^2*s/lambda^2)/ 2 + 2*omega1/(omega^2)*...
            ((EllipticE(k1) / EllipticK(k1) - 1/2)*omega1*s + ...
            JacobiZeta(omega1*s + C, k1) - JacobiZeta(C, k1) - ...
            (m2*(JacobiSN(omega1*s + C, k1).*JacobiCN(omega1*s + C, k1).*...
            JacobiDN(omega1*s + C, k1)./(1 + m2*JacobiCN(omega1*s + C, k1).^ 2)...
            - JacobiSN(C, k1).* JacobiCN(C, k1).*JacobiDN(C, k1)./...
            (1 + m2*JacobiCN(C, k1).^2))));     % Eq 43a
        yy = -(2*omega1*k*sqrt(1 + m2)/omega^2)*(JacobiCN(omega1*s + C,k1)./...
            (1 + m2*JacobiCN(omega1*s + C, k1).^ 2) -  JacobiCN(C, k1)./...
            (1 + m2*JacobiCN(C, k1).^ 2));      % Eq 43b
        x  =  xx*cos(alpha) + yy*sin(alpha);    % Eq 19a
        y  = -xx*sin(alpha) + yy*cos(alpha);    % Eq 19b
        phi = 2*asin(k*JacobiSN(omega1*s + C,k1)./...
            sqrt(1 + m2*JacobiCN(omega1*s + C,k1).^2)) - alpha;  % Eq 41, 22
    end

    function f = fun( kk)
        mm2     = nu*eta2*kk^2/(1 - nu*eta2*(1 - kk^2));             % Eq 34a
        oomega1 = omega*sqrt(1 + nu*eta2*(2*kk^2 - 1));             % Eq 34b
        kk1     = sqrt((kk^2 + mm2)/(1 + mm2));                       % Eq 39
        CC0 = ijsn( sin(alpha/2)*sqrt((1 + mm2)/(kk^2 + mm2*sin(alpha/2)^2)),kk1); %Eq 70
        f = oomega1 + CC0 - elK(kk1);        
    end

end


