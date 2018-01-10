%Plotting inductance measurements of 56uF cap
% 1V dc bias, 500mV amplitude
%Files are stripped from text.

%% C and ESR
%Reading values
fid=fopen('C.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
C_data = cell2mat(tt);
fid=fopen('ESR.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
ESR_data = cell2mat(tt);

flow = 0.04;
fhigh = 0.2;
yyaxis left;
plot(C_data(:,1)*10^(-6),C_data(:,2)*10^6)
grid on;
xlim([flow fhigh])
xlabel('Frequency [MHz]');
ylabel('Capacitance [uF]');
yyaxis right;
plot(ESR_data(:,1)*10^(-6),ESR_data(:,2))
ylabel('ESR [Ohms]');
saveas(gcf,'C_ESR','epsc')

%% Z and Phase
%Reading values
fid=fopen('Z.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
Z_data = cell2mat(tt);
fid=fopen('P.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
P_data = cell2mat(tt);

flow = 0.04*10^6;
fhigh = 1*10^6;
yyaxis left;
plot(Z_data(:,1),Z_data(:,2))
grid on;
xlim([flow fhigh])
xlabel('Frequency [Hz]');
ylabel('Impedance [\Omega]');
yyaxis right;
plot(P_data(:,1),P_data(:,2))
ylabel('Phase [Degrees]');
saveas(gcf,'Z_P','epsc')