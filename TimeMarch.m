% Return u_n+1 according to the specified equation and time marching 
% and differentiation schemes 

function [uNext] = TimeMarch(u, SizeU, dx, dt, Velocity, Viscosity, ...
                             TimeMarchingSchemeIdentifier, RHSIdentifier, ...
                             DifferentiationSchemeIdentifier)

% Use the specified time marching scheme                      
switch TimeMarchingSchemeIdentifier
    
    case 'euler'
        uNext = u + dt * RHS(u, SizeU, dx, Velocity, Viscosity, ...
                              RHSIdentifier, DifferentiationSchemeIdentifier);
    case 'rk2'    
        Stage1 = u + dt * RHS(u, SizeU, dx, Velocity, Viscosity, ...
                                 RHSIdentifier, DifferentiationSchemeIdentifier);
        
        uNext = u + 0.5*dt * RHS(Stage1, SizeU, dx, Velocity, Viscosity, ...
                             RHSIdentifier, DifferentiationSchemeIdentifier);        
     
    case 'rk4'
        
       % ************************************************ 
       % runge kutta 4 ordem aqui
       % ************************************************
    
    % In case the user doesn't choose an implemented time marching scheme
    otherwise
        error(['Time marching scheme ', TimeMarchingSchemeIdentifier, ...
              ' not implemented!']);
end