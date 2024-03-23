tspan = [0 1];
y0 = [2;4];


[t,y] = ode45(@myODE, tspan, y0)

function dy = myODE(t,y)
  dy(1) = -2*y(1)+4*exp(-1*t(1));
  dy(2) = -y(1)*y(2)^2/3;
end

