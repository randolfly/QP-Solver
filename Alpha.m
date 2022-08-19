function [alpha,index] = Alpha(workset,x,s,Ai,bi)
    outset = find(workset == 0);
    Atp = Ai(outset,:)*s;
    Atp_index = Atp>0;
    out_plus_ind = outset(Atp_index);
    alphaset = (bi(out_plus_ind) - Ai(out_plus_ind,:)*x)./Atp(Atp_index);
    [alpha,index] = min([alphaset;1]);
    if alpha<1
        index = out_plus_ind(index);
    end
end