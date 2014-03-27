function[int_states] = int_state(state)
[dummy, m] = size(state);
for i = 1:m
    vect(i) = 2^(m-i);
end
state;

int_states = state * vect';