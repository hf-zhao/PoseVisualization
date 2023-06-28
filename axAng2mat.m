function tranform = axAng2mat(axisAngles)
%axAng2mat - Description
%
% Syntax: tranform = axAng2mat(axisAngles)
%
% 旋转轴是过原点的单位向量，不过原点的没写，比较复杂，不实用

    angle = axisAngles(1);
    if abs(angle) < eps
        tranform = eye(3);
        return;
    end
    if isequal(abs(axisAngles(2:4)) < eps, [1 1 1])
        tranform = eye(3);
        return;
    end
    coeff = sqrt(sum(axisAngles(2:4).^2));
    kx = axisAngles(2)/coeff;
    ky = axisAngles(3)/coeff;
    kz = axisAngles(4)/coeff;
    Vers = 1 - cos(angle);

    tranform = [kx^2*Vers+cos(angle), ky*kx*Vers-kz*sin(angle), kz*kx*Vers+ky*sin(angle);
    kx*ky*Vers+kz*sin(angle), ky^2*Vers+cos(angle), kz*ky*Vers-kx*sin(angle);
    kx*kz*Vers-ky*sin(angle), ky*kz*Vers+kx*sin(angle), kz^2*Vers+cos(angle)];
end