function drawAxes(transform, ratio)
%drawAxes - Draw a 3D axes
%
% Syntax: drawAxes(transform, ratio)
%
% Inputs:
%   @transform: 
%   @ratio    : 

    % ratio = 15;

    axis_x = transform(1:3, 1)';
    axis_y = transform(1:3, 2)';
    axis_z = transform(1:3, 3)';
    loc_ori = transform(1:3, 4)';
    
    px = loc_ori+axis_x * ratio;
    py = loc_ori+axis_y * ratio;
    pz = loc_ori+axis_z * ratio;
    view(3);
    axis([-1 1 -1 1 -1 1]);
    grid on;
    hold on;
    daspect([1 1 1]);
    plot3([loc_ori(1) px(1)], [loc_ori(2) px(2)], [loc_ori(3) px(3)], 'Color', 'r', 'LineWidth', 2);
    plot3([loc_ori(1) py(1)], [loc_ori(2) py(2)], [loc_ori(3) py(3)], 'Color', 'g', 'LineWidth', 2);
    plot3([loc_ori(1) pz(1)], [loc_ori(2) pz(2)], [loc_ori(3) pz(3)], 'Color', 'b', 'LineWidth', 2);
%     arrow3(loc_ori, px, 'r');
%     arrow3(loc_ori, py, 'g');
%     arrow3(loc_ori, pz, 'b');
    % drawArrow(loc_ori, px, ...
    %           'arrow_color', 'r', ...
    %           'handle_color', 'r', ...
    %           'arrow_shape', 0.18, ...
    %           'arrow_size', ratio*0.25);
    % drawArrow(loc_ori, py, ...
    %           'arrow_color', 'g', ...
    %           'handle_color', 'g', ...
    %           'arrow_shape', 0.18, ...
    %           'arrow_size', ratio*0.25);
    % drawArrow(loc_ori, pz, ...
    %           'arrow_color', 'b', ...
    %           'handle_color', 'b', ...
    %           'arrow_shape', 0.18, ...
    %           'arrow_size', ratio*0.25);

    scatter3(loc_ori(1), loc_ori(2), loc_ori(3), ...
        'MarkerEdgeColor','k',...
        'MarkerFaceColor',[0 .75 .75]);
    text(px(1), px(2), px(3), 'x', 'FontSize', 14);
    text(py(1), py(2), py(3), 'y', 'FontSize', 14);
    text(pz(1), pz(2), pz(3), 'z', 'FontSize', 14);
end