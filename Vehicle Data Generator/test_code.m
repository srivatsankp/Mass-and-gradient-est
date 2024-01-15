%% Init Variables
power_rated = 4500;
time_step = 0.01;
time_total = 100;
param = zeros(time_total/time_step,3);
%% Generate gradient curve

for i = 1:size(param)
    if i == 1
        param(i,:) = 0;
    else
        param(i,1) = generate_grade(param(i-1,1),0.2); %Generate Grade
        param(i,2) = trq_calc(param(i-1,3),power_rated); %Generate torque
        param(i,3) = speed_calc(param(i-1,:),time_step); %Generate Speed
    end
end

tiledlayout(3,1);

nexttile
plot(param(:,1))
nexttile
plot(param(:,2))
nexttile
plot(param(:,3))

%% Calculate speed and torque steps


function new_grade =  generate_grade(old_grade,std_dev)
    temp = normrnd(old_grade,0.4);
    if randi(1) == 1
        new_grade = min(temp,25);
    else
        new_grade = min(normrnd(temp,0.05),25);
    end
end

function torque = trq_calc(speed,power)
    drr = 0.24;
    ang_spd = speed/drr;
    gr = 9.833;
    
    if speed ~= 0
        torque = min(abs(power/(ang_spd*gr)),23);
    else
        torque = 23;
    end
end

function speed = speed_calc(param,time_step)
    
    grade = param(1);
    torque = param(2);
    old_speed = param(3);
    mass = 285;
    a = 35.5*mass/210;
    b = 0.00232;
    gr = 9.833;
    drr = 0.24;

    loss =  a + b*old_speed^2;
    whl_trq = torque*gr;
    whl_force = whl_trq/drr;

    net_force = whl_force-loss-mass*9.81*sin(atan(grade/100));
    accln = net_force/mass;
    
    speed = old_speed+accln*time_step;

end
