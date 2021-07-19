function grad = backwardProp(cellW, cellZ, cellA, delC_a)

  grad = cell(); % creating gradient cell

  cellWLength = size(cellW, 2);

  for l = (cellWLength + 1):-1:2 % looping from backward till second layer (here we take [cellWLength + 1] because cell length of weights are 1 unit less that activation's cell)

    w = cellW{l - 1}; % getting weights matrix
    z = cellZ{l}; % getting 'z' vector
    a = cellA{l}; % getting 'a' vector
    a_ = cellA{l - 1}; % getting previous layer 'a' vector

    delA_z = sigmoidGradient(a); % calculating derivative of sigmoid da/dz
    delZ_a_ = w'; % setting w transpose to dz/da (here 'da' is difference in previous layer activations)
    delZ_w = [1; a_]'; % setting previous'a' transpose to dz/dw adding '1' bias node

    delC_w = (delC_a .* delA_z)  * delZ_w; % calculating dC/dw = (dC/da)(da/dz)(dz/dw)

    if l > 1

      delC_a_ = delZ_a_ * (delA_z .* delC_a); % calculating dC/da- = (dz/da-)(da/dz)(dC/da) (here 'a-' indicates previous layers activations)

      delC_a = delC_a_(2:end, :); % setting dC/da- to dC/da without bias node to be used as previous value in next iteration

    end

    grad{l - 1} = delC_w; % setting new gradients

  end

end
