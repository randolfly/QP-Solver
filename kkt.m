function [x_kkt,lambda] = kkt(H,L,Aeq1,beq1)
    % test kkt condition
    ws = size(Aeq1,1);
    kkt_A = [H , Aeq1'; Aeq1, zeros(ws,ws)];
    kkt_B = [-L; beq1];
    slambda = pinv(kkt_A)*kkt_B;
    dim = size(H,2);
    x_kkt = slambda(1:dim);
    lambda = slambda(dim+1:end);
end
