classdef (CaseInsensitiveProperties = false, ...
        TruncatedProperties = true ) elfun
    %ELFUN Elliptic functions viewer
   
    
    properties (Constant)
        fBulirsch = {'BulirschEL1','BulirschCEL3'}
        fBulirsch1 = {'BulirschCEL1'}
        fCarlson  = {'CarlsonRC','GaussAGM'}
        fGauss = { ...
            'GaussCL','GaussSL','InverseGaussCL','InverseGaussSL',...
            'GudermannGD', 'InverseGudermannGD'}
        fEllipticInt = { ...
            'EllipticB','EllipticD',...
            'EllipticE','EllipticF','EllipticPi',...
            'EllipticCPi',...
            'mEllipticB','mEllipticD',...
            'mEllipticE','mEllipticF','mEllipticPi',...
            'mEllipticCPi'}            
        fEllipticInt1 = { ...
            'EllipticK',...
            'EllipticCE','EllipticCK','EllipticC','mEllipticC',...
                        'mEllipticK',...
            'mEllipticCE','mEllipticCK'
            }
        fJacobiPQ = { ...
            'JacobiAM',...
            'JacobiCD','JacobiCN','JacobiCS',...
            'JacobiDC','JacobiDN','JacobiDS',...
            'JacobiNC','JacobiND','JacobiNS',...
            'JacobiSC','JacobiSD','JacobiSN',...
            'JacobiEpsilon','JacobiZeta',...
            'mJacobiAM',...
            'mJacobiCD','mJacobiCN','mJacobiCS',...
            'mJacobiDC','mJacobiDN','mJacobiDS',...
            'mJacobiNC','mJacobiND','mJacobiNS',...
            'mJacobiSC','mJacobiSD','mJacobiSN',...
            'mJacobiEps','mJacobiZeta'...   
            }
        fInverseJacobiPQ = { ...
            'InverseJacobiAM', ...
            'InverseJacobiCD','InverseJacobiCN','InverseJacobiCS',...
            'InverseJacobiDC','InverseJacobiDN','InverseJacobiDS',...
            'InverseJacobiNC','InverseJacobiND','InverseJacobiNS',...
            'InverseJacobiSC','InverseJacobiSD','InverseJacobiSN',...
            'mInverseJacobiAM', ...
            'mInverseJacobiCD','mInverseJacobiCN','mInverseJacobiCS',...
            'mInverseJacobiDC','mInverseJacobiDN','mInverseJacobiDS',...
            'mInverseJacobiNC','mInverseJacobiND','mInverseJacobiNS',...
            'mInverseJacobiSC','mInverseJacobiSD','mInverseJacobiSN'
            }
        fJacobiTheta = { ...
            'JacobiTheta1','JacobiTheta2','JacobiTheta3','JacobiTheta4',...
            'EllipticNome','mEllipticNome','EllipticModulus'}
        fLegendre = { ...
            'pEllipticB','pEllipticD',...
            'pEllipticE','pEllipticF',...
            'mpEllipticB','mpEllipticD',...
            'mpEllipticE','mpEllipticF',...
            'mpJacobiZeta','mHeumanLambda',...
            'pJacobiZeta','HeumanLambda'}
    end
    
    % Preferences (data)
    properties (Access = public)
        nptsmax(1,1) uint16 {mustBeGreaterThan(nptsmax,99)} = 25000;     % maximum number of points along curve
        npts3d(1,1) uint16 {mustBeGreaterThan(npts3d,99),mustBeLessThan(npts3d,1001)} = 500;     % maximum number of points along curve
        mmin(1,1)  double {mustBeFinite} = -2;     % minimum parameter limit
        mmax(1,1)  double {mustBeFinite} =  2;     % maximum parameter limit
        nmin(1,1)  double {mustBeFinite} = -2;     % minimum characteristic limit
        nmax(1,1)  double {mustBeFinite} =  2;     % maximum characteristic limit
        qmin(1,1)  double {mustBeFinite} =  0;     % minimum nome limit
        qmax(1,1)  double {mustBeFinite} =  1;     % maximum nome limit
        xxmin(1,1) double {mustBeFinite} = -8;     % minimum x/phi-axis limit
        xxmax(1,1) double {mustBeFinite} =  8;     % maximum x/phi axis limit
        yymin(1,1)  double {mustBeFinite} = -8;     % minimum y-axis limit
        yymax(1,1)  double {mustBeFinite} =  8;     % maximum y-axis limit
        zzmin(1,1)  double {mustBeFinite} = -4;     % minimum z-axis limit
        zzmax(1,1)  double {mustBeFinite} =  4;     % maximum z-axis limit
        kkmin(1,1)  double {mustBeFinite} = -4;     % minimum z-axis limit
        kkmax(1,1)  double {mustBeFinite} =  4;     % maximum z-axis limit
    end
    
    % Current data
    properties (Access = public)
        fun = 'JacobiSN';                  % current function name
        grtype {mustBeMember(grtype,{'plot','contour','surf','surfc'})} = 'plot';
        fix {mustBeMember(fix,{'x','k','q'})} = 'x';        
        usexscale(1,1)  logical = false;     % on/off
        useyscale(1,1)  logical = false;     % on/off
        usezscale(1,1)  logical = false;    % on/off
        autozoom(1,1)   logical = false;
        autoplot3d(1,1) logical = false
        cont(1,1)       logical = false
        sliceplot(1,1)  logical = true;
        addinverse(1,1) logical = false;
        symk(1,1)       logical = true;
        usem(1,1)       logical = false;
          usetri(1,1)       logical = false;
        transp(1,1)     double  = 100;
    end
    
    properties (Access = public)
        npts(1,1) uint16 {mustBeFinite} = 1000  % current number of points allong curve
    end
    
    properties (Access = public)
        xmin(1,1)   double {mustBeFinite} = -2; % minimum x/phi-axis limit
        xmax(1,1)   double {mustBeFinite} =  2; % maximum x/phi axis limit
        ymin(1,1)   double {mustBeFinite} = -4; % minimum x/phi-axis limit
        ymax(1,1)   double {mustBeFinite} =  4; % maximum x/phi axis limit
        kmin(1,1)   double {mustBeFinite} = -2; % minimum modulus limit
        kmax(1,1)   double {mustBeFinite} =  2; % maximum modulus limit
        k(1,1)      double  = 0.5      % current modulus
        m(1,1)      double  = 0.5      % currentparameter
        q(1,1)      double  = 0.5      % current nome
        n(1,1)      double  = 0.5      % current characteristic
        x(1,1)      double  = 0        % current x
    end
    
    properties (SetAccess = private, GetAccess = public)
        data   = 'xk'                           % type of data
        fclass = 'JacobiPQ'                     % function class
        xscale(1,1) double {mustBeFinite} = 1   % current scale along x-axis
        yscale(1,1) double {mustBeFinite} = 1   % current scale along y-axis
        zscale(1,1) double {mustBeFinite} = 1   % current scale along z-axis
    end
    
    properties (Dependent, SetAccess = private, GetAccess = public)
        y(1,1) double  = 0       % current y
        z(1,1) double  = 0       % current z
        fun1 = 'InverseJacobiSN';
    end
    
    methods
        
        % BASIC FUNCTIONS --------------
        
        function obj = elfun()
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            %obj.Property1 = inputArg1 + inputArg2;
        end
        
        function obj = set( obj, propName, val)
            obj.(propName) = val;
        end
        
        function val = get( obj, propName)
            val = obj.(propName);
        end
        
        % SET FUNCTIONS -----------------
        
        function obj = set.transp( obj, fa)
        % Set transparency
            if fa > 0 && fa <= 100
                obj.transp = fa;
            end
        end
        
        function obj = set.usem( obj, bm)
        % Set parameter
            if bm
                switch obj.fclass
                    case {'JacobiPQ','InverseJacobiPQ','EllipticInt','EllipticInt1','Legendre'}
                        obj.usem = bm;
                    otherwise
                        obj.usem = false;
                end
            else
                obj.usem = false;
            end
        end
        
        function obj = set.fun( obj, fun)
            if ismember(fun,obj.fGauss)
                obj.fun    = fun;
                obj.data   = 'x';
                obj.fclass = 'Gauss';
            elseif ismember(fun,obj.fBulirsch)
                obj.fun = fun;
                obj.data   = 'xk';
                obj.fclass = 'Bulirsch';
            elseif ismember(fun,obj.fBulirsch1)
                obj.fun = fun;
                obj.data   = 'k';
                obj.fclass = 'Bulirsch1';
            elseif ismember(fun,obj.fCarlson)
                obj.fun = fun;
                obj.data   = 'xk';
                obj.fclass = 'Carlson';
            elseif ismember(fun,obj.fEllipticInt)
                obj.fun = fun;
                obj.data   = 'xk';
                obj.fclass = 'EllipticInt';
            elseif ismember(fun,obj.fEllipticInt1)
                obj.fun = fun;
                obj.data   = 'k';
                obj.fclass = 'EllipticInt1';
            elseif ismember(fun,obj.fInverseJacobiPQ)
                obj.fun    = fun;
                obj.data   = 'xk';
                obj.fclass = 'InverseJacobiPQ';
            elseif ismember(fun,obj.fJacobiPQ)
                obj.fun    = fun;
                obj.data   = 'xk';
                obj.fclass = 'JacobiPQ';
                
            elseif ismember(fun,obj.fJacobiTheta)
                obj.fun   = fun;
                if strcmp(obj.fun,'EllipticNome') || ...
                    strcmp(obj.fun,'EllipticModulus')
                    obj.data = 'k';
                else
                    obj.data = 'xq';
                end
                obj.fclass = 'JacobiTheta';
            elseif ismember(fun,obj.fLegendre)
                obj.fun    = fun;
                obj.data   = 'pk';
                obj.fclass = 'Legendre';
            else
                warning('Invalid fun %s',fun)
            end
        end
        
        % GET FUNCTIONS -----------------
        
        function y = get.y( obj)
            if obj.usem
                ffun = str2func( strcat('m',obj.fun));
            else
                ffun = str2func(obj.fun);
            end
            try
                switch obj.data
                    case 'x'
                        y = ffun(obj.x);
                    case 'k'
                        y = ffun(obj.k);
                    case {'xk','pk'}
                        y = ffun(obj.x,obj.k);
                    case 'xq'
                        y = ffun(obj.x,obj.k);
                end
            catch
                y = NaN;
            end
        end
        
        function fun1 = get.fun1( obj)
        % get inverse function
            switch obj.fclass
                case 'JacobiPQ'
                    fun1  = strcat('Inverse',obj.fun);                    
                case 'InverseJacobiPQ'
                    fun1  = strrep(obj.fun,'Inverse','');
                case 'Gauss'
                    if ~strcmp(obj.fun,'GaussAGM')
                        fun1  = strcat('Inverse',obj.fun);
                    end
                otherwise
                    fun1 = '';
            end
            if ~isempty(fun1)
                if obj.usem
                    fun1 = strcat('m',fun1);
                end
            end
        end
        
        % MISC. FUNCTIONS -----------------
        
        function plot( obj, bcopy)
            
            
            if nargin < 2
                bcopy = false;
            end
            
           %   ;
              
            % get function
            if obj.usem
                ffun = str2func( strcat('m',obj.fun)); 
            else
                ffun = str2func(obj.fun);
            end
            
            % calculate coordinates
            switch obj.fix
                case 'x'
                    xx = linspace(obj.xmin,obj.xmax,obj.npts);
                    switch obj.data
                        case {'x','k'}
                            ff = ffun(xx);
                        case {'xk','pk'}
                            ff = ffun(xx,obj.k);
                        case 'xq'
                            ff = ffun(xx,obj.k);
                    end
                    
                    % set data for x-axis
                    if strcmp(obj.data,'pk')
                        xlab = '\phi';
                    else
                        xlab = 'x';
                    end
                    obj.xscale = 1;
                    if obj.usexscale
                        switch obj.fclass
                            case 'JacobiPQ'
                                if abs(obj.k) ~= 1
                                    obj.xscale = elK(obj.k);
                                    xlab = 'x/K';
                                end
                            case 'Legendre'
                                obj.xscale = pi;
                                xlab = '\phi/\pi';
                        end
                    end
                    if strlength(obj.data) == 2
                        
                        txt = sprintf('(x,%g)',obj.k);
                    else
                        txt = '(x)';
                    end
                case 'k'
                    kk = obj.kmax;
                    kk1 = obj.kmin;
                    xx = linspace(kk1,kk,obj.npts);
                    switch obj.data
                        case 'k'
                            ff = ffun(xx);
                        case {'xk','pk'}
                            ff = ffun(obj.x,xx);
                        case 'xq'
                            ff = ffun(obj.x,xx);
                    end
                    
                    % set data for x-axis
                    if obj.usem
                        xlab = 'm';
                        obj.xscale = 1;
                        if strlength(obj.data) == 2
                            txt = sprintf('(%g,m)',obj.x);
                        else
                            txt = '(m)';
                        end
                    else
                        xlab = 'k';
                        obj.xscale = 1;
                        if strlength(obj.data) == 2
                            txt = sprintf('(%g,k)',obj.x);
                        else
                            txt = '(k)';
                        end
                    end
            end
            
            
            ff=cleanFun2(obj,ff);
            
            % set data for y-axis
            ylab = 'y';
            obj.yscale = 1;
            if obj.useyscale
                switch obj.fclass
                    case 'JacobiPQ'
                        if strcmp(obj.fun,'JacobiAM')
                            obj.yscale = pi;
                            ylab = 'y/\pi';
                        end
                    case 'InverseJacobiPQ'
                        if abs(obj.k) ~= 1
                            obj.yscale = elK(obj.k);
                            ylab = 'y/K';
                        end
                end
            end
            
            fmax = max(ff);
            fmin = min(ff);
            xmin = min(xx);
            xmax = max(xx);
            
            % plot begin
            if bcopy
                fh = figure('Visible','off');
            else
                cla reset
                zoom on
            end
            hold on
            
            if all(isnan(ff))
                %    warning('Empty plot')
            end
            
            % plot
            plot( xx/obj.xscale, ff/obj.yscale, 'LineWidth',2);
            
            % plot inverse
            if obj.addinverse
                if ~isempty(obj.fun1) && obj.fix == 'x'
                    try
                        xx = linspace(fmin,fmax,obj.npts);
                        ffun1 = str2func(obj.fun1);
                        switch obj.data
                            case 'x'
                                ff1 = ffun1(xx);
                            case {'xk','pk'}
                                ff1 = ffun1(xx,obj.k);
                                
                        end
                        ff1=cleanFun2(obj,ff1);
                        plot( ff1/obj.xscale,xx/obj.yscale,  'LineWidth',2);
                    catch
                    end
                end
            end
            
            % zoom y-axis
            ymn = fmin;
            ymx = fmax;
            if ~obj.autozoom
                if fmax > obj.ymax
                    ymx = obj.ymax;
                end
                if fmin < obj.ymin
                    ymn = obj.ymin;
                end
            else
                if fmax > obj.yymax
                    ymx = obj.yymax;
                end
                if fmin < obj.yymin
                    ymn = obj.yymin;
                end
            end
            
            if ymn < ymx
                ylim([ymn/obj.yscale, ymx/obj.yscale]);
            end
            
            % add title
            titl = strcat(obj.fun,txt);
            title(titl,'FontWeight','normal')
            
            % Set labels
            xlabel(xlab)
            ylabel(ylab)
            
            % Draw axes (limits are already scaled)
            xlimv = get(gca,'XLim');
            ylimv = get(gca,'YLim');
            if ymn < 0
                plot( xlimv,[ 0 0],'Color','k')
            end
            if xmin < 0
                plot( [0 0], ylimv,'Color','k')
            end
            
            % add grid
            grid on
            
            % add point
            if ~isnan(obj.x)
                switch obj.fix
                    case 'x'
                        if obj.xmin <= obj.x && obj.x <= obj.xmax
                            scatter(obj.x/obj.xscale,obj.y/obj.yscale,...
                                60,'Filled','LineWidth',1.5)
                        end
                    case 'k'
                        if obj.kmin <= obj.k && obj.k <= obj.kmax
                            scatter(obj.k,obj.y/obj.yscale,...
                                60,'Filled','LineWidth',1.5)
                        end
                end
            end
            
            % add text
            %text(-2,-0.8,txt)
            
            % plot end
            hold off
            
            if bcopy
                print(fh,obj.fun,'-djpeg','-r600');
                delete(fh);
                return
            end
            
            %delete(hw)
            % plot 3d graph
            if obj.autoplot3d
                plot3d(obj)
            end
            
            drawnow nocallbacks
            
        end
        
        %-------------------------------------------------------
        
        function plot3d( obj)
            
            % check object
            if strlength(obj.data) ~= 2
                return
            end
            
            if obj.cont
                plot2d(obj)
                return
            end
            
            hw = waitbar(0,'Please wait...');
            steps = 4;
            
            % get function
            if obj.usem
                obj.fun = strcat('m',obj.fun);
            end
            ffun = str2func(obj.fun);
            
            % calculate coordinates
            [x1, x2, y1, y2] = FunctionRange(obj);
            x1 = max(x1,obj.xmin);
            x2 = min(x2,obj.xmax);
            kk = obj.kmax;
            kk1 = obj.kmin;
            y1 = max(y1, kk1);
            y2 = min(y2, kk);
            x  = linspace(x1, x2, obj.npts3d);
            kc = linspace(y1, y2, obj.npts3d);
            [X,KC] = meshgrid(x,kc);
            ff = ffun(X,KC);
            ff=cleanFun3( obj, ff);
            
            waitbar(1/steps)
            
            % start plot
            figure(1);
            
            % keep figure position
            pos = get(gcf, 'Position');
            if pos(1) < 50
                pos(1) = 50;
            end
            if pos(2) > 300
                pos(2) = 300;
            end
            pos(3) = 560;
            pos(4) = 560;
            set(gcf, 'Position', pos);
            
            clf
            hold on
            
            %  if isempty(gcf)
            view(3)
            %  end
            
            % add title
            title(obj.fun)
            
            xlab = 'x';
            obj.xscale = 1;
            if obj.usexscale
                switch obj.fclass
                    case 'JacobiPQ'
                        %  if abs(obj.k) ~= 1
                        %      obj.xscale = elK(obj.k);
                        %      xlab = 'x/K';
                        %  end
                    case 'Legendre'
                        %   obj.xscale = pi;
                        xlab = '\phi';
                end
            end
            % set data for y-axis
            zlab = 'z';
            obj.yscale = 1;
            if obj.useyscale
                switch obj.fclass
                    case 'JacobiPQ'
                        if strcmp(obj.fun,'JacobiAM')
                            % obj.yscale = pi;
                            % zlab = 'f/\pi';
                        end
                    case 'InverseJacobiPQ'
                        if abs(obj.k) ~= 1
                            %  obj.yscale = elK(obj.k);
                            %  zlab = 'f/K';
                        end
                end
            end
            
            xlabel(xlab)
            if obj.usem
                ylab = 'm';
            else
                ylab = 'k';
            end
            ylabel(ylab)
            zlabel(zlab)
            
            fa = obj.transp/100;
            if obj.usetri
                tri = delaunay(X/obj.xscale,KC);
                hs = trimesh(tri,X/obj.xscale,KC,ff/obj.yscale,...
                    'EdgeColor','none',...
                    'FaceColor','interp',...
                    'FaceLighting','gouraud','FaceAlpha',fa);
            else
                
                hs = surfc(X/obj.xscale,KC,ff/obj.yscale,...
                    'EdgeColor','none',...
                    'FaceColor','interp',...
                    'FaceLighting','gouraud','FaceAlpha',fa);
            end
            zmn = min(min(ff));
            zmx = max(max(ff));
            if ~obj.autozoom
                if zmn < obj.ymin
                    zmn = obj.ymin;
                end
                if zmx > obj.ymax
                    zmx = obj.ymax;
                end
            else
                if zmn < obj.yymin
                    zmn = obj.yymin;
                end
                if zmx > obj.yymax
                    zmx = obj.yymax;
                end
            end
                  
            zmn = zmn/obj.yscale;
            zmx = zmx/obj.yscale;
            try
            hc = hs(2);
            hc.ContourZLevel = zmn;
            hc.LineWidth = 1;
            hc.LevelList = zmn:(zmx - zmn)/10:zmx;
            end
            zlim([zmn,zmx])
            caxis([zmn,zmx])
            grid on
            hold off
            
            waitbar(2/steps)
            
            if obj.sliceplot
                slice(obj)
            end
            
            waitbar(3/steps)
            close(hw)
            drawnow limitrate nocallbacks
            
            
        end
        
         %-------------------------------------------------------
         
        function plot2d( obj)
        % Contour plot
            
            % check object
            if strlength(obj.data) ~= 2
                return
            end
            
            hw = waitbar(0,'Please wait...');
            steps = 4;
            
            % get function
            if obj.usem
                obj.fun = strcat('m',obj.fun);
            end
            ffun = str2func(obj.fun);
            
            % calculate coordinates
            [x1, x2, y1, y2] = FunctionRange(obj);
            x1 = max(x1,obj.xmin);
            x2 = min(x2,obj.xmax);
            kk = obj.kmax;
            kk1 = obj.kmin;
            y1 = max(y1,kk1);
            y2 = min(y2, kk);
            x  = linspace(x1, x2, obj.npts3d);
            kc = linspace(y1, y2, obj.npts3d);
            [X,KC] = meshgrid(x,kc);
            ff = ffun(X,KC);
            ff=cleanFun3( obj, ff);
            
            
            waitbar(1/steps)
            
            % start plot
            figure(1)
                        
            % keep figure position
            pos = get(gcf, 'Position');
            if pos(1) < 50
                pos(1) = 50;
            end
            if pos(2) > 300
                pos(2) = 300;
            end
            pos(3) = 640;
            pos(4) = 560;
            set(gcf, 'Position', pos);
            
            % clear figure
            clf
                        
            hold on
            
            % add title
            title(obj.fun)
            
            % scale x-axis
            xlab = 'x';
            obj.xscale = 1;
            if obj.usexscale
                switch obj.fclass
                    case 'JacobiPQ'
                        %  if abs(obj.k) ~= 1
                        %      obj.xscale = elK(obj.k);
                        %      xlab = 'x/K';
                        %  end
                    case 'Legendre'
                        % obj.xscale = pi;
                        xlab = '\phi';
                end
            end
            
            % set data for y-axis
            zlab = 'z';
            obj.yscale = 1;
            if obj.useyscale
                switch obj.fclass
                    case 'JacobiPQ'
                        if strcmp(obj.fun,'JacobiAM')
                            % obj.yscale = pi;
                            %   zlab = 'f/\pi';
                        end
                    case 'InverseJacobiPQ'
                        if abs(obj.k) ~= 1
                            %   obj.yscale = elK(obj.k);
                            %   zlab = 'f/K';
                        end
                end
            end
            
            % label axes
            xlabel(xlab)
            if obj.usem
                ylab = 'm';
            else
                ylab = 'k';
            end
            ylabel(ylab)
            
            %
            zmn = min(min(ff));
            zmx = max(max(ff));
            if zmn < obj.yymin
                zmn = obj.yymin;
            end
            if zmx > obj.yymax
                zmx = obj.yymax;
            end
            zmn = zmn/obj.yscale;
            zmx = zmx/obj.yscale;
            
            
            % plot contours
            waitbar(2/steps)
            LevelList = zmn:(zmx - zmn)/20:zmx;
            contourf(X/obj.xscale,KC,ff/obj.yscale,LevelList);
            
            % Draw axes (limits are already scaled)
            xlimv = get(gca,'XLim');
            ylimv = get(gca,'YLim');
            % if ymn < 0
            plot( xlimv,[ 0 0],'Color','k')
            % end
            % if xmin < 0
            plot( [0 0], ylimv,'Color','k')
            % end
            
            % add colorbar
            colorbar;
            
            % add grid
            grid on
            
            % end plot
            hold off
            
            % drawnow limitrate nocallbacks
            waitbar(3/steps)
            close(hw)
        end
        
         %-------------------------------------------------------
         
        function slice( obj)
        % add slices to surface
        
            % get function
            ffun = str2func(obj.fun);
            
            % plot begin
            figure(1)
            hold on
            
            % get current limits
            xlimv = get(gca,'XLim');
            ylimv = get(gca,'YLim');
            
            % x-axis
            if  ylimv(1) <= obj.k && obj.k <= ylimv(2)
                xx = linspace(xlimv(1),xlimv(2),obj.npts);
                yy = xx; yy(:)=obj.k;
                switch obj.data
                    case {'x','k'}
                        ff = ffun(xx);
                    case {'xk','pk'}
                        ff = ffun(xx,obj.k);
                    case 'xq'
                        ff = ffun(xx,obj.k);
                end
                ff=cleanFun2(obj,ff);
                plot3( xx, yy, ff, 'LineWidth',2);
            end
            
            % y-axis
            if  xlimv(1) <= obj.x && obj.x <= xlimv(2)
                yy = linspace(ylimv(1),ylimv(2),obj.npts);
                xx = yy; xx(:)=obj.x;
                switch obj.data
                    case {'x','k'}
                        ff = ffun(xx);
                    case {'xk','pk'}
                        ff = ffun(obj.x,yy);
                    case 'xq'
                        ff = ffun(obj.x,yy);
                end
                ff=cleanFun2(obj,ff);
                plot3( xx, yy, ff, 'LineWidth',2);
            end
            
            % reset limits
            set(gca,'XLim',xlimv)
            set(gca,'YLim',ylimv)
            
            % end plot
            hold off
            
        end
        
        %-------------------------------------------------------
         
        function [xmin, xmax, ymin, ymax] = FunctionRange( obj)
        % Get function range
        
            switch obj.fun
                case {'EllipticC','mEllipticC'}
                    xmin = -1;   xmax =  1;
                    ymin = -inf; ymax =  inf;
                case {'EllipticB','mEllipticB'}
                    xmin = -1;   xmax =  1;
                    ymin = -inf; ymax =  inf;
                case {'EllipticD','mEllipticD'}
                    xmin = -1;   xmax =  1;
                    ymin = -inf; ymax =  inf;
                case {'EllipticE','mEllipticE'}
                    xmin = -1;   xmax =  1;
                    ymin = -inf; ymax =  inf;
                case {'EllipticF','mEllipticF'}
                    xmin = -1;   xmax =  1;
                    ymin = -inf; ymax =  inf;
                case {'InverseJacobiCN','InverseJacobiSN',...
                        'InverseJacobiDN'}
                    xmin = -1;   xmax =  1;
                    ymin = -inf; ymax =  inf;
                case {'JacobiZeta','pJacobiZeta','pHeumanLambda'}
                    xmin = -inf;   xmax =  inf;
                    ymin = -1; ymax =  1;
                case {'JacobiTheta1', 'JacobiTheta2',...
                        'JacobiTheta3', 'JacobiTheta4'}
                    xmin = -inf;   xmax =  inf;
                    ymin = 0; ymax =  1;
                otherwise
                    xmin = -inf;  xmax =  inf;
                    ymin = -inf;  ymax =  inf;
            end
        end
        
        %-------------------------------------------------------
         
        function ff=cleanFun2( obj, ff)
        % Replace function jumps with NaN
        
            TOL = 2.1;
            nn = length(ff);
            for i = 1:nn
                if ff(i) > TOL*obj.yymax || ff(i) < TOL*obj.yymin
                    ff(i) = NaN;
                end
                if i == 1
                    continue
                end
                if abs(ff(i)-ff(i-1))>TOL
                    ff(i) = NaN;
                end
            end
        end
        
        %-------------------------------------------------------
                
        function ff=cleanFun3( obj, ff)
        % Replace function jumps with NaN
        
            TOL = 2.1;
            [nn, mm] = size(ff);
            for j = 1:mm
                for i = 1:nn
                    if ff(i,j) > TOL*obj.yymax || ff(i,j) < TOL*obj.yymin
                        ff(i,j) = NaN;
                    end
                    if i == 1 || j == 1
                        continue
                    end
                    if abs(ff(i,j)-ff(i-1,j))>TOL
                        ff(i,j) = NaN;
                    end
                    if abs(ff(i,j)-ff(i,j-1))>TOL
                        ff(i,j) = NaN;
                    end
                end
            end
        end
        
    end        
    
end






