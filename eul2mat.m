function rotationMatrix = eul2mat(eulerAngles, order, unit)
%eul2mat - Description
%
% Syntax: rotationMatrix = eul2mat(eulerAngles, order, unit)
%
% Long description

    if strcmp(unit, 'rad')
        eulerAngles = rad2deg(eulerAngles);
    end

    switch order
        case 'zyx'
            rotationMatrix = calculateRotationMatrix(eulerAngles);
    end


end

function R = calculateRotationMatrix(euler_angles)
    R = rotz(euler_angles(1)) * roty(euler_angles(2)) * rotx(euler_angles(3));
end