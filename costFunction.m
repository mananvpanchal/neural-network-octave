function [ J, gradient ] = costFunction(X, cellW, y, lambda)

  J = 0;
  m = size(X, 1);
  cellWLength = size(cellW, 2); % get cell length to know how many weight matrix are there

  cellW_new = cell(); % creating cell to contain weights matrix for regularization
  gradient = cell(); % creating cell to contain gradient matrix

  regJ = 0;

  for l = 1:cellWLength
    gradient{l} = zeros(size(cellW{l})); % intialize gradient matrix with zeros with same size as weights
    cellW_new{l} = [zeros(size(cellW{l}, 1), 1) cellW{l}(:, 2:end)]; % creating copy of weights but without first column from each matrix
    regJ = regJ + sum(sum(cellW_new{l} .^ 2)); % sum all weights without fist column from each matrix
  end;

  for mi = 1:m

    [ C, grad ] = costFunction_(X(mi, :)', cellW, y(mi, :)'); % cost function for each train example

    J = J + C;

    for l = 1:cellWLength
      gradient{l} = gradient{l} + grad{l}; % accumulating gradient
    end

  end

  J = (J / (2 * m)) + (regJ * (lambda / (2 * m))); % calculating 'J' with regularization

  for l = 1:cellWLength

    gradient{l} = (gradient{l} / m) + (cellW_new{l} * (lambda / m)); % calculating gradient with regularization

  end

end
