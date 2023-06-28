function axisAngles = mat2axAng(tranform)
%mat2axAng - Description
%
% Syntax: axisAngles = mat2axAng(tranform, unit)
%
% 轴角与旋转矩阵关系并不是一一对应，[angle,kx,ky,kz] 与 [-angle,-kx,-ky,-kz] 对应同一个矩阵
% 本函数返回的轴角范围：angle：[0, pi],     kx,ky,kz：[-1,1]


    % angle [0 180]
    R = tranform(1:3, 1:3);
    angle = acos((R(1,1) + R(2,2) + R(3,3) - 1)/2);
    if abs(angle) < eps
        axisAngles = zeros(1,4);
    elseif abs(angle - pi) < eps
        if (R - rotx(180)) < eps
            axisAngles = [pi 1 0 0];
        elseif (R - roty(180)) < eps
            axisAngles = [pi 0 1 0];
        elseif (R - rotz(180)) < eps
            axisAngles = [pi 0 0 1];
        end
    else
        kx = R(3,2) - R(2,3);
        ky = R(1,3) - R(3,1);
        kz = R(2,1) - R(1,2);
        axisAngles = [angle kx ky kz];
        axisAngles(2:4) = axisAngles(2:4)/sqrt(sum(axisAngles(2:4).^2));
    end
end