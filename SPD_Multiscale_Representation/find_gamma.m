function gamma = find_gamma(alpha, eps)
% Status: DONE.
%---------------------------------------------------------------%
% Given a mask alpha_ev, the function returns its associated
% reversed mask, gamma. 10^(-eps) is the threshold for filtering.
%------------------------function-------------------------------%
%
GammaLength = 100;   % Fixing a maximum size
L           = length(alpha);

zero_pad_size = floor((GammaLength-L)/2);
zero_pad      = zeros(zero_pad_size,1);

padded_vec    =[zero_pad;alpha;zero_pad];

gamma_mask = ifft( 1./fft(padded_vec) ); % plot(abs(fft(padded_vec)))

%fprintf('The mask: \n')

% Filtering the data that are larger than the threshold epsilon:
% Finding the places to fill
indices = zeros(length(gamma_mask), 1);
for k=1:length(indices)
    if abs(gamma_mask(k)) > 10^(-eps)
        indices(k) = 1;
    end
end

% Filling the places
res = zeros(length(gamma_mask), 1);
for k=1:length(res)
    if indices(k) == 1
        res(k) = gamma_mask(k);
    end
end

% Compact support
supp_min = find(res ~= 0, 1, 'first');
supp_max = find(res ~= 0, 1, 'last');

% Printing the data
%fprintf('[');
for j=1:numel(res)
        if j==length(res)
        %    fprintf('%1.4f ] \n',res(j));
        else
        %    fprintf('%1.4f, ',res(j));
        end        
end

gamma=res(supp_min:supp_max);
%gamma = res;

end




