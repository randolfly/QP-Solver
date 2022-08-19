### Code Info

This folder `code` contains source code of the QP Solver which uses the **interior point method** to solve a **QCQP** (Quadratic Constrains Quadratic Programing) problem.

The Simulation version is MATLAB R2022A, we also provide the lower version of MATLAB R2015A.

Inside this folder, the code and its meaning is following:

1. `Alpha.m`: get term `alpha` and `index` 

2. `kkt.m`: calculate the kkt condition

3. `MyQP.m`: the QP Solver applied to solve problem

4. `test_init.m`: the initialize code (provide data) of  simulation `test_opt_solver_2022`

5. `test_plot.m`: plot the solve result

6. `test_opt_solver_2022.slx`: the test simulation file

7. `opt_solver_2022.slx`: the simulink file used to generate library, used in our work, **DO NOT NEED TO USE**

8. `scope_PID_data.mat`: the real data get from experiments, used to validate QP Solver

9. `test_opt.m`: the code used to invoke `test_opt_solver_2022.slx` and simulate data, **THE ONL FILE NEED TO USE FOR TEST**

   1. Note that there may be warning about `TwinCAT.tlc`, which is the tlc file need to generate library in our project, can be ignored

   ​

If need to test file, you just need to invoke `test_opt.m`, and if the version is too high, you can choose to use the lower version MATLAB R2015A inside folder `simulink_r2015a`, and replace the call inside `test_opt.m`

