function transform = rotVec2mat(rotationVector)
%rotVec2mat - Description
%
% Syntax: transform = rotVec2mat(rotationVector)
%
% Long description
    angle = sqrt(sum(rotationVector.^2));
    kx = rotationVector(1)/angle;
    ky = rotationVector(2)/angle;
    kz = rotationVector(3)/angle;
    tranform = axAng2mat([angle, kx, ky, kz]);
end
