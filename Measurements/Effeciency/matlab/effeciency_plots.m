clear; % Clear workspace
close all;
clc;   % Clear console





%%%%%%%%%%      SETTINGS     %%%%%%%%%

% Expected format: Pout [w], effeciency [%]

filename = ["effeciency_closed_loop_20-05.csv", "effeciency_closed_loop_20-30.csv", "effeciency_closed_loop_30-15.csv", "effeciency_closed_loop_40-05.csv", "effeciency_closed_loop_40-30.csv"];
root = 'C:\Users\chris\OneDrive\Documents\DTU\Effektelektronik 2\Power2LabPowerSupply\Measurements\Effeciency\matlab';

plot_legend = ["Vin = 20V", "Vin = 20V", "Vin = 30V", "Vin = 40V", "Vin = 40V"];

include = [1,4]; % Datasets to be included in the plot

plot_save_name = 'effeciency_vout_05';

plot_title  = 'Efficiency @ Vout = 5V';
plot_xlabel = 'Output Power [W]';
plot_ylabel = 'Percent Effeciency';
plot_size = 2; % 1,2 or 3
plot_size_scale = 2;

%%%%%%%%%%      SETTINGS      %%%%%%%%%






oldCD = cd; % Get current directory before changing
cd(root);   % Change to user specified directory


for k=1:length(filename)

    % Get list of main and subdirectories
    filefound = 0;
    dirs = regexp(genpath(root),['[^;]*'],'match');

    % Change directory to the location of the file
    for i = 1:size(dirs,2)
        tempCD = char(dirs(1,i));
        cd(tempCD);
        if exist(filename(k),'file') 
            filefound = 1;
            break;
        end
    end

    % Inform user if the file isn't found - and stop script
    if filefound == 0
        cd (oldCD); % Return to old directory
        error('Error: File not found in directory')
    end

    % Inform user of found file location
    fprintf(strcat("File:  ",filename(k), "     found in dir:  "));
    disp(cd);


    % Import data from file
    imported(k) = importdata(filename(k),',');

end





% Plot data

hold on

for i=1:length(include)
    plot(imported(include(i)).data(:,1), imported(include(i)).data(:,2),'linewidth',2);
    
end

fig = gcf;
legend(plot_legend(include),'Location','southeast');

title(plot_title);
xlabel(plot_xlabel);
ylabel(plot_ylabel);

grid on;
%grid minor;
box on;




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



whitebg([0.956, 0.956, 0.956]);
fig.Color = [0.956, 0.956, 0.956];
fig.InvertHardcopy = 'off';
print(gcf,plot_save_name,'-depsc','-r0')


hold off;




% Make sure you didn't fuck up other scripts by changing directory
cd(oldCD); % Return to old directory
disp([sprintf('\nReturned to old directory:\n'), cd]);
