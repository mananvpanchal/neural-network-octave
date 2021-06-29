function [ grad ] = backwardProp2(cellW, cellZ, cellA, delC_a)

  grad = cell();

  cellWLength = size(cellW, 2);

  for l = (cellWLength + 1):-1:2

    w = cellW{l - 1};
    z = cellZ{l};
    a = cellA{l - 1};

    delA_z = sigmoidGradient(z);
    delZ_a_ = w';
    delZ_w = [1; a]';

    delC_w = (delA_z .* delC_a)  * delZ_w;

    if l > 1

      delC_a_ = delZ_a_ * (delA_z .* delC_a);

      delC_a = delC_a_(2:end, :);

    end

    grad{l - 1} = delC_w;

  end

end
