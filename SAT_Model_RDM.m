%This script continues with choice prediction in RDM task, but also
%incorporates reaction time

clear
% control variables
%number of dots to track
d = 10;
%fraction of dots moving in the correct direction
f = 0.52;
%decision threshold
z = 20;
%%
for i = 1:10
    [choice, DT, delta] = simulate_threshold(d,f,z);
    plot(delta,'-','linewidth',3);
    hold on
end
xlabel('frame number')
ylabel('running difference')
mssg = ['Trial-by-Trial Walk to Threshold, {\it Coh} = ', num2str(((f*2)-1)*100)];
title(mssg)
plot(xlim,[z z],'k--')
plot(xlim,[-z -z], 'r--')
ylim([-z-5 z+5])
set(gca,'fontsize',14)
hold off

%%
for i = 1:1000
    [choice, DT(i)] = simulate_threshold(d,f,z);
end

figure
DT = DT*30;
hist(DT,20)
xlabel('response time [ms]')
set(gca,'fontsize',18)
mssg = ['Distribution of RTs, {\it Coh} = ', num2str(((f*2)-1)*100)];
title(mssg);

%%
%modeling a speed accuracy tradeoff with varying threshold
z_vals = [2 4 8 16 32];
for j = 1:length(z_vals)
    choice = zeros(1,100);
    DT = zeros(1,100);
    for i = 1:100
        [choice(i),DT(i)] = simulate_threshold(d,f,z_vals(j));
    end
    meanACC(j) = mean(choice);
    meanDT(j) = mean(DT);
end

figure; plot(z_vals,meanACC)
xlabel('threshold, z')
ylabel('average accuracy')
mssg = ['Effect of Varying Threshold on Accuracy, {\it Coh} = ', num2str(((f*2)-1)*100)];
title(mssg)
set(gca,'fontsize',14)

figure; plot(z_vals,meanDT*30)
xlabel('threshold z')
ylabel('decision time [ms]')
mssg = ['Effect of Varying Threshold on RT, {\it Coh} = ', num2str(((f*2)-1)*100)];
title(mssg)
set(gca,'fontsize',14)

figure; plot(meanDT*30,meanACC)
xlabel('decision time [ms]')
ylabel('accuracy')
mssg = ['speed-accuracy tradeoff in the model, {\it Coh} = ', num2str(((f*2)-1)*100)];
title(mssg)
set(gca,'fontsize',14)







