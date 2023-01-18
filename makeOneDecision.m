function [accuracy] = makeOneDecision(d,t,f)
% assign dot direction randomly to preferred (1) with probability f and
% anti-preferred (0) with probability 1-f
N_correct = 0;
N_incorrect = 0;
for i = 1:d*t
    dot_direction = binornd(1,f);
    N_correct = N_correct + dot_direction;
    N_incorrect = N_incorrect + (1-dot_direction);
end

%assessing the accuracy of the decision
if N_correct > N_incorrect
    accuracy = 1;
elseif N_incorrect > N_correct
    accuracy = 0;
elseif N_incorrect == N_correct
    accuracy = binornd(1,0.5);
end

end

