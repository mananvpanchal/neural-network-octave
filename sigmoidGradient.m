function delA_z = sigmoidGradient(z)

  delA_z = zeros(size(z));

  a = sigmoid(z);

  delA_z = a .* (1 - a);

end
