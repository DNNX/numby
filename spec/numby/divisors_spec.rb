require 'spec_helper'

describe Integer, '#each_divisor' do
  context 'without block' do
    {   60 => [1,2,3,4,5,6,10,12,15,20,30,60], # positive non-prime
        17 => [1, 17],                         # prime
         1 => [1],                             # special case
       -12 => [1,2,3,4,6,12],                  # ignore sign
       7**20 => (0..20).map{|p| 7**p}          # and big numbers too!
    }.each do |number, divisors|
      it "#{number}.each_divisor should consist of #{divisors.join ' '}" do
        number.each_divisor.to_a.should =~ divisors
      end
    end

    it 'should fail for 0' do
      expect { 0.each_divisor }.to raise_error(ArgumentError)
    end
  end

  context 'with block' do
    it 'should execute block on each divisor' do
      count_of_block_calls = 0
      12.each_divisor { count_of_block_calls += 1 }
      count_of_block_calls.should == 6  # [1, 2, 3, 4, 6, 12]
    end
  end
end
