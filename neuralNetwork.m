function [ J, cellW ] = neuralNetwork(X, cellW, y, iteration, alpha, lambda = 0)

  cellWLength = size(cellW, 2); % get cell length to know how many weight matrix are there

  for it = 1:iteration

    [ J, gradient ] = costFunction(X, cellW, y, lambda); % cost function

    for l = 1:cellWLength

      cellW{l} = cellW{l} - alpha * gradient{l}; % calculating new weights based on learning rate 'alpha' and gradient

    end

    printf('Cost %f at iteration %d\n', J, it);

  end

end
