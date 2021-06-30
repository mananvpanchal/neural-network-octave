function evaluation(X, cellW, y)

  p = zeros(size(X, 1), 1);

  m = size(X, 1);

  for mi = 1:m
    prediction = predict(X(mi, :)', cellW);
    if sum(prediction == y(mi, :)') == length(prediction)
      p(mi, :) = 1;
    end;
  end
  
  fprintf('\nTraining Set Accuracy: %f\n', mean(p) * 100);

end
