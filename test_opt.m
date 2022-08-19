clear;
% init data
test_init();
% simulate code
% if use r2015 version, need to replace with test_opt_solver_2015
sim('test_opt_solver_2022',[]);
% show result
test_plot();