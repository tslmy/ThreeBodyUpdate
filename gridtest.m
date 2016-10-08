x = 0:0.01:20;
m=logsig(10*(x-0.5))
y=2*exp(x).*x-2.2026e+05
z=exp(x).*x
s=y-z
plot(x,y)
hold on
plot(x,z)
grid on