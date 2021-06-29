function prediction =  predict(x, cellW)

  prediction = 0;
  cellWLength = size(cellW, 2);

  [ cellZ, cellA ] = forwardProp(cellW, x);

  a = cellA{cellWLength + 1};

  prediction =  a >= 0.5;

end
