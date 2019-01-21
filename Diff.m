% Returns the derivative of u calculated using a specified numerical scheme

function du = Diff(u, SizeU, dx, DifferentiationSchemeIdentifier)

% Initialize du 
du = zeros(1, SizeU);

switch DifferentiationSchemeIdentifier
    case 'backwards'
        
        % Calculate derivatives which don't need boundary conditions
        for i = 2:SizeU
           du(i) = ( u(i) - u(i-1) ) / dx ;
        end
        
        % Calculate derivative at the boundary assuming periodic boundary
        % conditions. That is, u0 = uN - 1, since u1 = uN
        du(1) = ( u(1) - u(SizeU - 1) ) / dx;
        
    case 'centered' 
        
        % Calculate derivatives which don't need boundary conditions
        for i = 2:SizeU-1
           du(i) = ( u(i+1) - u(i-1) ) / ( 2*dx ) ;
        end
        
        % Calculate derivative at boundary assuming periodic boundary
        % conditions. That is, u0 = uN - 1, since u1 = uN
        du(1) = ( u(2) - u(SizeU - 1) ) / ( 2*dx );
        
        du(SizeU) = du(1); % Renember: u1 = uN
        
    case 'foward'
               
        % ************************************************ 
        % IMPLEMENTAR DERIVADA NUMERICA AQUI
        % ************************************************
        
    % In case the user doesn't choose an implemented time marching scheme
    otherwise
        error(['Differentiation scheme identified as ', ...
            TimeMarchingSchemeIdentifier, ' not implemented!']);
        
        

end