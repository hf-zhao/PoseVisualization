function unitQuaternion = mat2unitQuat(tranform)
%mat2quat - Description
%
% Syntax: unitQuaternion = mat2quat(tranform)
%
% Long description
    
    R = tranform(1:3, 1:3);
    angle = acos((R(1,1) + R(2,2) + R(3,3) - 1)/2);
    if abs(angle) < eps
        unitQuaternion = [1 0 0 0];
    elseif abs(angle - pi) < eps
        if (R - rotx(180)) < eps
            unitQuaternion = [0 1 0 0];
        elseif (R - roty(180)) < eps
            unitQuaternion = [0 0 1 0];
        elseif (R - rotz(180)) < eps
            unitQuaternion = [0 0 0 1];
        end
    else
        kx = R(3,2) - R(2,3);
        ky = R(1,3) - R(3,1);
        kz = R(2,1) - R(1,2);
        q0 = cos(angle/2);
        coeff = sqrt(kx^2 + ky^2 + kz^2);
        q1 = kx * sin(angle/2) / coeff;
        q2 = ky * sin(angle/2) / coeff;
        q3 = kz * sin(angle/2) / coeff;
        unitQuaternion = [q0 q1 q2 q3];
    end
end