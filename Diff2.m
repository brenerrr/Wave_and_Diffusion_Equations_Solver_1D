function ddu = Diff2(u, SizeU, dx, DifferentiationSchemeIdentifier)

% Initialize du 
ddu = zeros(1, SizeU);

switch DifferentiationSchemeIdentifier
    
    case 'centered' 
        
        % Calculate derivatives which don't need boundary conditions
        for i = 2:SizeU-1
           % ************************************************ 
           % IMPLEMENTAR DERIVADA SEGUNDA NUMERICA AQUI
           % ************************************************
        end
        
        % Boundary condition: ddu = 0 at boundaries     
        ddu(1) = 0;
        ddu(SizeU) = 0;
        
    % In case the user doesn't choose an implemented time marching scheme
    otherwise
        error(['Differentiation scheme identified as ', ...
            TimeMarchingSchemeIdentifier, ' not implemented! (Second Derivative)']);
        
        

end