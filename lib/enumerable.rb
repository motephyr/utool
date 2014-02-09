module Enumerable
  def partial_inject(initial_value, &block)
    self.inject([initial_value, [initial_value]]) do |(accumulated, output), element|
    new_value = yield(accumulated, element)
    [new_value, output << new_value]
    end[1]
  end
end

