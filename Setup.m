% Setup basic variables needed before simulation, which are 
% x (grid), u(array that will hold output of solver) and simulation
% parameters derived from user inputs (delta x and delta t)

function [x, u, dx, dt] = Setup(Inputs) 

% Create grid 
x = linspace(Inputs.x0,Inputs.xn,Inputs.SizeX);

% Size of delta x 
dx = ( Inputs.xn - Inputs.x0 ) / ( Inputs.SizeX - 1 );

% Size of delta t
if (strcmp(Inputs.RHSIdentifier,'diffusion'))
   dt = Inputs.CFLViscous * dx^2 / abs(Inputs.Viscosity); % Viscous CFL
else
    dt = Inputs.CFL * dx / abs(Inputs.Velocity); % Convective CFL
end

% Initialize array u that will hold solver's output (nx by nt matrix). 
% That is, a snapshot corresponds to a column
u = zeros(Inputs.SizeX,Inputs.SizeT);

end

