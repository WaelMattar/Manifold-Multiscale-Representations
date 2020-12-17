function flag = check_if_SPD(M)
%
%-----------------------------------------------------%
% Function checks if the input in SPD
% flag = 0 if M is SPD, flag = 1 if M isn't SPD
%------------- function ------------------------------%
m=eig(M); flag = 0;
if M~=transpose(M)
    flag = 1;
end
for i=1:size(m)
     if m(i) <= 0
         flag = 1;
     end
end
if flag == 1
    fprintf('One matrix is not a SPD \n');
    return
end
end






