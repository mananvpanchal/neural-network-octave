function [ cellA, cellZ ] = forwardProp(cellW, a)

  cellA = cell();
  cellZ = cell();

  cellZ{1} = zeros(size(a), 1);
  cellA{1} = a;

  cellWLength = size(cellW, 2);

  for l = 1:cellWLength

    w = cellW{l};

    z = w * [1; a];
    a = sigmoid(z);

    cellZ{l + 1} = z;
    cellA{l + 1} = a;

  end

end
