function pred = evaluation(X, cellW, y)

  pred = 0;
  p = zeros(size(X, 1), 1);

  m = size(X, 1);

  for mi = 1:m
    prediction = predict(X(mi, :)', cellW);
    prediction(prediction > 0.5) = 1;
    prediction(prediction <= 0.5) = 0;
    if sum(prediction == y(mi, :)') == length(prediction)
      p(mi, :) = 1;
    end;
  end

  pred = mean(p) * 100;

end
