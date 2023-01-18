% VScerra, 2020
% Modeling perceptual decision in a RDM task, based on number of dots
% moving in a particular direction (dot coherence) and viewing time. 
% This script calls the functions: 
clear
% number of dots participants are observing
d = 10;
% viewing time in frames
t_vals = [1:5:21];
% fraction of dots moving in preferred direction
coh = [3.2 6.4 12.8 25.6 51.2]/100;
f_vals = (coh+1)/2;
nDecisions = 500;
AVERAGE_ACCURACY = zeros(length(t_vals),length(f_vals));
for i = 1:length(t_vals)
    for j = 1:length(f_vals)
        AVERAGE_ACCURACY(i,j) = makeManyDecisions(d,t_vals(i),f_vals(j),nDecisions);
    end
end
%%
%plotting results
%defining some colors
chile = [139 0 21]/256;
petal = [239 64 86]/256;
sky = [129 211 235]/256;
bluelt = [30 82 136]/256;
turquoise = [55 189 141]/256;
bluedk = [0 28 72]/256;

%assuming stimulus is running at 30 Hz
l = plot(t_vals*1000/30, AVERAGE_ACCURACY);
set(l,'linewidth',3)
set(l(1),'color',chile);
set(l(2),'color',petal);
set(l(3),'color',sky);
set(l(4),'color',turquoise);
set(l(5),'color',bluedk);
xlabel('viewing time [ms]')
ylabel('accuracy')
title('Perceptual Decision Making in RDM Task')
legend({'coh = 3.2%','coh = 6.4%','coh = 12.8%','coh = 25.6%','coh = 51.2%'})
set(gca,'fontsize', 14)