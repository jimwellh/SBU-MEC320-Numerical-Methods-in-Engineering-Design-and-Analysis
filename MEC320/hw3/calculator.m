problem.objective = @(x)3/20*(1-x)-10*x^3/(1-x)+1.75;
problem.x0 = 2;
problem.solver = 'fzero'; % a required part of the structure
problem.options = optimset(@fzero); % default options

