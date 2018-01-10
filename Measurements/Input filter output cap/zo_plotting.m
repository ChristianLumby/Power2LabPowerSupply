%Plotting Zo
% unknown amplitude
% no bias

%% Mag and phase
%Reading values
fid=fopen('Zo3_mag.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
mag_data = cell2mat(tt);
fid=fopen('Zo3_phase.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
phase_data = cell2mat(tt);

flow = 40;
fhigh = 1*10^5;
semilogx(mag_data(:,1),20*log10(mag_data(:,2)))
grid on;
xlim([flow fhigh])
xlabel('Frequency [Hz]');
ylabel('Zo magnitude [dB\Omega]');
saveas(gcf,'Zo','epsc')
%% ignore below
yyaxis right;
plot(phase_data(:,1)*10^(-6),phase_data(:,2))
ylabel('Zo phase [degrees]');

