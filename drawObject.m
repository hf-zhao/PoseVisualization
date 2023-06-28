function drawObject(transform)
    clf;

    % cube corner
    cube_points_start = [1,1,1;1,-1,1;-1,-1,1;-1,1,1;1,1,-1;1,-1,-1;-1,-1,-1;-1,1,-1];
    cube_points_target = transform(1:3,1:3) * cube_points_start';
    drawCube(cube_points_target');
    drawAxes(transform, 6);

    view(3)
    daspect([1,1,1]);   
    hold on;
    xlim([-7, 7]);
    ylim([-7, 7]);
    zlim([-7, 7]);
    xlabel('x');
    ylabel('y');
    zlabel('z');

end

function drawCube(cube_points)
    % cube corner
    patch('Faces', [1,2,3,4], 'Vertices', cube_points, 'FaceColor', 'blue', 'FaceAlpha', 0.8);
    patch('Faces', [5,6,7,8], 'Vertices', cube_points, 'FaceColor', 'blue', 'FaceAlpha', 1);
    patch('Faces', [1,4,8,5], 'Vertices', cube_points, 'FaceColor', 'green', 'FaceAlpha', 0.8);
    patch('Faces', [2,3,7,6], 'Vertices', cube_points, 'FaceColor', 'green', 'FaceAlpha', 1);
    patch('Faces', [1,5,6,2], 'Vertices', cube_points, 'FaceColor', 'red', 'FaceAlpha', 0.8);
    patch('Faces', [4,3,7,8], 'Vertices', cube_points, 'FaceColor', 'red', 'FaceAlpha', 1);
end