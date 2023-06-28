function eulerAngles = mat2eul(tranform, order, unit)
%mat2eul - Description
%
% Syntax: eulerAngles = mat2eul(tranform, order)
%
% Long description
    R = tranform(1:3, 1:3);

    switch order
        case 'zyx'
            eulerAngles = calculateEulerZYX(R);
        
    end
    if strcmp(unit, 'deg')
        eulerAngles = rad2deg(eulerAngles);
    end
    
end

% euler - ZYX Range
% yaw [-180, 180]
% pitch [-90, 90]
% roll [-180, 180]
function eul_zyx = calculateEulerZYX(R)
    angleY_pitch = atan2(-R(3,1), sqrt(R(1,1)^2 + R(2,1)^2));
    if abs(angleY_pitch - pi/2) < eps
        angleY_pitch = pi/2;
        angleZ_yaw = 0;
        angleX_roll = atan2(R(1,2), R(2,2));
    elseif abs(angleY_pitch + pi/2) < eps
        angleY_pitch = -pi/2;
        angleZ_yaw = 0;
        angleX_roll = -atan2(R(1,2), R(2,2));
    else
        angleZ_yaw = atan2(R(2,1), R(1,1));
        angleX_roll = atan2(R(3,2), R(3,3));
    end
    eul_zyx = [angleZ_yaw, angleY_pitch, angleX_roll];
end
