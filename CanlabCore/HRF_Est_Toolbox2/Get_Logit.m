function [h, base] = Get_Logit(V,t)%% [h] = get_logit(V,t)%% Calculate inverse logit (IL) HRF model% Creates fitted curve - 3 logistic functions to be summed together - from parameter estimates%% INPUT: V, t% t = vector of time points% V = parameters%% By Martin Lindquist and Tor Wager% Edited 12/12/06%A1 = V(1);T1 = V(2);d1 = V(3);A2 = V(4);T2 = V(5);A3 = V(6);T3 = V(7);d2 = -d1*(ilogit(A1*(1-T1)) - ilogit(A3*(1-T3)))/(ilogit(A2*(1-T2)) + ilogit(A3*(1-T3)));d3 = abs(d2)-abs(d1);h = d1*ilogit(A1*(t-T1))+d2*ilogit(A2*(t-T2))+d3*ilogit(A3*(t-T3));     % Superimpose 3 IL functionsh = h';base =zeros(3,length(t));base(1,:) = ilogit(A1*(t-T1));base(2,:) = ilogit(A2*(t-T2));base(3,:) = ilogit(A3*(t-T3));return