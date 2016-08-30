function [ y ] = line_profile_intrinsic( p, q, a, b, c, x0, x )
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

y = line_profile_intrinsic_cont(p, q, x) ...
    .* line_profile_intrinsic_line(a, b, c, x0, x);

end

