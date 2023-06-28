function rotationVector = mat2rotVec(tranform)
%mat2rotVec - Description
%
% Syntax: rotationVector = mat2rotVec(tranform)
%
% Long description
    % angle [0 180]
    R = tranform(1:3, 1:3);
    angle = acos((R(1,1) + R(2,2) + R(3,3) - 1)/2);
    if abs(angle) < eps
        rotationVector = zeros(1,3);
    elseif abs(angle - pi) < eps
        if (R - rotx(180)) < eps
            rotationVector = [pi 0 0];
        elseif (R - roty(180)) < eps
            rotationVector = [0 pi 0];
        elseif (R - rotz(180)) < eps
            rotationVector = [0 0 pi];
        end
    else
        kx = R(3,2) - R(2,3);
        ky = R(1,3) - R(3,1);
        kz = R(2,1) - R(1,2);
        rotationVector = [kx ky kz];
        rotationVector = angle*rotationVector/sqrt(sum(rotationVector.^2));
    end
end