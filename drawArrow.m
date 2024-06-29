function drawArrow(from, to, varargin)
%drawArrow - Draw a 3D arrow
%
% Syntax: drawArrow(from, to, varargin)
%
% Inputs:
%   @from: start position
%   @to  : end position

    % Check the number of input parameters
    narginchk(2, inf);

    % Set default parameters or specify parameters
    opt = argparse(varargin);

    T = transform(from, to);
    r = [opt.arrow_shape 0];
    [X, Y, Z] = cylinder(r, 30);
    X = X * opt.arrow_size;
    Y = Y * opt.arrow_size;
    Z = (Z-1) * opt.arrow_size;
    [L, W] = size(Z);
    for i = 1:L
        for j = 1:W
            temp = T * [X(i,j) Y(i,j) Z(i,j) 1]';
            X(i,j) = temp(1);
            Y(i,j) = temp(2);
            Z(i,j) = temp(3);
        end
    end
	surf(X, Y, Z, 'FaceColor', opt.arrow_color, 'EdgeColor', 'none');
    hold on;
    plot3([from(1) to(1)], [from(2) to(2)], [from(3) to(3)], opt.handle_color, 'LineWidth', opt.handle_thickness);
    daspect([1 1 1]);
end

% calucate
function T = transform(from, to)

    % Check whether the input is a column vector(3 degree).
    if ~iscolumn(from)
        from = from';
    end
    if ~iscolumn(to)
        to = to';
    end
    % 旋转前后的矢量
    P1 = [0 0 1]';
    P2 = to - from;
    
    % 轴角
    % 两向量夹角
    q = acos(dot(P1, P2) / (norm(P1) * norm(P2)));

    if q == 0
        T = [eye(3), to; 0 0 0 1];
        return;
    elseif q == pi
        R = [1 0 0; 0 -1 0; 0 0 -1];
        T = [R, to; 0 0 0 1];
        return;
    end
    
    % 旋转轴
    e = [P1(2)*P2(3) - P1(3)*P2(2);
        P1(3)*P2(1) - P1(1)*P2(3);
        P1(1)*P2(2) - P1(2)*P2(1)];
    e = e/norm(e);
    R = [e(1)^2*(1-cos(q))+cos(q), e(1)*e(2)*(1-cos(q))-e(3)*sin(q), e(1)*e(3)*(1-cos(q))+e(2)*sin(q);
        e(1)*e(2)*(1-cos(q))+e(3)*sin(q), e(2)^2*(1-cos(q))+cos(q), e(2)*e(3)*(1-cos(q))-e(1)*sin(q);
        e(1)*e(3)*(1-cos(q))-e(2)*sin(q), e(2)*e(3)*(1-cos(q))+e(1)*sin(q), e(3)^2*(1-cos(q))+cos(q)];
    
    T = [R, to; 0 0 0 1];
end

% Set default parameters or specify parameters
function opt = argparse(argv)

    % Set the ratio of arrow radius to height. (r:h)
    parameterNameIndex = strcmp('arrow_shape', argv);
    if ~any(parameterNameIndex)
        opt.arrow_shape = 0.2;
    else
        parameterValueIndex = find(parameterNameIndex) + 1;
        if isnumeric(argv{parameterValueIndex})
            opt.arrow_shape = argv{parameterValueIndex};
        else
            error('Arrow shape scale parameter must be numeric');
        end
    end

    % Set the size of arrow. 
    parameterNameIndex = strcmp('arrow_size', argv);
    if ~any(parameterNameIndex)
        opt.arrow_size = 0.2;
    else
        parameterValueIndex = find(parameterNameIndex) + 1;
        if isnumeric(argv{parameterValueIndex})
            opt.arrow_size = argv{parameterValueIndex};
        else
            error('Arrow size parameter must be numeric');
        end
    end

    % Set the color of arrow. 
    parameterNameIndex = strcmp('arrow_color', argv);
    if ~any(parameterNameIndex)
        opt.arrow_color = 'r';
    else
        parameterValueIndex = find(parameterNameIndex) + 1;
        if ischar(argv{parameterValueIndex})
            opt.arrow_color = argv{parameterValueIndex};
        else
            error('Arrow color parameter must be string');
        end
    end

    % Set the color of arrow handle. 
    parameterNameIndex = strcmp('handle_color', argv);
    if ~any(parameterNameIndex)
        opt.handle_color = 'r';
    else
        parameterValueIndex = find(parameterNameIndex) + 1;
        if ischar(argv{parameterValueIndex})
            opt.handle_color = argv{parameterValueIndex};
        else
            error('Arrow handle color parameter must be string');
        end
    end

    % Set the thickness of arrow handle.
    parameterNameIndex = strcmp('handle_thickness', argv);
    if ~any(parameterNameIndex)
        opt.handle_thickness = 1;
    else
        parameterValueIndex = find(parameterNameIndex) + 1;
        if isnumeric(argv{parameterValueIndex})
            opt.handle_thickness = argv{parameterValueIndex};
        else
            error('Arrow handle thickness parameter must be numeric');
        end
    end
end