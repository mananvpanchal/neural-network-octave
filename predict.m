function prediction =  predict(x, cellW)

  cellA = forwardProp(cellW, x);

  cellWLength = size(cellW, 2);
  a = cellA{cellWLength + 1};

  prediction =  a >= 0.5;

end
