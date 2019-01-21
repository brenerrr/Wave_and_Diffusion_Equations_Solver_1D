
function y = InitialCondition(Identifier, x, k)


switch Identifier
    case 'sine'
        y = sin(k*x);
        
    case 'gaussian'
        y = 1./(10*k*x.^2+1);
        
    case 'step'
        y = tanh(x*k)+1;
        
    otherwise 
        error(['Initial condition ', Identifier, ' not implemented'])
end