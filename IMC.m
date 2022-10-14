function [k_p, T_i] = IMC(object)
%IMC Find settings k_p and T_i for PI regulator
%   object - first order transfer function of regulated object

if size(object.Denominator) > 2
    disp("Error: bad object - not first order object")
    return
end

% TODO: refactor
k = object.Numerator{1, 1}(2);
T_c = 0; % TODO: figure out what is this leaving 0 for now
T_0 = object.inputDelay;
T = object.Denominator{1, 1}(1);

k_p = T / (k * (T_c + T_0));
T_i = min(T, 4 * (T_c + T_0));