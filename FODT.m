function G_S = FODT(var_zeros, var_poles, k, tau, T_p)
%FODT Approximate FODT from given transfer function in polynomial form
%   zeros - Vector of all T^L in order 1...j
%   poles - Vector of all T in order 1...n
%   k - gain factor
%   tau - input delay
%   T_p - sampling period (0 for continuous objects)

s = tf('s');

if  size(var_poles) > 2
    T_h = sum(var_poles(3:end)) + sum(var_zeros);
else
    T_h = 0;
end


T_hat = var_poles(1) + var_poles(2)/2;
T_zhat = tau + var_poles(2)/2 + T_h + T_p/2;

G_delay = tf(1,1,'inputDelay', T_zhat);
G_S = k/(s*T_hat + 1) * G_delay;

end

