function [hard_state] = bin_state (int_state, m)

for i = m: -1 :1
    state(m-i+1) = fix(int_state/(2^(i-1)));
    int_state = int_state-state(m-i+1) * 2^(i-1);
end
hard_state = state;
