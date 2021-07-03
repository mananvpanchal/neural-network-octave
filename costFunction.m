function [ J, gradient ] = costFunction(X, cellW, y)

  J = 0;
  m = size(X, 1);
  cellWLength = size(cellW, 2);

  gradient = cell();

  for l = 1:cellWLength
    gradient{l} = zeros(size(cellW{l}));
  end;

  for mi = 1:m

    [ C, grad ] = costFunction_(X(mi, :)', cellW, y(mi, :)');

    J = J + C;

    for l = 1:cellWLength
      gradient{l} = gradient{l} + grad{l};
    end

  end

  J = J / (2 * m);

  for l = 1:cellWLength

    gradient{l} = gradient{l} / m;

  end

end
