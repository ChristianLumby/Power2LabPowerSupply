%Plotting inductance measurements of transformer
%Files are stripped from text.

%Reading values
fid=fopen('LL_IND_5_1.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
LL_data = cell2mat(tt);
fid=fopen('LM_IND_5_1.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
LM_data = cell2mat(tt);

flow = 0.1;
fhigh = 1;
yyaxis left;
plot(LL_data(:,1)*10^(-6),LL_data(:,2)*10^6,'Linewidth',2)
grid on;
xlim([flow fhigh])
xlabel('Frequency [MHz]');
ylabel('Leakage inductance [?H]');
yyaxis right;
plot(LM_data(:,1)*10^(-6),LM_data(:,2)*10^6,'Linewidth',2)
ylabel('Magnetizing inductance [?H]');
title('Transformer Inductance');
saveas(gcf,'Inductance_measurements_second_core','epsc')



%% Primary resistance
% using LM measurements (open sec. and tert. side)
fid=fopen('primary_res_5_1.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
res_data = cell2mat(tt);

flow = 0.1;
fhigh = 1;
semilogy(res_data(:,1)*10^(-6),res_data(:,2))
grid on;
xlim([flow fhigh])
xlabel('Frequency [MHz]');
ylabel('Primary resistance [Ohm]');
saveas(gcf,'Inductance_measurements_primary_resistance','epsc')
