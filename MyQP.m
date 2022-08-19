function [X_opt,Iteration] = MyQP(H,L,A,b,Aeq,beq,x0,MaxIt,Tol)
%@ min 1/2X'HX+LX
%@ s.t. AX<=b. lb<=X<=ub
%@      AeqX=beq
    MaxIterations = MaxIt; %% 50
    Tolerance = Tol; %% 1e-8
%     n1 = size(lb,1); % if no left bound, ub = 0
%     Ai = [A;eye(n1);-eye(n1)];
%     bi = [b;ub;-lb]; % add bounds
    Ai = A;
    bi = b;
    ne = size(Aeq,1);
    ni = size(Ai,1);
    workset = zeros(ni,1);
    workset(end) = 1;
    x = x0;
   
    %%%%%%%%%%%  iterative solver
    for k = 1:MaxIterations
        a_ = [Aeq;Ai(workset==1,:)];
        b_ = [beq;bi(workset==1,:)];
        [x1,lambda] = kkt(H,L,a_,b_);
        error = x1-x;
        min_lambda=0;
        index = -1;
        if norm(error,2) < Tolerance   
        % already get validate solution
            x = x1;
            if length(lambda) > ne
               [min_lambda,index] = min(lambda(ne+1:end));
            end
            if min_lambda >=0 
                break; % satisfy kkt, get optimized solution
            else
                % find new workset£¬delete smallest lambda term
              for i=1:ni
                if workset(i)&&sum(workset(1:i))==index
                    workset(i)=0;
                    break;
                end
              end
            end
        else 
        % not optimized
            [alpha,index] = Alpha(workset, x, error, Ai, bi);
            x = x + alpha * error;
            if alpha<1  % add new bound term
                workset(index)=1;
            end
        end 
    end
    X_opt = x;
    Iteration = k;
    
% ref https://zhuanlan.zhihu.com/p/208612483
% ref https://blog.csdn.net/hxudhdjuf/article/details/112374967
end




    