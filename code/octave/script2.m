n = 11;
z = linspace(0, pi, n);
x = 5 * cos(z);
f = @(t) 1./(1+t.^2);
y = feval(f, x);
plot (x, y, 'o');