function [ y_convolved ] = line_profile_model( p, x, fwhm, n_sampling)
% Written by: 		Bo Zhang (NAOC, bozhang@nao.cas.cn)
% Last modified: 	01-Sep-2016
% 
% Aim:
% 			-
% Example:
% 			-
% 			-
% INPUT:
% 			- p = [p, q, a, b, c, x0]
% 			- fwhm: FWHM of line spread function, for LAMOST it's 3.0
% 			- n_sampling: must be odd int, e.g., 19
% OUTPUT:
% 			-
% 			-
% HISTORY:
% 			-
% 			-

if ~ isrow(x)
    x = x';
end

n_cushion = fix(n_sampling/2);
dx = x(2)-x(1);
x_cushion = (1:n_cushion) * dx;
x_sd1 = (x(1)-dx) - x_cushion(end) + x_cushion;
x_sd2 = (x(end)+dx) - x_cushion(1) + x_cushion;
x_sd = [x_sd1 x x_sd2];

% flux intrinsic
y_intrinsic = ...
    line_profile_intrinsic( p(1), p(2), p(3), p(4), p(5), p(6), x_sd );

% line spread kernel
lsk = line_spread_kernel(fwhm, n_sampling, x_sd);

% flux convolved
y_convolved = conv(y_intrinsic, lsk);

% cut cushion
y_convolved = y_convolved(2*n_cushion+1:end-2*n_cushion);



end

