function [ C, grad ] = costFunction_(x, cellW, y)

  [ cellA, cellZ ] = forwardProp(cellW, x);

  cellWLength = size(cellW, 2);
  a = cellA{cellWLength + 1};
  C = (( - y' * log(a)) - ((1 - y') * log(1 - a))) / size(y, 1);
  delC_a = (-y ./ a) + ((1 - y) ./ (1 - a));

  grad = backwardProp(cellW, cellZ, cellA, delC_a);

end
