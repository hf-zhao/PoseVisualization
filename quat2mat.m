function transform = quat2mat(quaternion)
%quat2mat - Description
%
% Syntax: transform = quat2mat(quaternion)
%
% Long description
    quaternion = quaternion/norm(quaternion);
    s = quaternion(1);
    v = quaternion(2:4);
    v_mat = [0 -v(3) v(2); v(3) 0 -v(1); -v(2) v(1) 0];
    transform = v'*v + s^2*eye(3) + 2*s*v_mat + v_mat^2;
end