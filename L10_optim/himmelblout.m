function stop = himmelblout(x,~,state)
persistent ph
stop = false;
switch state
    case 'init'
       newplot;
       xx = -5:0.2:5;
       yy = -5:0.2:5;
       [xx, yy] = meshgrid(xx, yy);
       zz = (xx.^2 + yy - 11).^2 + (xx + yy.^2 - 7).^2;
       
       cmap = jet; % jet, hsv, hot, cool, etc.
       hsv2 = hsv;
       hsv3 = [hsv2(11:64,:); hsv2(1:10,:)];
       % colormap(cmap);
       colormap(hsv3);
       
       % draw the surf plot
       surface(xx, yy, zz, 'EdgeColor', [0.8, 0.8, 0.8]);
       xlabel('x(1)');
       ylabel('x(2)');
       view(10, 55);
       hold on;
       
       [~, contHndl] = contour3(xx, yy, zz, [100, 500], 'k');
       contHndl.Color = [0.8, 0.8, 0.8];
       
       plot3(-5,5,530,'ko','MarkerSize',15,'LineWidth',2);
       text(-5.1,5.4,550,'   Start','Color',[0 0 0]);
       % plot3(5,5,890,'ko','MarkerSize',15,'LineWidth',2);
       % text(5.1,5.4,890,'   Start','Color',[0 0 0]);
       solutions = [3, 2; -2.805, 3.131; -3.779, -3.283; 3.584, -1.848];
       for i = 1:size(solutions, 1)
           plot3(solutions(i, 1), solutions(i, 2), 0, 'ko', 'MarkerSize', 10, 'LineWidth', 2);
           text(solutions(i, 1) + 0.2, solutions(i, 2) + 0.2, 0, ' Solution', 'Color', [0, 0, 0]);
       end
       drawnow;

    case 'iter'
        x1 = x(1);
        y1 = x(2);
        z1 = (x1^2 + y1 - 11)^2 + (x1 + y1^2 - 7)^2;
        ph = plot3(x1, y1, z1, 'b.', 'MarkerSize', 25);
        h = gca;
        h.SortMethod = 'childorder';
        drawnow;

    case 'done'
        legend(ph, 'Iterative steps', 'Location', 'north');
        hold off;
end
