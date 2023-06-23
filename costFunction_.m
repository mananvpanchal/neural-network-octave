function [ C, grad ] = costFunction_(x, cellW, y)

  [ cellA, cellZ ] = forwardProp(cellW, x, @defaultDisplay); % forward propogation returns cell of activation vectors and 'z' vectors

  cellWLength = size(cellW, 2);
  a = cellA{cellWLength + 1}; % geting last activation vector

  C = (( - y' * log(a)) - ((1 - y') * log(1 - a))) / size(y, 1); % calculating 'C' cost
  delC_a = (-y ./ a) + ((1 - y) ./ (1 - a)); % calculating dC/da by derivating 'C' over 'a'

  grad = backwardProp(cellW, cellZ, cellA, delC_a); % backward propogation

end
