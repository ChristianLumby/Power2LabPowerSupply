with = csvread('C2inrush-with00000.csv',5,0);
without = csvread('C2inrush-wo200000.csv',5,0);
%% plotting
plot(without(:,1)*1000,without(:,2),'r','LineWidth',2);
hold on;
plot(with(:,1)*1000,with(:,2),'b','LineWidth',2);
hold off;
grid on;
xlabel('Time [ms]');
ylabel('Current [A]');
xlim([-5 22]);
legend({'Without inrush limiter','With inrush limiter'});
title('Inrush current');

% setting up graphics
plot_save_name = 'test123';
plot_size = 1; % 1,2 or 3
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

fig = gcf;
whitebg([0.956, 0.956, 0.956]);
fig.Color = [0.956, 0.956, 0.956];
fig.InvertHardcopy = 'off';
print(gcf,plot_save_name,'-depsc','-r0')
set(gcf,'units','points','position',[x0,y0,width,height])

%saveas(gca,'inrush_2.eps','epsc')