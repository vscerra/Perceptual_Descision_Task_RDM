function [accuracy, DT, delta] = simulate_threshold(d,f,z)
%simulate_threshold models a drift-diffusion type choice based on number of
%dots tracked (d), the probability of preferred direction (f), and the
%decision threshold (z). It outputs accuracy, DT (how many frames it took
%to reach threshold), and delta (the climb toward threshold)

%initialize variables
i = 1;
N_correct = 0;
N_incorrect = 0;
delta = N_correct-N_incorrect;
 
while abs(delta(i))<z
    for j = 1:d
        %randomly sample direction
        dot_direction = binornd(1,f);
        %update counts
        N_correct = N_correct + dot_direction;
        N_incorrect = N_incorrect + (1-dot_direction);
    end
    %update counter
    i = i+1;
    %compute difference
    delta(i) = N_correct-N_incorrect;
end

%compute accuracy - correct if delta crossed +z threshold, incorrect if
%delta crossed -z threshold
accuracy = delta(i)>0;
%compute decision time in frames
DT = i;


end

