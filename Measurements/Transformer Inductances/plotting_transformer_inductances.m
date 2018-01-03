%Plotting inductance measurements of transformer
%Files are stripped from text.

%Reading values
fid=fopen('LL_IND.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
LL_data = cell2mat(tt);
fid=fopen('LM_IND.txt','r');
tt = textscan(fid,'%f %f %f');
fclose(fid);
LM_data = cell2mat(tt);

flow = 0.1;
fhigh = 1;
yyaxis left;
plot(LL_data(:,1)*10^(-6),LL_data(:,2)*10^6)
grid on;
xlim([flow fhigh])
xlabel('Frequency [MHz]');
ylabel('Leakage inductance [?H]');
yyaxis right;
plot(LM_data(:,1)*10^(-6),LM_data(:,2)*10^6)
ylabel('Magnetizing inductance [?H]');
saveas(gcf,'Inductance_measurements_first_core','epsc')

