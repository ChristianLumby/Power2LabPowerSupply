current = csvread('load_curr.csv',5,0);
voltage = csvread('load_volt.csv',5,0);
%% plotting
plot(voltage(:,1)*1000,voltage(:,2),'LineWidth',1);
ylabel('Voltage [V]');
grid on;
xlabel('Time [ms]');
xlim([-5 35]);
ylim([28 33]);
title('1A to 0.5A load step');

% setting up graphics
plot_save_name = 'test123';
plot_size = 2; % 1,2 or 3
plot_size_scale = 2;


if plot_size == 1
    x0=100;
    y0=100;
    height=350/plot_size_scale;
    width=400/plot_size_scale;
elseif plot_size == 2
    x0=100;
    y0=100;
    height=350/plot_size_scale;
    width=400*3/2*1/plot_size_scale;
elseif plot_size == 3
    x0=100;
    y0=100;
    height=350/plot_size_scale;
    width=400*16/9*1/plot_size_scale;
else
    error('Error: plot_size unknown');
end

set(gcf,'units','points','position',[x0,y0,width,height])
fig = gcf;

whitebg([0.956, 0.956, 0.956]);
fig.Color = [0.956, 0.956, 0.956];
fig.InvertHardcopy = 'off';
saveas(gca,'loadstep.eps','epsc')
%% plotting current
plot(current(:,1)*1000,current(:,2),'LineWidth',1);
grid on;