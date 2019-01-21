% Returns the right hand side corresponding to du/dt = RHS

function [y] = RHS(u, SizeU, dx, Velocity, Viscosity, RHSIdentifier, ...
                  DifferentiationSchemeIdentifier)

switch RHSIdentifier
    case 'wave'
        y = - Velocity * Diff(u, SizeU, dx, DifferentiationSchemeIdentifier);
        
    case 'diffusion'
        y = Viscosity * Diff2(u, SizeU, dx, DifferentiationSchemeIdentifier);
        
    % In case the user doesn't choose an implemented rhs
    otherwise
        error(['RHS identified as ', RHSIdentifier, ' not implemented!']);

end