function W = randomWeights_(L_in, L_out)
    epsilon  = (6^(1/2)) / (L_in + L_out);

    W = rand(L_out, L_in + 1) * 2 * epsilon - epsilon;
end
