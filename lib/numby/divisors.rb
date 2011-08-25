require 'prime'

class Integer
  def each_divisor(&block)
    raise ArgumentError if self == 0
    division = self.abs.prime_division
    primes = division.map &:first
    max_powers = division.map &:last
    Enumerator.new do |y|
      self.class.generate_powers(max_powers) do |powers|
        new_division = primes.zip(powers)
        divisor = Prime.int_from_prime_division(new_division)
        y.yield divisor
      end
    end.each(&block)
  end

private

  def self.generate_powers(max_powers, &block)
    n = max_powers.size
    powers = Array.new(n, 0)
    Enumerator.new do |y|
      while true
        y.yield powers
        i = 0
        while i < n and powers[i] == max_powers[i]
          powers[i] = 0
          i += 1
        end
        break if i >= n
        powers[i] += 1
      end
    end.each(&block)
  end
end
