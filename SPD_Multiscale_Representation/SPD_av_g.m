function M = SPD_av_g(t,P,Q)
% Status: DONE.
%----------------------------------------------------%
% Function that calculates the geodesic average of 2 SPD
% given 0<=t<=1. M=P for t=0, M=Q for t=1.
%--------------% function %--------------------------%

if check_if_SPD(P)==1 || check_if_SPD(Q)==1
    error('One matrix is not SPD\n');
end

LR   =  mpower(P,-1/2);
mid  =  LR*Q*LR;

LR   =  mpower(P,1/2);
M    =  LR*mpower(mid,t)*LR;


end
