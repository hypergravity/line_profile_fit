function [ y ] = line_profile_intrinsic_line( a, b, c, x0, x)
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


y = 1.0 - a*exp(-(abs(x-x0)/b).^c);


%% test
% x = 6500:6600;
% y = line_profile_intrinsic(0.2, 10, 2.5, 6563, x);
% figure; plot(x, y)

end

