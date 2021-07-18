function [ J, cellW ] = neuralNetwork(X, cellW, y, iteration, alpha, lambda = 0)

  cellWLength = size(cellW, 2);

  for it = 1:iteration

    [ J, gradient ] = costFunction(X, cellW, y, lambda);

    for l = 1:cellWLength

      cellW{l} = cellW{l} - alpha * gradient{l};

    end

    printf('Cost %f at iteration %d\n', J, it);

  end

end
