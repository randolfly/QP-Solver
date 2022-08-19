% load data file
load('scope_PID_data.mat')


lk = load_data{3,1}(:,1:6);
l_star = load_data{3,1}(:,7:12);

p_start = 45101;
p_end = p_start + 5000;

t = [0:0.002:10]';

