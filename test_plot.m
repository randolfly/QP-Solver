%%
k = 3;   %% specify axis to be taken
figure(1)
% plot predict axis length
plot(t,lk(p_start:p_end,k),'linewidth',2);
hold on
plot(t,y(:,k),'-.','linewidth',2);
plot(t,y_N(:,k),'-.','linewidth',2);
plot(t,l_star(p_start:p_end,k),'--','linewidth',1);
grid on
xlabel('times/s');
ylabel('length/mm');
title('predict axis length');
legend("lk",'y','y_N','l-star');

figure(2)
% error type plot
% if out of planning
    % 1=> true, prime number =>false
    % 2=> size error
    % 3=> null error
    % 5=> iter error
    % 7=> speed error
    % 11=> acc error
plot(t(2:end),error(2:end,k),'linewidth',2);
title('error type');