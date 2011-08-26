module Enumerable
  def sum
    inject(0, :+) 
  end

  def mult
    inject(1, :*)
  end
end
