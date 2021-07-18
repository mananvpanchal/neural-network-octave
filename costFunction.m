function [ J, gradient ] = costFunction(X, cellW, y, lambda)

  J = 0;
  m = size(X, 1);
  cellWLength = size(cellW, 2);

  cellW_new = cell();
  gradient = cell();

  regJ = 0;

  for l = 1:cellWLength
    gradient{l} = zeros(size(cellW{l}));
    cellW_new{l} = [zeros(size(cellW{l}, 1), 1) cellW{l}(:, 2:end)];
    regJ = regJ + sum(sum(cellW_new{l} .^ 2));
  end;

  for mi = 1:m

    [ C, grad ] = costFunction_(X(mi, :)', cellW, y(mi, :)');

    J = J + C;

    for l = 1:cellWLength
      gradient{l} = gradient{l} + grad{l};
    end

  end

  J = (J / (2 * m)) + (regJ * (lambda / (2 * m)));

  for l = 1:cellWLength

    gradient{l} = (gradient{l} / m) + (cellW_new{l} * (lambda / m));

  end

end
