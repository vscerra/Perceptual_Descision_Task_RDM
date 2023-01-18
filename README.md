# Perceptual_Descision_Task_RDM
Simulation of a simple random dot motion task, as well as a version that models reaction time. 

A random dot motion (RDM) task is a commonly used experimental paradigm to model perceptual decisions. It is useful as a template for how we use growing information based on limited resources to make decisions. In a simple RDM task, the observer tracks dots that appear to be moving and tries to determine the direction in which the dots are moving. The experimenter can manipulate how many of the dots are are moving in a preferred direction, and how many are simple static noise. The more dots moving in the preferred direction, the easier the task becomes. 

The primary control variable in the task is $f$, the fraction of the dots moving in the preferred direction. Both human and animal subjects are quite good at detecting motion, even for very small values of $f$. In the experimental versions of this task, subjects can be given limited time to view the stimulus (< 1000 ms), and register their choice with a button press or an eye movement. Experimental manipulation of the viewing time as well as $f$ give two variables to model. In the included script `Perceptual_Descision_Model_RDM`, you can select 1) how many dots to monitor (more monitored dots = better accuracy), 2) $f$, and 3) how long the stimulus is available and use those variables to model the decision process. The metric more commonly reported in RDM tasks as a function of $f$ is coherence (COH), which is given by: 
$COH$ = 2 $f$ - 1 . Experimental evidence demonstrates that the longer a stimulus is viewed, and the more coherent the dots, the more accuracte the responses. 

In some versions of the RDM task, the subjects can view the stimulus as long as they wish before making a response - this is called a **free response** version of the task. In this case, when the task is difficult, it is common to find that subjects trade speed for accuracy. That is to say, subjects choose to respond quickly with potentially more incorrect answsers, or they take their time responding to ensure accuracy at the cost of quick responses. This is referred to as the **speed accuracy tradeoff (SAT)**. I model this version of task performance in the script `SAT_Model_RDM`. In this version of the model, as single value for $f$ is selected and evidence for the preferred vs. anti-preferred direction is accumulated at each visual frame of the task, until a threshold is reached for making a choice. In the model, we can set the value of the threshold $z$. A lower $z$ will emphasize speed - less information is required to reach threshold, but it may be incorrect, while a higher $z$ emphasizes accuracy - slower decisions will be made with more information accumulated. 
