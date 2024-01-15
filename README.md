"# Mass-and-gradient-est" __

######### Project Description__
Perform Mass and Gradient Estimation basis vehicle data obtained via simulation. Vehicle is completely Hypothetical.
Vehicle Details :__
- mass = 285kg (incl rider and vehicle)
- Friction Coeff(L0/m) = 0.169, Friction angle = atan(0.19) = 9.648deg
- L2 = 0.0232

######### Vehicle Data Generator__
Vehicle power considered to be flat 4.5kW with peak torque of 23N (EV).__

- RNG based Gradient angle generated
- Vehicle FBD & force equation considered to calculate vehicle speed at next time step.
- Data generated in "param" file which can be copied into an excel sheet. Data of the form "Time", "Torque", "Gradient"


######### Estimator__
Estimator includes 2 parts: Vehicle model to mimic real vehicle and Estimator model with limited inputs from the vehicle model to estimate mass and gradient.__
v1 : Initial build.__
- Includes completed vehicle model and initial Estimator model.
- Uses Recursive Least Squares method with forgetting.
- Forgetting Factors used as 0.9 and 0.6.
- Results : Mass does not converge very well, leading to gradient estimate going haywire.
