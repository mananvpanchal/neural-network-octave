function prediction =  predict(x, cellW, displayFn = @defaultDisplay)

  cellA = forwardProp(cellW, x, displayFn);

  cellWLength = size(cellW, 2);
  a = cellA{cellWLength + 1};

  prediction =  a >= 0.5;

end
