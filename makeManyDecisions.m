function [AVERAGE_ACCURACY] = makeManyDecisions(d,t,f,nDecisions)
% assign dot direction randomly to preferred (1) with probability f and
% anti-preferred (0) with probability 1-f

accuracy = zeros(nDecisions,1);
for j = 1:nDecisions
    N_correct = 0;
    N_incorrect = 0;
    for i = 1:d*t
        dot_direction = binornd(1,f);
        N_correct = N_correct + dot_direction;
        N_incorrect = N_incorrect + (1-dot_direction);
    end
    
    %assessing the accuracy of the decision
    if N_correct > N_incorrect
        accuracy(j) = 1;
    elseif N_incorrect > N_correct
        accuracy(j) = 0;
    elseif N_incorrect == N_correct
        accuracy(j) = binornd(1,0.5);
    end
    
end
AVERAGE_ACCURACY = mean(accuracy);
end

