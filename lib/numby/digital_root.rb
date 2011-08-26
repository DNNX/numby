class Integer
  DEFAULT_BASE = 10

  def digital_root(base = DEFAULT_BASE)
    self.class.check_base(base)
    n = abs
    n = n.sum_of_digits(base) while n >= base
    n
  end

  def sum_of_digits(base = DEFAULT_BASE)
    each_digit(base).inject(0, :+)
  end

  def each_digit(base = DEFAULT_BASE, &block)
    self.class.check_base(base)
    Enumerator.new do |y|
      y.yield 0 if zero?
      n = abs
      while n > 0
        n, d = n.divmod base
        y.yield d
      end
    end.each(&block)
  end

private
  def self.check_base(base)
    raise ArgumentError.new(:base) unless base > 1
  end
end
