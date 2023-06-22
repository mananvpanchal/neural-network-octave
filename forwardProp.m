function [ cellA, cellZ ] = forwardProp(cellW, a, displayFn)

  displayFn(a);

  cellA = cell(); % creating new cell for 'a' vectors
  cellZ = cell(); % creating new cell for 'z' vectors

  cellZ{1} = zeros(size(a), 1); % creating 'z' vector with size of a with zeros (as inpput layer does not have 'z')
  cellA{1} = a; % creating copy of 'a' vector

  cellWLength = size(cellW, 2);

  for l = 1:cellWLength

    w = cellW{l};

    z = w * [1; a]; % multiplying weights with activations along with bias node '1'
    a = sigmoid(z); % sigmoid function which can calculate 'a' based on 'z'

    cellZ{l + 1} = z; % setting calculated 'z' vector to next index in cell
    cellA{l + 1} = a; % setting calculated 'z' vector to next index in cell

    displayFn(cellA{l + 1});

  end

end
