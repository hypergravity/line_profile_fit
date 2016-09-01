function [ lsk ] = line_spread_kernel( fwhm, n_sampling, x )
% Written by: 		Bo Zhang (NAOC, bozhang@nao.cas.cn)
% Last modified: 	30-Aug-2016
% 
% Aim:
% 			-
% Example:
% 			-
% 			-
% INPUT:
% 			-
% 			-
% OUTPUT:
% 			-
% 			-
% HISTORY:
% 			-
% 			-

% fwhm = 3.0;
% x = 6500:6600;
% n_sampling = 20;

% FWHM --> sigma
sigma = fwhm/(2*sqrt(2*log(2)));

% Line Spread Function
lsf = @(sigma, x)(exp(-(x/sigma).^2/2));


% ASSUME x is evenly separated, e.g., 1A
dx = x(2)-x(1);
if ~all(diff(x)==1)
    warning('@Cham: sampling wavelength is not evenly separated! d_wave currently in use: %.3f ', dx);
end

% check number of sampling points of kernel
% (odd is simple, even is slightly more difficult)
% n_sampling = 15;
if n_sampling*dx<3*fwhm
    % n_sampling is not large enough
    warning('@Cham: N_SAMPLING is not large enough! N_SAMPLING > %d is required ', fix(3*fwhm/dx));
end

% sample kernel
x_sampling = linspace(-(n_sampling-1)/2, (n_sampling-1)/2, n_sampling)*dx;
lsk = lsf(sigma, x_sampling);

% normalize kernel
lsk = lsk/sum(lsk);


%%
% figure; plot(x_sampling, lsk)



end

