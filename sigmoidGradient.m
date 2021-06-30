function delA_z = sigmoidGradient(z)

  delA_z = zeros(size(z));

  g = sigmoid(z);

  delA_z = g .* (1 - g);

end
