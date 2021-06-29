function cellW = randomWeights(X, hidden, y)

  cellW = cell();

  L_in = size(X, 2);

  for h = 1:length(hidden);
    L_out = hidden(h);
    cellW{h} = randomWeights_(L_in, L_out);
    L_in = L_out;
  end

  cellW{length(hidden) + 1} = randomWeights_(L_in, size(y, 2));

end
