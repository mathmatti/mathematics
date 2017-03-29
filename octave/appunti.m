# row vector
r = [1,2,3];

# column vector
c = [1,2,3];


c = [1/2, 0];
integral = polyint (c);
area = polyval (integral, 1) - polyval (integral, 0)

function y = f (x)
  y = 1/cos(x)^2;
endfunction

[q, ier, nfun, err] = quad ("f", 0, 1);