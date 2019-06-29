function deriv=derivsigmoid(err)
  deriv=err.*(1-err);
end