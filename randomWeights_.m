function W = randomWeights_(L_in, L_out)
    epsilon  = (6^(1/2)) / (L_in + L_out);

    W = rand(L_out, 1 + L_in) * 2 * epsilon - epsilon;
end
