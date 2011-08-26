require 'spec_helper'

describe Integer, '#each_divisor' do
  context 'without block' do
    it 'returns all divisors for positive non-prime number' do
      60.each_divisor.to_a.should =~ [1,2,3,4,5,6,10,12,15,20,30,60]
    end

    it 'returns two divisors for positive prime number' do
      17.each_divisor.to_a.should =~ [1, 17]
    end

    it 'return 1 for 1' do
      1.each_divisor.to_a.should =~ [1]
    end

    it 'should fail for 0' do
      expect { 0.each_divisor }.to raise_error(ArgumentError)
    end

    it 'should ignore sign' do
      -12.each_divisor.to_a.should =~ [1,2,3,4,6,12]
    end
  end

  context 'with block' do
    it 'should execute block on each divisor' do
      count = 0
      12.each_divisor { count += 1 }
      count.should == 6
    end
  end

  context 'and big numbers too!' do
    let(:big_number) { 7 ** 20 }

    it 'should find divisors for big number' do
      big_number.each_divisor.to_a.should =~ (0..20).map{|p| 7**p}
    end
  end
end
