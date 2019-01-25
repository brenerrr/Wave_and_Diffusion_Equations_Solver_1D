% Useful commands
% dbstop if error % enter debug mode when an error occurs
% dbclear all % Revert the above command

clc       % Clear command window
clear all % Erase everything from workspace
close all % Close all figures

%% Inputs

% Grid
Inputs.x0 = -pi; 
Inputs.xn = pi; 
Inputs.SizeX = 201; 

% Number of iterations
Inputs.SizeT = 1000;

% Parameters for wave and diffusion equations
Inputs.Velocity = 1;
Inputs.Viscosity = 1;

% Convective and Viscous CFL (one is used when working with the wave
% equation and the other with the diffusion equation)
Inputs.CFL = 0.1; 
Inputs.CFLViscous = 0.1;

% Parameter that increases steepness of initial condition
Inputs.k = 1;

Inputs.InitialConditionIdentifier = 'sine';      % gaussian, sine, step
Inputs.TimeMarchingSchemeIdentifier = 'euler';         % euler, rk2
Inputs.RHSIdentifier = 'wave';                  % wave, diffusion
Inputs.DifferentiationSchemeIdentifier = 'centered'; % centered, backwards
%% Pre solver  

% Calculate grid points, allocate array for solver's output and calculate
% simulation parameters dx and dt 
[x, u, dx, dt] = Setup(Inputs);

% Calculate initial condition 
u(:,1) = InitialCondition(Inputs.InitialConditionIdentifier, x, Inputs.k);

%% Solver 

% Iterate SizeT times and store each time step on columns of u 
for n = 1:Inputs.SizeT-1
   u(:,n+1) = TimeMarch(u(:,n)', Inputs.SizeX, dx, dt, Inputs.Velocity, ...
                        Inputs.Viscosity, Inputs.TimeMarchingSchemeIdentifier, ...
                        Inputs.RHSIdentifier, Inputs.DifferentiationSchemeIdentifier);  

    % Uncomment if you want to see an animation 
%    figure(666)
%    plot(x,u(:,n))
%    ylim([min(u(:,1)), max(u(:,1))])
%    pause(0.01)
end

%% Plot

f = figure(1); % Create figure 

% Moments that will be plotted
% iPlot = [1, 20, 40, 60, 80, 100];
iPlot = round([1,Inputs.SizeT/4, Inputs.SizeT/2, Inputs.SizeT]); 
nPlot = length(iPlot);

% Plot all the moments stored on iPlot
for i = 1:nPlot
   subplot(nPlot,1,i) % Select the subplot you will plot on 
   plot(x,u(:,iPlot(i))) % Plot output of solver at iPlot(i) iteration
   
   % Things to make the plot pretty 
   title(['Iteration ', num2str(iPlot(i)-1)]) % Title of plot 
   set(gcf,'color','w');                      % Changes background color from gray to white
   ylabel('u') ; xlabel('x');                 % Labels of y and x axis 
   set(gcf, 'Position',  [100, 20, 700, 700]) % Increase size of window
   xlim([Inputs.x0, Inputs.xn])               % Limits of x axis
   ylim([min(u(:,1)), max(u(:,1))]);          % Limits of y axis                          
   grid()                                     % Create a background grid
   
end

% Save figure 
saveas(f,'output.png') 